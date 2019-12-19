package com.webschool.engschool.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.xslt.XsltView;
import org.springframework.web.servlet.view.xslt.XsltViewResolver;

import java.net.URL;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Bean
    public ViewResolver getXSLTViewResolver() {
        URL localPackage = this.getClass().getResource("");
        String localDir = localPackage.getPath();
        System.out.println(localDir);
        XsltViewResolver xsltResolover = new XsltViewResolver();
        xsltResolover.setOrder(1);
        xsltResolover.setSourceKey("xmlSource");

        xsltResolover.setViewClass(XsltView.class);
        xsltResolover.setViewNames(new String[]{"XSLTView"});

        xsltResolover.setPrefix("classpath:/xsl/");
        xsltResolover.setSuffix(".xsl");
        return xsltResolover;
    }

    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
    }

}