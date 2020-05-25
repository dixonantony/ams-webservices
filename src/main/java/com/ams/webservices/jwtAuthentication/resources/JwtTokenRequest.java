package com.ams.webservices.jwtAuthentication.resources;

import java.io.Serializable;

public class  JwtTokenRequest implements Serializable {
  
  private static final long serialVersionUID = -5616176897013108345L;

  private String username;
    private String password;

    public JwtTokenRequest() {
        super();
    }

//    eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU3OTE4NDkyNSwiaWF0IjoxNTc4NTgwMTI1fQ.2S2AeUNgRJ5pHMX3amxr1CPoeQf9oQhgGaqDa5CAusLYmsQzU70hC0uepd3A9BjQV_VV6cP0jKcwNzwl2xHPvg
    public JwtTokenRequest(String username, String password) {
        this.setUsername(username);
        this.setPassword(password);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

