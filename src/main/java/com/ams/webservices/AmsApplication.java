package com.ams.webservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.ams.webservices")
public class AmsApplication extends SpringBootServletInitializer{// For AWS
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
           return application.sources(AmsApplication.class);
    }

	public static void main(String[] args) {
		SpringApplication.run(AmsApplication.class, args);
	}

}
