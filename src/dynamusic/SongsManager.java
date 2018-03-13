package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;


/**
 * Created by Administrator on 1/31/2018.
 */
public class SongsManager extends atg.nucleus.GenericService {
    private Repository songRepo;
    private Repository eventRepo;
    private Repository userRepository = null;
    private TransactionManager transactionManager;

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }

    public Repository getEventRepo() {
        if (isLoggingDebug()) {
            logDebug("getEventRepo");
        }
        return eventRepo;
    }

    public Repository getUserRepository() {
        return userRepository;
    }

    public void setUserRepository(Repository userRepository) {
        this.userRepository = userRepository;
    }

    public void setEventRepo(Repository eventRepo) {
        if (isLoggingDebug()) {
            logDebug("setEventRepo");
        }
        this.eventRepo = eventRepo;
    }

    public Repository getSongRepo() {
        if (isLoggingDebug()) {
            logDebug("getSongRepo");
        }
        return songRepo;
    }

    public void setSongRepo(Repository songRepo) {
        if (isLoggingDebug()) {
            logDebug("setSongRepo");
        }
        this.songRepo = songRepo;
    }

    private void deleteItem(String pArtistId, Repository repo, String itemName, String rqlStatement) throws RepositoryException {
        RqlStatement findItemsRQL;
        RepositoryView view = repo.getView(itemName);

        Object rqlparams[] = new Object[1];
        rqlparams[0] = pArtistId;

        findItemsRQL = RqlStatement.parseRqlStatement(rqlStatement);
        RepositoryItem itemList[] = findItemsRQL.executeQuery(view, rqlparams);

        MutableRepository mutRepos = (MutableRepository) repo;

        if (itemList != null) {
            for (RepositoryItem item : itemList) {

                mutRepos.removeItem(item.getPropertyValue("id").toString(), itemName);
                if (isLoggingDebug()) {
                    logDebug(itemName + " deleted");
                }
            }
        }
    }

    public void deleteAlbumsByArtist(String pArtistId) throws RepositoryException {
        TransactionDemarcation td = new TransactionDemarcation();
        try {
            try {
                td.begin(transactionManager, td.REQUIRED);
                deleteItem(pArtistId, getEventRepo(), "concert", "artists INCLUDES ITEM (id = ?0)");
                deleteItem(pArtistId, getSongRepo(), "album", "artist.id = ?0");
            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("RepositoryException", e);
                }
                transactionManager.setRollbackOnly();
            } finally {
                td.end();
            }
        } catch (TransactionDemarcationException e) {
            if (isLoggingError()) {
                logError("Cannot execute transaction", e);
            }
        } catch (SystemException e) {
            if (isLoggingError()) {
                logError("SystemException", e);
            }
        }
    }



    public void addArtistToSong(String pSongid, String pArtistid) throws RepositoryException {
        if (isLoggingDebug())
            logDebug("adding song " + pSongid + " to artist " + pArtistid);

        MutableRepository mutRepos = (MutableRepository) getSongRepo();

        try {
            MutableRepositoryItem mutSongItem = mutRepos.getItemForUpdate(pSongid,"song");
            RepositoryItem artistItem = mutRepos.getItem(pArtistid,"artist");
            if (isLoggingDebug())
                logDebug("adding song " + mutSongItem + " to artist " + artistItem);
            mutSongItem.setPropertyValue("artist",artistItem);
            mutRepos.updateItem(mutSongItem);

        }
        catch(RepositoryException e) {
            if (isLoggingError()) {
                logError(e);
            }
            throw e;
        }

    }

    public String createArtistFromUser(String pUserid) throws RepositoryException {

        if (isLoggingDebug())
            logDebug("creating new artist from user item " + pUserid);

        MutableRepository mutRepos = (MutableRepository) getSongRepo();
        Repository userRepos = getUserRepository();

        RepositoryItem user = userRepos.getItem(pUserid, "user");
        String username = (String)user.getPropertyValue("firstName") + " " + user.getPropertyValue("lastName");
        String description = (String)user.getPropertyValue("info");
        Boolean shareProfile = (Boolean)user.getPropertyValue("shareProfile");
        RepositoryItem artistItem = null;

      /* First, check if an artist has already been created for this user */
        RqlStatement finduserRQL = RqlStatement.parseRqlStatement("name = ?0");
        RepositoryView artistView = mutRepos.getView("artist");
        Object rqlparams[] = new Object[1];
        rqlparams[0] = username;
        RepositoryItem [] artistList =
                finduserRQL.executeQuery (artistView, rqlparams);


        if (artistList != null) {
            if (isLoggingDebug()) logDebug("artists found for this user:" + artistList.length + " (using artist: " + artistList[0] + ")");
            artistItem = artistList[0];
        }
        else {
            try {
                MutableRepositoryItem mutArtistItem = mutRepos.createItem("artist");
                mutArtistItem.setPropertyValue("name", username);
         /* TBD test shareProfile if (shareProfile) */
                mutArtistItem.setPropertyValue("description",description);
                mutRepos.addItem(mutArtistItem);
                artistItem = mutArtistItem;
                if (isLoggingDebug())
                    logDebug("no artists found for this user, new artist " + mutArtistItem + " created.");

            }
            catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError(e);
                }
                throw e;
            }
        }
        return artistItem.getRepositoryId();
    }

    public SongsManager() {
    }

    public void addSongToAlbum(String repositoryId, String albumId) {

    }
}
