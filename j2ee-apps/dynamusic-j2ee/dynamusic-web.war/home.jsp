<!-------------------------------------------------------------
  Dynamusic Site             DAF Site Mockup
  
  HOME
  
  Central page for the site; landing point following login, 
  providing starting point for site's pages.
  
  Version 4 - adds slot to advertise concerts for viewed 
              artists.
  
  ------------------------------------------------------------->
 <%@ taglib prefix="dspel"  uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>

<dspel:page>
<dspel:importbean bean="/atg/userprofiling/Profile"/>
<HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>

   <dspel:include page="common/header.jsp">
      <dspel:param name="pagename" value="Home Page"/>
   </dspel:include>

    <table width="700" cellpadding="8">
      <tr>

        <!-- Sidebar -->

          <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
          <font face="Verdana,Geneva,Arial" 
                size="-1" color="steelblue">
            <b>
              <a href="home.jsp">Home</a><br>
              &nbsp;<br>
              <a href="artists.jsp">Artists</a> <br>
              <a href="venues.jsp">Venues</a> <br>
              <a href="search.jsp">Search</a> <br>
              <a href="updateProfile.jsp">Profile</a> <br>
              &nbsp;<br>
              <a href="logout.jsp">Log Out</a> <br>
              &nbsp;<br>
            </b>
          </font>
          <!-- end sidebar -->
        </td>

        
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          
            <table width="560">
              <tr>
                <td>

                  <dspel:droplet name="/atg/dynamo/droplet/Switch">
                      <dspel:param bean="Profile.transient" name="value"/>
                          <dspel:oparam name="true">
                            <p>Welcome to Dynamusic.  <a href="newProfile.jsp">Click here</a> to register. </p>
                          </dspel:oparam>
                          <dspel:oparam name="false">
                            <p>Welcome, <dspel:valueof bean="Profile.firstName"/>! <p>
                      </dspel:oparam>
                  </dspel:droplet>


                  This week's featured songs are:

                  <dspel:droplet name="/atg/dynamo/droplet/ForEach">
                          <dspel:param bean="FeaturedSongs.songs" name="array"/>
                          <dspel:oparam name="outputStart">
                              <ul>
                          </dspel:oparam>
                          <dspel:oparam name="outputEnd">
                              </ul>
                          </dspel:oparam>
                          <dspel:oparam name="output">
                              <li><dspel:valueof param="element"/>

                          </dspel:oparam>
                          <dspel:oparam name="empty">
                              No featured songs this week.
                          </dspel:oparam>
                      </dspel:droplet>

                  


                </td>
                <td width="160" align="center">
                  Featured Album:<br>
                  <a href="albumDetails.jsp"><img src="images/BookOfSecrets.jpg"><br>
                    <b>The Book of Secrets</b> - Loreena McKennitt
                  </a>
                </td>
              </tr>
              <tr><td height="80">&nbsp;</td><td></td></tr>
              <tr>
                <td valign="top">
                  Playing at a venue near you... <p>
                  <ul>
                    <li> 22 May 2004 - <a href="concertDetails.jsp">Eric Clapton at the House of Blues</a>
                    <li> 9 June 2004 - <a href="concertDetails.jsp">Loreena McKennitt at Sanders Theater</a>
                    <li> 14 June 2004 - <a href="concertDetails.jsp">Shania Twain at the Fleet Center</a>
                  </ul>
                </td>
              </tr>
            </table>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dspel:page>
