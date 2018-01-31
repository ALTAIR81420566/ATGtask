package dynamusic;
import atg.repository.*;
import atg.repository.rql.RqlStatement;

/**
 * Created by Administrator on 1/31/2018.
 */
public class SongsManager extends atg.nucleus.GenericService {
    private Repository repository;

    public Repository getRepository() {
        if(isLoggingDebug()){
            logDebug("getRepository");
        }
        return repository;
    }

    public void setRepository(Repository repository) {
        if(isLoggingDebug()){
            logDebug("setRepository");
        }
        this.repository = repository;
    }

    public void deleteAlbumsByArtist(String pArtistId) throws RepositoryException{
        Repository repos = getRepository();
        RqlStatement findAlbumsRQL;
        RepositoryView albumView = repos.getView("album");
        Object rqlparams[] = new Object[1];
        rqlparams[0] = pArtistId;
        findAlbumsRQL= RqlStatement.parseRqlStatement("artist.id = ?0");
        RepositoryItem albumList[] = findAlbumsRQL.executeQuery(albumView,rqlparams);
        MutableRepository mutRepos = (MutableRepository) getRepository();
        for(RepositoryItem album : albumList){
            mutRepos.removeItem(album.getPropertyValue("id").toString(), "album");
            if(isLoggingDebug()){
                logDebug("album deleted");
            }
        }

    }

    public SongsManager() {
    }
}
