<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>

<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  EDIT ARTIST
  
  Modify description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  
<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>

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
            <dsp:setvalue bean="ArtistFormHandler.repositoryId" paramvalue="itemId"/>
            <dsp:form action="<%=request.getRequestURI()%>">

            <dsp:input bean="ArtistFormHandler.repositoryId" type="hidden" paramvalue="itemId"/>

                          <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                            <dsp:oparam name="output">
                              <b><dsp:valueof param="message"/></b><br>
                            </dsp:oparam>
                          </dsp:droplet>

                          <table cellpadding="10">
                            <tr>

                              <td valign="middle">
                                Artist Name:
                              </td>
                              <td valign="middle">

                                  <!-- DATA(1) Artist name -->
                                  <dsp:input bean="ArtistFormHandler.value.name" type="text" required="<%=true%>"/> &nbsp; &nbsp;

                              </td>
                            </tr>
                            <tr>
                              <td valign="middle">
                                Image Path:
                              </td>
                              <td valign="middle">

                                  <!-- DATA(2) Image path -->
                                  <dsp:input bean="ArtistFormHandler.value.photoURL" type="text"/>

                              </td>
                            </tr>
                            <tr>
                              <td valign="top">
                                Description:
                              </td>
                              <td valign="top">

                                <!-- Data(3) Artist description -->
                                  <dsp:textarea bean="ArtistFormHandler.value.description" cols="60" rows="10" wrap="SOFT"/>
                              </td>
                            </tr>
                            <tr>
                              <td> </td>
                              <td>
                                  <!-- ACTION(a) Save data entered, and go to the artistDetails
                                                 page where we can show the info on our newly-
                                                 entered artist -->

                                  <dsp:input bean="ArtistFormHandler.createSuccessURL" type="hidden" value="venues.jsp"/>

                                  <dsp:input bean="ArtistFormHandler.update" type="Submit" value="Save changes"/>
                                  <dsp:input bean="ArtistFormHandler.delete" type="Submit" value="Delete this artist"/>



                             </td>
                          </tr>


                            </tr>
                          </table>
                        </dsp:form>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>

</dsp:page>


