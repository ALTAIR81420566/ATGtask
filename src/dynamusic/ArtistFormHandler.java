package dynamusic;

import atg.droplet.*;
import atg.repository.*;
import atg.servlet.*;

import javax.servlet.ServletException;
import java.io.IOException;

/**
 * Created by Administrator on 2/1/2018.
 */
public class ArtistFormHandler extends atg.repository.servlet.RepositoryFormHandler {

    private SongsManager songsManager;

    public SongsManager getSongsManager() {
        return songsManager;
    }

    public void setSongsManager(SongsManager songsManager) {
        this.songsManager = songsManager;
    }

    @Override
    protected void preDeleteItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        super.preDeleteItem(pRequest, pResponse);

        if (isLoggingDebug()) {
            logDebug("preDeleteItem called " + getRepositoryItem());
        }

        SongsManager sm = getSongsManager();

        if (sm != null) {
            try {
                RepositoryItem item = getRepositoryItem();
                String artistid = item.getRepositoryId();
                sm.deleteAlbumsByArtist(artistid);
            }
            catch (RepositoryException e) {
                if (isLoggingError()) {
                    logError("Cannot delete albums by artist", e);
                    addFormException(new DropletException("Cannot delete albums by artist"));
                }
            }
        }
        else {
            if (isLoggingWarning()) {
                logWarning("no songs manager set");
            }
        }
    }
}
