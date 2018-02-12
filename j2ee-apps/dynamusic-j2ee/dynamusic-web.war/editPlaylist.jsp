<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>

<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup

  EDIT ARTIST

  Modify description of an artist and her/his list of albums.

  ------------------------------------------------------------->

<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:droplet name="/dynamusic/PlaylistLookupDroplet"/>
<HTML>
  <HEAD>
    <TITLE>Dynamusic Edit playlist</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Edit playlist"/>
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
            <dsp:setvalue bean="PlaylistFormHandler.repositoryId" paramvalue="playlistId"/>

            <dsp:droplet name="/dynamusic/PlaylistLookupDroplet">
                <dsp:param name="id" param="playlistId"/>
                <dsp:oparam name="output">
                    <dsp:form action="<%=request.getRequestURI()%>" id="deleteSong">
                        <dsp:select bean="PlaylistFormHandler.songId">
                          <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                            <<dsp:param name="array" param="element.songs"/>
                            <dsp:oparam name="output">
                              <dsp:option paramvalue="element.id">
                                 <dsp:valueof param="element.title"/>
                              </dsp:option>
                            </dsp:oparam>
                          </dsp:droplet>
                        </dsp:select>

                        <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

                        <dsp:input bean="PlaylistFormHandler.repositoryId" type="hidden" paramvalue="playlistId"/>

                        <dsp:input bean="PlaylistFormHandler.deleteSong" type="submit" value="Delete song" />

                    </dsp:form>
                </dsp:oparam>
            </dsp:droplet>

            <dsp:form action="<%=request.getRequestURI()%>" id="editPlaylist">
                 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                     <dsp:oparam name="output">
                       <b><dsp:valueof param="message"/></b><br>
                     </dsp:oparam>
                 </dsp:droplet>

                 <dsp:input bean="PlaylistFormHandler.repositoryId" type="hidden" paramvalue="playlistId"/>

                 Enter the name:<br>
                 <dsp:input bean="PlaylistFormHandler.value.name" name="name" size="24" type="text"/><br>

                 Description:<br>
                 <dsp:textarea bean="PlaylistFormHandler.value.description" cols="60" rows="10" wrap="SOFT"/><br>

                 Can be seen by other users?<br>
                 <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="true"/>yes<br>
                 <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="false"/>no<br>

                 <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

                 <dsp:input bean="PlaylistFormHandler.update" type="submit" value="Edit" />
                 <dsp:input bean="PlaylistFormHandler.delete" type="Submit" value="Delete playlist"/>

            </dsp:form>



          <!-- *** End real content *** -->

          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>