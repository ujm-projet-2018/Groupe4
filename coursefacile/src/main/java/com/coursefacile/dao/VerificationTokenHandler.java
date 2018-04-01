package com.coursefacile.dao;

import com.coursefacile.model.User;
import com.coursefacile.model.VerificationToken;
import org.hibernate.Query;
import org.hibernate.Session;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class VerificationTokenHandler implements  IVerificationTokenHandler {

    public boolean add(VerificationToken verifToken) {
        Session session = SessionFactoryHelper.getSessionFactory().openSession();
        boolean check = false;
        try {
            session.beginTransaction();
            session.save(verifToken);
            session.getTransaction().commit();
            check = true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return check;
    }


    public VerificationToken generateUniqueVerificationToken(User user) {
        UUID uuid = UUID.randomUUID();
        String hashedUUID = Util.hashString(uuid.toString());
        VerificationToken verificationToken = new VerificationToken();
        verificationToken.setToken(hashedUUID);
        Date currentDate = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);
        c.add(Calendar.DATE, VerificationToken.EXPIRATION);
        currentDate = c.getTime();
        verificationToken.setExpirationDate(currentDate);
        verificationToken.setUser(user);
        return verificationToken;
    }

    public boolean sendVerificationMail(User user) {
        boolean check = false;
        VerificationToken verificationToken = generateUniqueVerificationToken(user);
        if(verificationToken != null) {
            boolean checkAdd = add(verificationToken);
            System.out.println(checkAdd);
            if (checkAdd) {
                String toEmail = user.getEmail();
                String subject = "Validation mail";
                String body = "<p>Pour finaliser votre inscription veuillez cliquer sur le lien ci dessous<p>" +
                        "<a href='http://localhost:8080/coursefacile/verifymail?token=" + verificationToken.getToken() + "'>Valider mon mail</a>";
                check = Util.sendEmail(toEmail, subject, body);
            }
        }
        return check;
    }

    public boolean validateMail(HttpServletRequest request) {
        boolean check = false;
        Map<String, String[]> params = request.getParameterMap();
        VerificationToken verificationToken = null;
        if(params.containsKey("token")) {
            String token = request.getParameter("token");
            if (token.length() != 0) {
                Session session = SessionFactoryHelper.getSessionFactory().openSession();
                try {
                    session.beginTransaction();
                    Query query = session.createQuery("from VerificationToken where token= :token");
                    query.setString("token",token);
                     verificationToken = (VerificationToken) query.uniqueResult();
                    session.getTransaction().commit();

                } catch (Exception e) {
                    session.getTransaction().rollback();
                    e.printStackTrace();
                } finally {
                    session.close();
                }
                if(verificationToken != null)
                {
                    Date currentDate = new Date();
                    if(currentDate.compareTo(verificationToken.getExpirationDate())<0)
                    {
                        IUserHandler userHandler = new UserHandler();
                        User user = verificationToken.getUser();
                        user.setEmailChecked(true);
                        userHandler.update(user);
                        request.getSession().setAttribute("user",user);
                        check = true;
                    }
                }
            }
        }
        return check;
    }
}
