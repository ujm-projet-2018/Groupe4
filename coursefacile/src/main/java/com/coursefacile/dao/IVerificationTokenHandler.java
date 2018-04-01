package com.coursefacile.dao;

import com.coursefacile.model.User;

import javax.servlet.http.HttpServletRequest;

public interface IVerificationTokenHandler {
    /**
     * send a verification email to the user so he can validate his email
     *
     * @param user the recipient
     * @return return true if the message is sent, if not false
     */
    boolean sendVerificationMail(User user);

    /**
     * after the click on the validation link this function validate the email
     *
     * @param request the servlet request
     * @return true if the validation process is done, if not false
     */
    boolean validateMail(HttpServletRequest request);

}
