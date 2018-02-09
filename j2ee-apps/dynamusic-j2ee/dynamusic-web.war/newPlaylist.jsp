<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/PlaylistFormHandler"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<!-------------------------------------------------------------
  Dynamusic Site Mockup

  NEW PROFILE

  Allows creation of new user profile

  ------------------------------------------------------------->


<HTML>
  <HEAD>
    <TITLE>Dynamusic new playlist</TITLE>
  </HEAD>
  <BODY>
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="New playlist"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite">
            <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">

            <dsp:form action="<%=request.getRequestURI()%>">
                 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                     <dsp:oparam name="output">
                       <b><dsp:valueof param="message"/></b><br>
                     </dsp:oparam>
                 </dsp:droplet>

                 Enter the name:<br>
                 <dsp:input bean="PlaylistFormHandler.value.name" name="name" size="24" type="text"/><br>

                 Description:<br>
                 <dsp:textarea bean="PlaylistFormHandler.value.description" cols="60" rows="10" wrap="SOFT"/><br>

                 Can be seen by other users?<br>
                 <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="true"/>yes<br>
                 <dsp:input bean="PlaylistFormHandler.value.publish" name="publish" type="radio" value="false"/>no<br>


                 <dsp:input type="hidden" bean="PlaylistFormHandler.userId" beanvalue="Profile.id"/>

                 <dsp:input bean="PlaylistFormHandler.create" type="submit" value="Add" />

            </dsp:form>

          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>
