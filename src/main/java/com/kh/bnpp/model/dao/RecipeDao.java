package com.kh.bnpp.model.dao;

import com.kh.bnpp.model.dto.RecipeDto;

public interface RecipeDao {

    String NAMESPACE = "com.random.recipe.";

    public RecipeDto selectOne();
}
