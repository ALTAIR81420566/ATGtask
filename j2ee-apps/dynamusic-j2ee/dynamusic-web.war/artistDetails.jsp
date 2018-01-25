<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ARTIST DETAILS
  
  Description of an artist and list of albums.
  
  ------------------------------------------------------------->
  
<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>

<!-- Page Body -->

<dsp:droplet name="/dynamusic/ArtistLookupDroplet">
        <dsp:param name="id" param="itemId"/>
        <dsp:param name="queryRQL" value="id = itemId"/>
        <dsp:oparam name="output">
            <dsp:include page="common/header.jsp">
                <dsp:param name="pagename" param="element.name"/>
            </dsp:include>
            <table width="700" cellpadding="8">
                  <tr>
                    <!-- Sidebar -->
                    <td width="100" bgcolor="ghostwhite" valign="top">
                      <dsp:include page="common/sidebar.jsp"></dsp:include>
                      <br>
                      <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
                            <dsp:a href="editArtist.jsp">
                            <dsp:param name="itemId" param="itemId"/>
                                 <b>Edit Artist Info</b>
                           </dsp:a>
                        </font>
                    </td>
                <td VALIGN=TOP><!-- *** Start page content *** -->
                <table CELLPADDING=10 >
                <tr>

                <dsp:getvalueof param="element.photoURL" id="phUrl" idtype="java.lang.String">
                    <td VALIGN=TOP><img SRC="<%= phUrl %>" NOSAVE></td>
                </dsp:getvalueof>

                <td><font face="Geneva,Arial"><font size=-2><dsp:valueof param="element.description"/></font></font>

                 </tr>
                    </table>
                <ul>
                    <dsp:setvalue param="artistId" paramvalue="element.id"/>
                       <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
                            <dsp:param name="queryRQL" value="artist.id = :artistId"/>
                            <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
                            <dsp:param name="itemDescriptor" value="album"/>

                            <dsp:oparam name="output">
                                 <li><dsp:a href="albumDetails.jsp">
                                           <dsp:param name="itemId" param="element.id" />
                                           <dsp:valueof param="element.title"/>
                                     </dsp:a>
                                 </li>
                            </dsp:oparam>

                        </dsp:droplet>
                </ul>
                <!-- *** End real content *** --></td>
                </tr>
                </table>
        </dsp:oparam>

</dsp:droplet>

  </BODY>
</HTML>
</dsp:page>