<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  Header
  
  Page fragment displaying the site's header, common to all 
  pages.
  
  ------------------------------------------------------------->

   <%@ taglib prefix="dspel"  uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>

  <dspel:page>

      <img src="images/Dynamusic.jpg">
      <table width="700" cellpadding="8">
        <tr>
          <td width="100"></td>
          <td>
            <!-- Header -->
            <font face="Verdana,Geneva,Arial" size="+3" color="midnightblue">
              <dspel:valueof param="pagename"/>
            </font>
            <br>
            <hr size="8">
          </td>
        </tr>
      </table>

  </dspel:page>
 