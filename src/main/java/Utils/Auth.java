/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import Entity.User;

/**
 *
 * @author thaip
 */
public class Auth {
    public static User user(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
    	return user;
    }
}
