<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>


<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ARTISTS
  
  List of artists whose songs appear on this site.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Artists</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Artists"/>
  </dsp:include>    
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <dsp:include page="common/sidebar.jsp"></dsp:include> 
          <br>
          <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
            <b>Add Artist</b></font>     
        </td>
        <!-- Page Body -->


<td VALIGN=TOP><!-- *** Start page content *** -->
<ol>
<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="artistDetails.html">The
Beatles</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="artistDetails.html">Leonard
Cohen</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="artistDetails.html">Loreena
McKennitt</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="artistDetails.html">R.E.M.</a>&nbsp;</font></font></li>
</ol>


          <!-- *** End content *** -->
          
          </font>
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>

