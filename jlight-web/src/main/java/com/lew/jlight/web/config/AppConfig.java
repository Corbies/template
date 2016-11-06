package com.lew.jlight.web.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;
import org.springframework.stereotype.Controller;

@Configuration
@ComponentScan(basePackages = "com.lew.jlight", excludeFilters = {@ComponentScan.Filter(type = FilterType
        .ANNOTATION, value = {Controller.class})})
public class AppConfig {

}
