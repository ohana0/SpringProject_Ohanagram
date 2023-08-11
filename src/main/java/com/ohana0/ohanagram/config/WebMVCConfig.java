package com.ohana0.ohanagram.config;

	import org.springframework.context.annotation.Configuration;
	import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
	import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

	import com.ohana0.ohanagram.common.FileManager;

	@Configuration
	public class WebMVCConfig implements WebMvcConfigurer {
		
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/images/**")
			.addResourceLocations("file:///" + FileManager.FILE_UPLOAD_PATH + "/");
		}
		
		

	}