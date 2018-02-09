<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:droplet name="/dynamusic/PlaylistLookupDroplet"/>
<HTML>
  <HEAD>
    <TITLE>Playlist details</TITLE>
  </HEAD>

  <BODY>

       <dsp:getvalueof param="itemName" id="iName"
               idtype="java.lang.String">
          <dsp:include page="common/header.jsp">
             <dsp:param name="pagename" value="<%= iName %>"/>
          </dsp:include>
       </dsp:getvalueof>

        <table width="700" cellpadding="8">
            <tr>
              <!-- Sidebar -->
                <td width="100" bgcolor="ghostwhite" valign="top">
                <!-- (replace contents of this table cell by
                      dynamically including common/sidebar.html) -->
                 <dsp:include page="common/sidebar.jsp">
                 </dsp:include>
                </td>

                <td>
                  <dsp:droplet name="/dynamusic/PlaylistLookupDroplet">
                    <dsp:param name="id" param="itemId"/>
                    <dsp:oparam name="output">
                        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                          <dsp:param name="array" param="element.songs"/>
                          <dsp:oparam name="outputStart">
                            <ul>
                          </dsp:oparam>
                          <dsp:oparam name="outputEnd">
                            </ul>
                          </dsp:oparam>
                          <dsp:oparam name="output">

                            <li>
                               <dsp:a href="song.jsp">
                                    <dsp:param name="itemId" param="element.id"/>
                                  <dsp:valueof param="element.title"/>
                               </dsp:a>

                          </dsp:oparam>
                          <dsp:oparam name="empty">
                            There are no songs in this playlist.
                          </dsp:oparam>
                        </dsp:droplet>
                    </dsp:oparam>
                    <dsp:oparam name="empty">
                        No playlist with ID=<dsp:valueof param="itemId">NONE</dsp:valueof> was found, sorry.
                    </dsp:oparam>
                  </dsp:droplet>

                </td>



            </tr>

        </table>
  </BODY>
</HTML>
</dsp:page>