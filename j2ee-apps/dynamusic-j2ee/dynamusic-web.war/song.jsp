<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<%-- Required input param: itemId (id of the song to display --%>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  SONG
  
  Description of an individual song.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Song</TITLE>
  </HEAD>
  <BODY>
  <dsp:droplet name="/dynamusic/SongLookupDroplet">  
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">

    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
          <dsp:include page="common/header.jsp">
            <dsp:param name="pagename" param="element.title"/>
          </dsp:include>

    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="common/sidebar.jsp"></dsp:include>        
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
            
          <table cellpadding="10">
            <tr>
             <td valign="top" align="right"> Song: </td>
             <td valign="top">
               <font face="Courier New"><b> <dsp:valueof param="element.title"/> </b></font>
               &nbsp
               <font size=-2 face="Courier New"><a href="<dsp:valueof param="element.downloadURL"/>">Download</a></font>
             </td>
           </tr>
           <tr>
             <td valign="top" align="right"> Artist: </td>
             <td valign="top">
               <font face="Courier New"><b>
                 <dsp:a href="artistDetails.jsp">
                    <dsp:param name="itemId" param="element.artist.id"/>
                    <dsp:valueof param="element.artist.name"/>
                 </dsp:a> </b></font>
             </td>
           </tr>
           <tr>
            <td valign="top" align="right"> Album(s): </td>
             <td valign="top">
               <font face="Courier New"><b>
               <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                 <dsp:param name="queryRQL" value="songList INCLUDES :element"/>
                 <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                 <dsp:param name="itemDescriptor" value="album"/>
                 <dsp:oparam name="output">
                   <dsp:a href="albumDetails.jsp">
                     <dsp:param name="itemId" param="element.id"/>
                   <dsp:valueof param="element.title"/>
                   </dsp:a>
                 </dsp:oparam>
                 <dsp:oparam name="empty">
                   No albums found for this song.
                 </dsp:oparam>
               </dsp:droplet>
               </b></font>
             </td>
           </tr>

           <tr>
             <td valign="top" align="right"> Add to playlist: </td>
             <td>
             <dsp:form action="<%=request.getRequestURI()%>">
                <dsp:select bean="PlaylistFormHandler.playlistId">
                  <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                    <dsp:param bean="Profile.playlists" name="array"/>
                    <dsp:oparam name="output">
                      <dsp:option paramvalue="element.id">
                         <dsp:valueof param="element.name"/>
                      </dsp:option>
                    </dsp:oparam>
                  </dsp:droplet>
                </dsp:select>

                <dsp:input type="hidden" bean="PlaylistFormHandler.formName" value="addSong"/>
                <dsp:input type="hidden" bean="PlaylistFormHandler.sendMessages" value="true"/>

                <dsp:droplet name="/dynamusic/ViewItemEventSender">
                    <dsp:param name="eventobject" param="element"/>
                </dsp:droplet>


                <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>
                <dsp:input type="hidden" bean="PlaylistFormHandler.songId" paramvalue="element.id"/>

                <dsp:input bean="PlaylistFormHandler.addSong" type="submit" value="Add" />

              </dsp:form>
             </td>
           </tr>

           <tr>
             <td valign="top" align="right"> It occurs in the playlists of the following users: </td>
             <td>
               <dsp:setvalue param="userid" beanvalue="Profile.id"/>
               <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                 <dsp:param name="queryRQL" value=" id != :userid AND playlists INCLUDES ITEM (songs INCLUDES ITEM (id = :element.id))"/>
                 <dsp:param name="repository"
                 value="/atg/userprofiling/ProfileAdapterRepository"/>
                 <dsp:param name="itemDescriptor" value="user"/>
                 <dsp:oparam name="output">
                   <dsp:a href="userDetails.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                    <dsp:valueof param="element.login"/>
                   </dsp:a>
                 </dsp:oparam>
               </dsp:droplet>
             </td>
           </tr>


          </table>
          
          &nbsp;<p>
          <font face="Geneva,Arial" size="-1">
            <i>
            <dsp:valueof param="element.description"/>
            </i>
          </font>                 
          <!-- *** End real content *** -->          
          </font>
        </td>

      </tr>
    </table>
    </dsp:oparam>
  </dsp:droplet>
  </BODY>
</HTML>
</dsp:page>
