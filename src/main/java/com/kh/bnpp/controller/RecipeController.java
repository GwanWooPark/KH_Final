package com.kh.bnpp.controller;

import com.kh.bnpp.model.biz.RecipeBiz;
import com.kh.bnpp.model.dto.RecipeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {

    @Autowired
    private RecipeBiz biz;

    @RequestMapping("/recipe.do")
    public String selectOne(Model model) {

        RecipeDto dto = biz.selectOne();
        model.addAttribute("dto", dto);

        return "rrecipe";
    }
}
