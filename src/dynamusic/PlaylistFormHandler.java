package dynamusic;

import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.servlet.ServletException;
import java.io.IOException;

/**
 * Created by Administrator on 2/8/2018.
 */
public class PlaylistFormHandler extends RepositoryFormHandler {
    private String songId;
    private String userId;
    private String playlistId;
    private String addSongSuccessURL;
    private String addSongErrorURL;
    private PlaylistManager playlistManager;

    public PlaylistManager getPlaylistManager() {
        return playlistManager;
    }

    public void setPlaylistManager(PlaylistManager playlistManager) {
        this.playlistManager = playlistManager;
    }

    public String getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(String playlistId) {
        this.playlistId = playlistId;
    }

    public String getSongId() {
        return songId;
    }

    public void setSongId(String songId) {
        this.songId = songId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddSongSuccessURL() {
        return addSongSuccessURL;
    }

    public void setAddSongSuccessURL(String addSongSuccessURL) {
        this.addSongSuccessURL = addSongSuccessURL;
    }

    public String getAddSongErrorURL() {
        return addSongErrorURL;
    }

    public void setAddSongErrorURL(String addSongErrorURL) {
        this.addSongErrorURL = addSongErrorURL;
    }

    @Override
    protected void postCreateItem(DynamoHttpServletRequest pRequest, DynamoHttpServletResponse pResponse) throws ServletException, IOException {
        if (isLoggingDebug()) {
            logDebug("postCreateItem called, item created: " + getRepositoryItem());
        }
        PlaylistManager pm = getPlaylistManager();
        if (pm != null) {
            pm.addPlaylistToUser(getRepositoryId(), getUserId());
        } else {
            if (isLoggingWarning()) {
                logWarning("no playlist manager set");
            }
        }
    }

    public boolean handleAddSong(DynamoHttpServletRequest request, DynamoHttpServletResponse response) throws IOException {
        if (isLoggingDebug()) {
            logDebug("handleAddSong called");
        }

        PlaylistManager pm = getPlaylistManager();
        pm.addSongToPlaylist(playlistId, getSongId());

        if (getFormError()) {
            if (isLoggingDebug()) {
                logDebug("song not added");
            }
            if (getAddSongErrorURL() != null) {
                if (isLoggingDebug()) logDebug("redirecting to " + getAddSongErrorURL());
                response.sendLocalRedirect(getAddSongErrorURL(),request);
                return false;
            }
            else return true;
        }
        if (isLoggingDebug()){
            logDebug("song added");
        }
        if (getAddSongSuccessURL() != null) {
            if (isLoggingDebug()){
                logDebug("redirecting to " + getAddSongSuccessURL());
            }
            response.sendLocalRedirect(getAddSongSuccessURL(), request);
            return false;
        }
        return true;

    }


}

