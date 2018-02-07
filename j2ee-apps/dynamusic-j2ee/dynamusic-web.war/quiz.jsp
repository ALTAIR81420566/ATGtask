<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/QuizFormHandler"/>
<HTML>
  <HEAD>
    <TITLE>Quiz page</TITLE>
  </HEAD>

  <BODY>
      <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Quiz"/>
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

                <dsp:form action="<%=request.getRequestURI()%>">
                          <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                            <dsp:oparam name="output">
                              <b><dsp:valueof param="message"/></b><br>
                            </dsp:oparam>
                          </dsp:droplet>

                         <table cellpadding="10">
                            <tr>
                                <td valign="middle">
                                   Question: <dsp:valueof bean="QuizFormHandler.question"/>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                   Your answer:
                                </td>
                                <td valign="middle">
                                   <dsp:input bean="QuizFormHandler.userAnswer" type="text" required="<%=true%>"/> &nbsp; &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    <dsp:input type="submit" bean="QuizFormHandler.validate" value="Send Message"/>
                                </td>
                            </tr>

                         </table>
                </dsp:form>
            </td>
        </tr>

  </table>
  </BODY>
</HTML>
</dsp:page>