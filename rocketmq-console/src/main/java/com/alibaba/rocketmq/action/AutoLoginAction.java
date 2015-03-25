package com.alibaba.rocketmq.action;

import com.alibaba.rocketmq.remoting.netty.SslHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * console auto login.
 * must login in cockpit .
 */
@Controller
@RequestMapping("/authority")
public class AutoLoginAction {

    private static final String COOKIE_ENCRYPTION_KEY = "C0ckp1t";

    @Autowired
    private AuthenticationManager myAuthenticationManager;

    @RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {

        boolean hasLoggedIn = false;
        try {
            UsernamePasswordAuthenticationToken token = getToken(request);

            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authenticatedUser = myAuthenticationManager.authenticate(token);

            SecurityContextHolder.getContext().setAuthentication(authenticatedUser);

            response.sendRedirect("../cluster/list.do");
            hasLoggedIn = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (!hasLoggedIn) {
                response.sendRedirect(
                        request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + "/");
            }
        }
    }

    private Collection<GrantedAuthority> getAuthority(String role) {
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        if (role.contains(";")) {
            String[] roles = role.split(";");
            for (String ro : roles)
                authList.add(new SimpleGrantedAuthority(ro));
        } else {
            authList.add(new SimpleGrantedAuthority(role));
        }
        return authList;
    }

    private UsernamePasswordAuthenticationToken getToken(HttpServletRequest request) throws Exception {
        String uid = null;
        String password = null;

        Collection<? extends GrantedAuthority> authorities = null;

        Cookie[] cookies = request.getCookies();

        for (Cookie c : cookies) {
            if (c.getName().equals("j_username")) {
                uid = decode(c);
            }

            if (c.getName().equals("j_password")) {
                password = decode(c);
            }

            if (c.getName().equals("j_authority")) {
                authorities = getAuthority(decode(c));
            }
        }

        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(uid, password, authorities);

        return token;
    }

    private String decode(Cookie c) throws Exception {
        return new String(SslHelper.decrypt(COOKIE_ENCRYPTION_KEY, c.getValue()));
    }

    public AuthenticationManager getMyAuthenticationManager() {
        return myAuthenticationManager;
    }

    public void setMyAuthenticationManager(AuthenticationManager myAuthenticationManager) {
        this.myAuthenticationManager = myAuthenticationManager;
    }
}
