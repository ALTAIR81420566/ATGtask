<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<HTML>
  <HEAD>
    <TITLE>Playlists</TITLE>
  </HEAD>

  <BODY>
      <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Your playlists"/>
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
                 Your playlists:

                 <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                      <dsp:param bean="Profile.playlists" name="array"/>
                      <dsp:oparam name="outputStart">
                        <ul>
                      </dsp:oparam>
                      <dsp:oparam name="outputEnd">
                        </ul>
                      </dsp:oparam>
                      <dsp:oparam name="output">
                        <li><dsp:a href="playlistDetails.jsp">
                                 <dsp:param name="itemId" param="element.id"/>
                                 <dsp:param name="itemName" param="element.name"/>
                                 <dsp:valueof param="element.name"/>
                            </dsp:a>
                      </dsp:oparam>
                      <dsp:oparam name="empty">
                        You still don't have playlists
                      </dsp:oparam>
                </dsp:droplet>
             </td>

        </tr>

  </table>
  </BODY>
</HTML>
</dsp:page>