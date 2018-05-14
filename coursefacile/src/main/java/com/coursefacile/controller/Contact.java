package com.coursefacile.controller;

import com.coursefacile.utilities.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "Contact")
public class Contact extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();
        if (params.containsKey("email") && params.containsKey("name") && params.containsKey("message") && params.containsKey("tel")) {
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String message = request.getParameter("message");
            String tel = request.getParameter("tel");
            if (email.length() != 0 && name.length() != 0 && message.length() != 0 && tel.length() != 0) {
                String adminEmail = this.getServletContext().getInitParameter("adminEmail");
                String prefixPath = this.getServletContext().getInitParameter("prefixPath");
                String body = "<!DOCTYPE html>\n" +
                        "<html xmlns=\"http://www.w3.org/1999/xhtml\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                        "  \n" +
                        "  <meta name=\"viewport\" content=\"initial-scale=1.0\">\n" +
                        "  <meta name=\"format-detection\" content=\"telephone=no\">\n" +
                        "  <title></title>\n" +
                        "  <style type=\"text/css\">\n" +
                        " \tbody {\n" +
                        "\t\twidth: 100%;\n" +
                        "\t\tmargin: 0;\n" +
                        "\t\tpadding: 0;\n" +
                        "\t\t-webkit-font-smoothing: antialiased;\n" +
                        "\t}\n" +
                        "\t@media only screen and (max-width: 600px) {\n" +
                        "\t\ttable[class=\"table-row\"] {\n" +
                        "\t\t\tfloat: none !important;\n" +
                        "\t\t\twidth: 98% !important;\n" +
                        "\t\t\tpadding-left: 20px !important;\n" +
                        "\t\t\tpadding-right: 20px !important;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"table-row-fixed\"] {\n" +
                        "\t\t\tfloat: none !important;\n" +
                        "\t\t\twidth: 98% !important;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"table-col\"], table[class=\"table-col-border\"] {\n" +
                        "\t\t\tfloat: none !important;\n" +
                        "\t\t\twidth: 100% !important;\n" +
                        "\t\t\tpadding-left: 0 !important;\n" +
                        "\t\t\tpadding-right: 0 !important;\n" +
                        "\t\t\ttable-layout: fixed;\n" +
                        "\t\t}\n" +
                        "\t\ttd[class=\"table-col-td\"] {\n" +
                        "\t\t\twidth: 100% !important;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"table-col-border\"] + table[class=\"table-col-border\"] {\n" +
                        "\t\t\tpadding-top: 12px;\n" +
                        "\t\t\tmargin-top: 12px;\n" +
                        "\t\t\tborder-top: 1px solid #E8E8E8;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"table-col\"] + table[class=\"table-col\"] {\n" +
                        "\t\t\tmargin-top: 15px;\n" +
                        "\t\t}\n" +
                        "\t\ttd[class=\"table-row-td\"] {\n" +
                        "\t\t\tpadding-left: 0 !important;\n" +
                        "\t\t\tpadding-right: 0 !important;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"navbar-row\"] , td[class=\"navbar-row-td\"] {\n" +
                        "\t\t\twidth: 100% !important;\n" +
                        "\t\t}\n" +
                        "\t\timg {\n" +
                        "\t\t\tmax-width: 100% !important;\n" +
                        "\t\t\tdisplay: inline !important;\n" +
                        "\t\t}\n" +
                        "\t\timg[class=\"pull-right\"] {\n" +
                        "\t\t\tfloat: right;\n" +
                        "\t\t\tmargin-left: 11px;\n" +
                        "            max-width: 125px !important;\n" +
                        "\t\t\tpadding-bottom: 0 !important;\n" +
                        "\t\t}\n" +
                        "\t\timg[class=\"pull-left\"] {\n" +
                        "\t\t\tfloat: left;\n" +
                        "\t\t\tmargin-right: 11px;\n" +
                        "\t\t\tmax-width: 125px !important;\n" +
                        "\t\t\tpadding-bottom: 0 !important;\n" +
                        "\t\t}\n" +
                        "\t\ttable[class=\"table-space\"], table[class=\"header-row\"] {\n" +
                        "\t\t\tfloat: none !important;\n" +
                        "\t\t\twidth: 98% !important;\n" +
                        "\t\t}\n" +
                        "\t\ttd[class=\"header-row-td\"] {\n" +
                        "\t\t\twidth: 100% !important;\n" +
                        "\t\t}\n" +
                        "\t}\n" +
                        "\t@media only screen and (max-width: 480px) {\n" +
                        "\t\ttable[class=\"table-row\"] {\n" +
                        "\t\t\tpadding-left: 16px !important;\n" +
                        "\t\t\tpadding-right: 16px !important;\n" +
                        "\t\t}\n" +
                        "\t}\n" +
                        "\t@media only screen and (max-width: 320px) {\n" +
                        "\t\ttable[class=\"table-row\"] {\n" +
                        "\t\t\tpadding-left: 12px !important;\n" +
                        "\t\t\tpadding-right: 12px !important;\n" +
                        "\t\t}\n" +
                        "\t}\n" +
                        "\t@media only screen and (max-width: 608px) {\n" +
                        "\t\ttd[class=\"table-td-wrap\"] {\n" +
                        "\t\t\twidth: 100% !important;\n" +
                        "\t\t}\n" +
                        "\t}\n" +
                        "  </style>\n" +
                        " </head>\n" +
                        " <body style=\"font-family: Arial, sans-serif; font-size:13px; color: #444444; min-height: 200px;\" bgcolor=\"#E4E6E9\" leftmargin=\"0\" topmargin=\"0\" marginheight=\"0\" marginwidth=\"0\">\n" +
                        " <table width=\"100%\" height=\"100%\" bgcolor=\"#E4E6E9\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\n" +
                        " <tbody><tr><td width=\"100%\" align=\"center\" valign=\"top\" bgcolor=\"#E4E6E9\" style=\"background-color:#E4E6E9; min-height: 200px;\">\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "<table class=\"table-space\" height=\"8\" style=\"height: 8px;font-size: 0px;line-height: 0;width: 600px;background-color: #ffffff;margin-top:  50px;\" width=\"600\" bgcolor=\"#FFFFFF\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-space-td\" valign=\"middle\" height=\"8\" style=\"height: 8px; width: 600px; background-color: #ffffff;\" width=\"600\" bgcolor=\"#FFFFFF\" align=\"left\">&nbsp;</td></tr></tbody></table>\n" +
                        "\n" +
                        "<table class=\"table-row-fixed\" width=\"600\" bgcolor=\"#FFFFFF\" style=\"table-layout: fixed; background-color: #ffffff;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-row-fixed-td\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 24px; padding-right: 24px;\" valign=\"top\" align=\"left\">\n" +
                        "   <table class=\"table-col\" align=\"left\" width=\"100%\" style=\"padding-right: 18px; table-layout: fixed;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-col-td\" width=\"267\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;\" valign=\"top\" align=\"left\">\n" +
                        "\t <table class=\"header-row\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"table-layout: fixed;\"><tbody><tr><td class=\"header-row-td\" width=\"100%\" style=\"font-size: 28px; margin: 0px; font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #478fca; padding-bottom: 10px; padding-top: 15px;\" valign=\"top\" align=\"left\">Message de la part de: " + name + "</td></tr></tbody></table>\n" +
                        "\t \n" +
                        "\t \n" +
                        "     <br>\n" +
                        "    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"table-layout: fixed;\"><tbody><tr><td width=\"100%\" bgcolor=\"#f5f5f5\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding: 9px; border: 1px solid #e3e3e3; background-color: #f5f5f5;\" valign=\"top\" align=\"left\">Email: <span><b>" + email + "</b></span>\n" +
                        "\t </td></tr></tbody></table>\n" +
                        "    <br>\n" +
                        "    <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"table-layout: fixed;\"><tbody><tr><td width=\"100%\" bgcolor=\"#f5f5f5\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding: 9px; border: 1px solid #e3e3e3; background-color: #f5f5f5;\" valign=\"top\" align=\"left\">Telephone: <span><b>" + tel + "</b></span>\n" +
                        "\t </td></tr></tbody></table>\n" +
                        "    <br>\n" +
                        "\t <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"table-layout: fixed;\"><tbody><tr><td width=\"100%\" bgcolor=\"#f5f5f5\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding: 9px; border: 1px solid #e3e3e3; background-color: #f5f5f5;\" valign=\"top\" align=\"left\">Message: <div>" + message + "</div>\n" +
                        "\t </td></tr></tbody></table>\n" +
                        "\t <br>\n" +
                        "\t \n" +
                        "\t \n" +
                        "\t \n" +
                        "\t \n" +
                        "\t <br>\n" +
                        "\t \n" +
                        "   </td></tr></tbody></table>\n" +
                        "   \n" +
                        "</td></tr></tbody></table>\n" +
                        "\n" +
                        "<table class=\"table-space\" height=\"32\" style=\"height: 32px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;\" width=\"600\" bgcolor=\"#FFFFFF\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-space-td\" valign=\"middle\" height=\"32\" style=\"height: 32px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;\" width=\"600\" bgcolor=\"#FFFFFF\" align=\"center\">&nbsp;<table bgcolor=\"#E8E8E8\" height=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td bgcolor=\"#E8E8E8\" height=\"1\" width=\"100%\" style=\"height: 1px; font-size:0;\" valign=\"top\" align=\"left\">&nbsp;</td></tr></tbody></table></td></tr></tbody></table>\n" +
                        "\n" +
                        "<table class=\"table-row\" width=\"600\" bgcolor=\"#FFFFFF\" style=\"table-layout: fixed; background-color: #ffffff;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-row-td\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;\" valign=\"top\" align=\"left\">\n" +
                        " <table class=\"table-col\" align=\"left\" width=\"528\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"table-layout: fixed;\"><tbody><tr><td class=\"table-col-td\" width=\"528\" style=\"font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;\" valign=\"top\" align=\"left\">\n" +
                        "\t <div style=\"font-family: Arial, sans-serif; line-height: 19px; color: #777777; font-size: 14px; text-align: center;\">© 2018 Courses Facile</div>\n" +
                        "\t <table class=\"table-space\" height=\"8\" style=\"height: 8px; font-size: 0px; line-height: 0; width: 528px; background-color: #ffffff;\" width=\"528\" bgcolor=\"#FFFFFF\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-space-td\" valign=\"middle\" height=\"8\" style=\"height: 8px; width: 528px; background-color: #ffffff;\" width=\"528\" bgcolor=\"#FFFFFF\" align=\"left\">&nbsp;</td></tr></tbody></table>\n" +
                        "\t \n" +
                        " </td></tr></tbody></table>\n" +
                        "</td></tr></tbody></table>\n" +
                        "<table class=\"table-space\" height=\"14\" style=\"height: 14px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;\" width=\"600\" bgcolor=\"#FFFFFF\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody><tr><td class=\"table-space-td\" valign=\"middle\" height=\"14\" style=\"height: 14px; width: 600px; background-color: #ffffff;\" width=\"600\" bgcolor=\"#FFFFFF\" align=\"left\">&nbsp;</td></tr></tbody></table>\n" +
                        "</td></tr>\n" +
                        " </tbody></table>\n" +
                        " \n" +
                        " </body></html>";
                if (Util.sendEmail(adminEmail, "Contact us", body)) {
                    Util.addGlobalAlert(Util.SUCCESS, "Message envoyé!");
                    response.sendRedirect(prefixPath);
                } else {
                    Util.addGlobalAlert(Util.DANGER, "Une erreure s'est produite veuillez réessayez!");
                    this.getServletContext().getRequestDispatcher("/views/contact.jsp").forward(request, response);
                }
            } else {
                Util.addGlobalAlert(Util.WARNING, "Tout les champs sont obligatoirs");
                this.getServletContext().getRequestDispatcher("/views/contact.jsp").forward(request, response);

            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/views/contact.jsp").forward(request, response);
    }
}
