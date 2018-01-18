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


    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="(Artist Name)"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <dsp:include page="common/sidebar.jsp"></dsp:include> 
          <br>
          <font face="Verdana,Geneva,Arial" size="-1" color="steelblue">
            <b>Edit Artist Info</b></font>     
        </td>


<!-- Page Body -->

<td VALIGN=TOP><!-- *** Start page content *** -->
<table CELLPADDING=10 >
<tr>
<td VALIGN=TOP><img SRC="images/Cohen.jpg" NOSAVE></td>

<td><font face="Geneva,Arial"><font size=-2>What is a saint? A saint is
someone who has achieved a remote human possibility. It is impossible to
say what that possibility is. I think it has something to do with the energy
of love. Contact with this energy results in the exercise of a kind of
balance in the chaos of existence. A saint does not dissolve the chaos;
if he did the world would have changed long ago. I do not think that a
saint dissolves the chaos even for himself, for there is something arrogant
and warlike in the notion of a man setting the universe in order. It is
a kind of balance that is his glory. He rides the drifts like an escaped
ski. His course is the caress of the hill. His track is a drawing of the
snow in a moment of its particular arrangement with wind and rock. Something
in him so loves the world that he gives himself to the laws of gravity
and chance. Far from flying with the angels, he traces with the fidelity
of a seismograph needle the state of the solid bloody landscape. His house
is dangerous and finite, but he is at home in the world. He can love the
shape of human beings, the fine and twisted shapes of the heart. It is
good to have among us such men, such balancing monsters of love.&nbsp;</font></font>
<p><i><font face="Geneva,Arial"><font size=-2>L. Cohen, Beautiful Losers
(1966)&nbsp;</font></font></i></td>
</tr>
</table>

<ul>
<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">The
Songs of Leonard Cohen</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Songs
from a Room</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Songs
of Love and Hate</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">New
Skin for the Old Ceremony</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">The
Best of Leonard Cohen</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Death
of a Ladies' Man</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Recent
Songs</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Various
Positions</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">I'm
Your Man</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">The
Future</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Cohen
Live</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Ave
Maria: The Myth of Mary</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Field
Commander Cohen: Tour of 1979</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Ten
New Songs</a>&nbsp;</font></font></li>

<li>
<font face="Verdana,Geneva,Arial"><font size=-1><a href="albumDetails.html">Ten
Essential Leonard Cohen</a>&nbsp;</font></font></li>
</ul>
<!-- *** End real content *** --></td>
</tr>
</table>

  </BODY>
</HTML>
</dsp:page>