<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ALBUM DETAILS
  
  Description of an album and list of songs.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Album</TITLE>
  </HEAD>
  <BODY>

    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="(Album Title)"/>
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

<td VALIGN=TOP>
<!-- *** Start page content *** -->
<table CELLPADDING=10 >
<tr>
<td VALIGN=TOP><img SRC="images/ImYourMan.jpg" NOSAVE height=119 width=120></td>

<td VALIGN=TOP><font face="Geneva,Arial"><font size=-1>Now in Vienna there's
ten pretty women</font></font>
<br><font face="Geneva,Arial"><font size=-1>There's a shoulder where Death
comes to cry</font></font>
<br><font face="Geneva,Arial"><font size=-1>There's a lobby with nine hundred
windows</font></font>
<br><font face="Geneva,Arial"><font size=-1>There's a tree where the doves
go to die</font></font>
<br><font face="Geneva,Arial"><font size=-1>There's a piece that was torn
from the morning</font></font>
<br><font face="Geneva,Arial"><font size=-1>And it hands in the Gallery
of Frost</font></font></td>
</tr>
</table>

<ul>
<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">First
We Take Manhattan</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">Ain't
No Cure for Love</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">Everybody
Knows</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">I'm
Your Man</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">Take
This Waltz</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">Jazz
Police</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">I Can't
Forget</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="song.html">Tower
of Song</a>&nbsp;</font></font></li>
</ul>
<!-- *** End real content *** --></td>
</tr>
</table>


  </BODY>
</HTML>
</dsp:page>