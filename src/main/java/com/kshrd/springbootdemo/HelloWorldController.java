package com.kshrd.springbootdemo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloWorldController {

	@RequestMapping(value = {"/", "/home", "/index"})
	public String indexPage(){
		System.out.println("Hello");
		return "index";
	}
	
	@RequestMapping("/about")
	public String aboutPage(){
		System.out.println("About");
		return "about";
	}
	
	@ResponseBody
	@RequestMapping("/test")
	public String test(){
		return "Hello World!";
	}
	
	/*@ResponseBody
	@RequestMapping("/user")  // /user?name=Dara
	public String home(@RequestParam(name = "name", required=false, defaultValue="Default") String name){
		System.out.println(name);
		return name;
	}*/
	
	@ResponseBody
	@RequestMapping("/user/{name}")  
	public String home(@PathVariable("name") String name){
		System.out.println(name);
		return name;
	}
	
}
