<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  SEARCH RESULTS
  
  Display results of a user search, as links to song, artist,
  and album pages.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Search Results</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Search"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
          <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          
            <p>The following songs match your criteria, <font color="red">Man</font>: <p>
            
            <ul>
              <li> <a href="song.html">Man in the Moon</a> by <a href="artistDetails.html">R.E.M.</a> 
              <li> <a href="song.html">I'm Your Man</a> by <a href="artistDetails.html">Leonard Cohen</a> 
              <li> <a href="song.html">Missionary Man</a> by <a href="artistDetails.html">Eurythmics</a> 
              <li> <a href="song.html">First We Take Manhattan</a> by <a href="artistDetails.html">Leonard Cohen</a>
            </ul>

            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>
