package com.kosmo.athi;

import javax.xml.ws.RequestWrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Handles requests for the application home page.
 */
@Controller
public class MaterialController {
	
	private static final Logger logger = LoggerFactory.getLogger(MaterialController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	
	//java컨트롤러
	@RequestMapping("javaMaterial.do")
	public String javamaterial(Model model) {
		return "material/javaMaterial";
	}
	
	//css컨트롤러
	@RequestMapping("cssMaterial.do")
	public String cssMaterial(Model model) {
		return "material/cssMaterial";
	}
	
	//bootstrap 컨트롤러
	@RequestMapping("bootstrapMaterial.do")
	public String bootstrapMaterial(Model model) {
		return "material/bootstrapMaterial";
	}
	
	//html5컨트롤러
	@RequestMapping("html5Material.do")
	public String html5Material(Model model) {
		return "material/html5Material";
	}
}