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
                     <dsp:droplet name="/atg/dynamo/droplet/Switch">
                          <dsp:param bean="QuizFormHandler.correctAnswer" name="value"/>
                          <dsp:oparam name="true">
                             Good boy
                          </dsp:oparam>
                          <dsp:oparam name="false">
                             No! Try again!
                          </dsp:oparam>
                    </dsp:droplet>
            </td>
        </tr>

  </table>
  </BODY>
</HTML>
</dsp:page>