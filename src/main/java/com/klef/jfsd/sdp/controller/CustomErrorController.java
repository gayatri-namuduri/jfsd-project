package com.klef.jfsd.sdp.controller;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(Model model) {
        // Add custom error message
        model.addAttribute("errorMessage", "The page you are looking for does not exist.");
        return "error/404";  // Return the custom error page (404.jsp)
    }

    public String getErrorPath() {
        return "/error";  // Required for Spring Boot's error handling mechanism
    }
}
