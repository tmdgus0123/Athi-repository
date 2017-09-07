package com.kosmo.athi;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MaterialController {	
	
	//java 컨트롤러
	@RequestMapping("javaMaterial.do")
	public String javamaterial(Model model) {
		return "material/javaMaterial";
	}
	
	//css 컨트롤러
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