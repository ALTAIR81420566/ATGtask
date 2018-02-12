<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:droplet name="/dynamusic/PlaylistLookupDroplet"/>
<HTML>
  <HEAD>
    <TITLE>Top of similar</TITLE>
  </HEAD>

  <BODY>
      <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Top of similar"/>
      </dsp:include>

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
                 Top 10:

                  <dsp:droplet name="/atg/dynamo/droplet/RQLQueryRange">

                    <dsp:param name="queryRQL"
                       value="shareProfile = true AND id != :userid AND playlists INCLUDES ITEM (publish = true AND songs INCLUDES ITEM (id = :itemId))"/>
                    <dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
                    <dsp:param name="itemDescriptor" value="user"/>
                    <dsp: param name = "sortProperties" value = "+ title, size" />
                    <dsp:param name="howMany" value="10"/>
                    <dsp:oparam name="outputStart">
                       <hr>
                        <i>Others who have this song in their playlists:</i><ul>

                    </dsp:oparam>
                    <dsp:oparam name="outputEnd">
                      </ul>
                    </dsp:oparam>
                    <dsp:oparam name="output">
                      <li><dsp:a href="userDetails.jsp">
                        <dsp:param name="itemId" param="element.id"/>
                        <dsp:valueof param="element.firstName"/>
                      </dsp:a>
                    </dsp:oparam>
                  </dsp:droplet>

             </td>
        </tr>
  </table>
  </BODY>
</HTML>
</dsp:page>