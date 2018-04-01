package com.coursefacile.dao;

import com.coursefacile.model.User;

import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Util {
    /**
     * global alert status: success,info,warning,danger
     */
    public static final int SUCCESS = 0;
    public static final int INFO = 1;
    public static final int WARNING = 2;
    public static final int DANGER = 3;
    /**
     * All application global alerts
     */
    public static ArrayList<GlobalAlert> alerts = new ArrayList<GlobalAlert>();

    /**
     *
     * @param stringToHash String to hash
     * @return return stringToHash hashed to MD5
     */
    public static String hashString(String stringToHash) {
        String generatedString = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance("MD5");
            //Add password bytes to digest
            md.update(stringToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedString = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedString;
    }

    /**
     *
     * @param toEmail the recipient
     * @param subject mail subject
     * @param body mail body
     * @return true if the email is sent successfully, if not return false.
     */
    public static boolean sendEmail(String toEmail, String subject, String body) {
        try {
            String smtpHostServer = "localhost";
            Properties props = System.getProperties();

            props.put("mail.smtp.host", smtpHostServer);

            javax.mail.Session session = javax.mail.Session.getInstance(props, null);
            MimeMessage msg = new MimeMessage(session);
            //set message headers
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.addHeader("format", "flowed");
            msg.addHeader("Content-Transfer-Encoding", "8bit");

            msg.setFrom(new InternetAddress("no_reply@coursefacile.fr", "NoReply-CourseFacile"));

            msg.setReplyTo(InternetAddress.parse("no_reply@coursefacile.fr", false));

            msg.setSubject(subject, "UTF-8");

            msg.setContent(body, "text/html");

            msg.setSentDate(new Date());

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     *
     * @param request The servlet request
     * @return true if the user is logged in, if not false.
     */
    public static boolean isLoggedIn(HttpServletRequest request) {
        return request.getSession().getAttribute("user") != null;
    }

    /**
     *
     * @param request The servlet request
     * @return the logged in user. If no user is logged in return null
     */
    public static User getLoggedInUser(HttpServletRequest request) {
        if (isLoggedIn(request))
            return (User) request.getSession().getAttribute("user");
        return null;
    }

    /**
     *
     * @param status global alert status: UTIL.SUCCESS, UTIL.INFO, UTIL.WARNING, UTIL.DANGER
     * @param message
     */
    public static void addGlobalAlert(int status, String message) {
        if (message.length() == 0) return;
        GlobalAlert alert = new GlobalAlert(status, message);
        alerts.add(alert);
    }

    /**
     * show bootstrap dismissible alert in the top of the page
     * @return html markup String
     */
    public static String showGlobalAlerts() {

        String markup = "";
        for (int i = 0; i < alerts.size(); i++) {
            GlobalAlert alert = alerts.get(i);
            markup += "<div class=\"alert " + alert.getStatus() + " alert-dismissible\" role=\"alert\">\n" +
                    "        <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span\n" +
                    "                aria-hidden=\"true\">&times;</span></button>\n" +
                    "        " + alert.getMessage() + "\n" +
                    "    </div>\n";
            alerts.remove(i);
        }
        return markup;

    }

    /**
     *  check whether the email is valid or not
     * @param mail the mail to check
     * @return true or false
     */
    public static boolean isValidEmail(String mail){
        String EMAIL_REGEX = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        Pattern pattern = Pattern.compile(EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(mail);
        return matcher.matches();
    }

}

class GlobalAlert {

    private int status;
    private String message;

    GlobalAlert(int status, String message) {
        this.status = status;
        this.message = message;
    }

    String getStatus() {
        String status = "";
        switch (this.status) {
            case Util.SUCCESS:
                status = "alert-success";
                break;
            case Util.INFO:
                status = "alert-info";
                break;
            case Util.WARNING:
                status = "alert-warning";
                break;
            case Util.DANGER:
                status = "alert-danger";
                break;
        }
        return status;
    }

    public String getMessage() {
        return message;
    }
}