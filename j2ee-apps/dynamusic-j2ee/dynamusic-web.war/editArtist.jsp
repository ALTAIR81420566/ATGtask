<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>

<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  EDIT ARTIST
  
  Modify description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Edit Artist"/>
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

            <form action="artistDetails.jsp">
              <table cellpadding="10">
                <tr>
                  <td valign="middle" align="right">
                    Artist Name
                  </td>
                  <td valign="middle">
                    <font face="Courier New" size="-1">
                      <input type="text" value="Leonard Cohen" size="30"/> 
                    </font>
                  </td>
                </tr>
                <tr>
                  <td valign="middle" align="right">
                    Photo URL
                  </td>
                  <td valign="middle">
                    <font face="Courier New" size="-1">
                      <input type="text" value="/images/LeonardCohen.jpg" size="30"/> 
                    </font>
                  </td>
                </tr>
                <tr>
                  <td valign="top" align="right">
                    Description
                  </td>
                  <td valign="top">
                      <textarea cols="60" rows="10" wrap="SOFT"/>
What is a saint? A saint is someone who has achieved a remote human possibility. It is impossible to say what that possibility is. I think it has something to do with the energy of love. Contact with this energy results in the exercise of a kind of balance in the chaos of existence. A saint does not dissolve the chaos; if he did the world would have changed long ago. I do not think that a saint dissolves the chaos even for himself, for there is something arrogant and warlike in the notion of a man setting the universe in order. It is a kind of balance that is his glory. He rides the drifts like an escaped ski. His course is the caress of the hill. His track is a drawing of the snow in a moment of its particular arrangement with wind and rock. Something in him so loves the world that he gives himself to the laws of gravity and chance. 
Far from flying with the angels, he traces with the fidelity of a seismograph needle the state of the solid bloody landscape. His house is dangerous and finite, but he is at home in the world. He can love the shape of human beings, the fine and twisted shapes of the heart. It is good to have among us such men, such balancing monsters of love.

<i>L. Cohen, Beautiful Losers (1966) </i>
                      </textarea>
                  </td>
                </tr>
                <tr>
                   <td> </td>
                   <td>
                        <input type="submit" value="Save Changes"/>
                        <input type="submit" value="Delete This Artist"/>
                   </td>
              

              </table>
            </form>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>


