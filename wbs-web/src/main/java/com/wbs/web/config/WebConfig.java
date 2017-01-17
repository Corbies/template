package com.wbs.web.config;

import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ServletComponentScan("com.wbs.web.filter")
public class WebConfig {
}
