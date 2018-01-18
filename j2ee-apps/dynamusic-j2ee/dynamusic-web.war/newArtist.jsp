<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW ARTIST
  
  Add description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Artist</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="New Artist"/>
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
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
            <form action="artistDetails.html">
              <table cellpadding="10">
                <tr>
                  <td valign="middle">
                    Artist Name:
                  </td>
                  <td valign="middle">
                    
                      <!-- DATA(1) Artist name -->
                      <input type="text"> &nbsp; &nbsp; 
                      
                  </td>
                </tr>
                <tr>
                  <td valign="middle">
                    Image Path:
                  </td>
                  <td valign="middle">
                    
                      <!-- DATA(2) Image path -->
                      <input type="text">
                      
                  </td>
                </tr>
                <tr>
                  <td valign="top">
                    Description:
                  </td>
                  <td valign="top">
                    
                    <!-- Data(3) Artist description -->
                      <textarea cols="60" rows="10" wrap="SOFT"></textarea>
                      
                  </td>
                </tr>
                <tr>
                  <td> </td>
                  <td>
                      <!-- ACTION(a) Save data entered, and go to the artistDetails 
                                     page where we can show the info on our newly-
                                     entered artist -->
                      <input type="submit" value="Create artist entry">
               
                 </td>
              </tr>


                </tr>
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

