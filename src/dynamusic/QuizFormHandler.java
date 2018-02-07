package dynamusic;

import atg.droplet.DropletException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

import javax.transaction.TransactionManager;

/**
 * Created by Administrator on 2/6/2018.
 */
public class QuizFormHandler extends atg.droplet.GenericFormHandler {
    private String question;
    private String answer;
    private String userAnswer;
    private String validateSuccessURL;
    private String validateErrorURL;
    private boolean correctAnswer;

    public String getValidateSuccessURL() {
        return validateSuccessURL;
    }

    public void setValidateSuccessURL(String validateSuccessURL) {
        if(isLoggingDebug()){
            logDebug("setValidateSuccessURL");
        }
        this.validateSuccessURL = validateSuccessURL;
    }

    public String getValidateErrorURL() {
        return validateErrorURL;
    }

    public void setValidateErrorURL(String validateErrorURL) {
        if(isLoggingDebug()){
            logDebug("setValidateErrorURL");
        }
        this.validateErrorURL = validateErrorURL;
    }

    public boolean isCorrectAnswer() {
        return this.correctAnswer;
    }

    public void setCorrectAnswer(boolean correctAnswer) {
        if(isLoggingDebug()){
            logDebug("setCorrectAnswer");
        }
        this.correctAnswer = correctAnswer;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        if(isLoggingDebug()){
            logDebug("setQuestion");
        }
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        if(isLoggingDebug()){
            logDebug("setAnswer");
        }
        this.answer = answer;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        if(isLoggingDebug()){
            logDebug("setUserAnswer");
        }
        this.userAnswer = userAnswer;
    }


    public boolean handleValidate(DynamoHttpServletRequest request, DynamoHttpServletResponse response) throws java.io.IOException {
        if (validateErrorURL != null && isLoggingError()) {
            logError("Validate error");
            addFormException(new DropletException("Validate error"));
            response.sendLocalRedirect(getValidateErrorURL(), request);
        }
        setCorrectAnswer(false);
        if(userAnswer.equalsIgnoreCase(answer)){
            setCorrectAnswer(true);
            if(isLoggingDebug()){
                logDebug("Successful Validation");
            }
        }
        if (validateSuccessURL != null) {
            response.sendLocalRedirect(getValidateSuccessURL(), request);
        }

        return correctAnswer;
    }

    public void handleCancel(){
        this.userAnswer = null;
        if(isLoggingDebug()){
            logDebug("user answer is canceled");
        }
    }



}
