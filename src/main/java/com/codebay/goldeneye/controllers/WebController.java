package com.codebay.goldeneye.controllers;

import com.codebay.goldeneye.enums.Departments;
import com.codebay.goldeneye.enums.Offices;
import com.codebay.goldeneye.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WebController {
    @GetMapping("/")
    public String indexGet(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("offices", Offices.values());
        model.addAttribute("departments", Departments.values());
        return "index";
    }

    @PostMapping("/")
    public String indexPost(@ModelAttribute("model") ModelMap model, User user) {
        model.addAttribute("user", user);

        model.addAttribute("offices", Offices.values());
        model.addAttribute("departments", Departments.values());
        return "index";
    }
}