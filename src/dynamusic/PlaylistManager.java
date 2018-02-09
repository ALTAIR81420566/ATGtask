package dynamusic;

import atg.dtm.TransactionDemarcation;
import atg.dtm.TransactionDemarcationException;
import atg.nucleus.GenericService;
import atg.repository.*;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;
import java.util.Set;

/**
 * Created by Administrator on 2/8/2018.
 */
public class PlaylistManager extends GenericService {
    private Repository userRepo;
    private Repository songRepo;
    private TransactionManager transactionManager;

    public TransactionManager getTransactionManager() {
        return transactionManager;
    }

    public void setTransactionManager(TransactionManager transactionManager) {
        this.transactionManager = transactionManager;
    }

    public Repository getUserRepo() {
        return userRepo;
    }

    public void setUserRepo(Repository userRepo) {
        this.userRepo = userRepo;
    }

    public Repository getSongRepo() {
        return songRepo;
    }

    public void setSongRepo(Repository songRepo) {
        this.songRepo = songRepo;
    }

    public void addPlaylistToUser(String pPlaylistId, String pUserId) {
        if (isLoggingDebug()) {
            logDebug("adding playlist " + pPlaylistId + " to user " + pUserId);
        }
        try {
            TransactionDemarcation td = new TransactionDemarcation();
            try {
                td.begin(transactionManager, td.REQUIRED);
                MutableRepository userMutRepo = (MutableRepository) getUserRepo();
                RepositoryItem playlist = userMutRepo.getItem(pPlaylistId, "playlist");
                MutableRepositoryItem user = userMutRepo.getItemForUpdate(pUserId, "user");

                Set playlistSet = (Set) user.getPropertyValue("playlists");

                playlistSet.add(playlist);

                user.setPropertyValue("playlists", playlistSet);
                userMutRepo.updateItem(user);
            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Cannot add playlist to user", e);
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

    public void addSongToPlaylist(String pPlaylistId, String pSongId) {
        if (isLoggingDebug()) {
            logDebug("adding song " + pSongId + " to playlist " + pPlaylistId);
        }
        try {
            MutableRepository userRep = (MutableRepository) getUserRepo();
            Repository songsRep = getSongRepo();
            TransactionDemarcation td = new TransactionDemarcation();
            try {
                MutableRepositoryItem playlist = userRep.getItemForUpdate(pPlaylistId, "playlist");
                Set playlistSet = (Set) playlist.getPropertyValue("songs");

                RepositoryItem song = songsRep.getItem(pSongId, "song");
                playlistSet.add(song);

                userRep.updateItem(playlist);

            } catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Cannot add song to playlist", e);
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
}
