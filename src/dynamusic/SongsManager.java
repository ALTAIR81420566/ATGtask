package dynamusic;
import atg.repository.*;
import atg.repository.rql.RqlStatement;


/**
 * Created by Administrator on 1/31/2018.
 */
public class SongsManager extends atg.nucleus.GenericService {
    private Repository songRepo;
    private Repository eventRepo;

    public Repository getEventRepo() {
        if(isLoggingDebug()){
            logDebug("getEventRepo");
        }
        return eventRepo;
    }

    public void setEventRepo(Repository eventRepo) {
        if(isLoggingDebug()){
            logDebug("setEventRepo");
        }
        this.eventRepo = eventRepo;
    }

    public Repository getSongRepo() {
        if(isLoggingDebug()){
            logDebug("getSongRepo");
        }
        return songRepo;
    }

    public void setSongRepo(Repository songRepo) {
        if(isLoggingDebug()){
            logDebug("setSongRepo");
        }
        this.songRepo = songRepo;
    }

    private void deleteItem(String pArtistId, Repository repo, String itemName, String rqlStatement)  throws RepositoryException {
        RqlStatement findItemsRQL;
        RepositoryView view = repo.getView(itemName);

        Object rqlparams[] = new Object[1];
        rqlparams[0] = pArtistId;

        findItemsRQL= RqlStatement.parseRqlStatement(rqlStatement);
        RepositoryItem itemList[] = findItemsRQL.executeQuery(view,rqlparams);

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

    public void deleteAlbumsByArtist(String pArtistId) throws RepositoryException{
        deleteItem(pArtistId,getEventRepo(),"concert","artists INCLUDES ITEM (id = ?0)");
        deleteItem(pArtistId,getSongRepo(),"album","artist.id = ?0");
    }


    public SongsManager() {
    }
}
