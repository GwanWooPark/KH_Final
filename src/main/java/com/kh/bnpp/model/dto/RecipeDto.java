package com.kh.bnpp.model.dto;

public class RecipeDto {

    private int recipe_num;
    private String recipe_name;
    private String recipe_ingredient;
    private String recipe_info;
    private String recipe_path;

    public RecipeDto() {
    }

    public RecipeDto(int recipe_num, String recipe_name, String recipe_ingredient, String recipe_info, String recipe_path) {
        this.recipe_num = recipe_num;
        this.recipe_name = recipe_name;
        this.recipe_ingredient = recipe_ingredient;
        this.recipe_info = recipe_info;
        this.recipe_path = recipe_path;
    }

    public int getRecipe_num() {
        return recipe_num;
    }

    public void setRecipe_num(int recipe_num) {
        this.recipe_num = recipe_num;
    }

    public String getRecipe_name() {
        return recipe_name;
    }

    public void setRecipe_name(String recipe_name) {
        this.recipe_name = recipe_name;
    }

    public String getRecipe_ingredient() {
        return recipe_ingredient;
    }

    public void setRecipe_ingredient(String recipe_ingredient) {
        this.recipe_ingredient = recipe_ingredient;
    }

    public String getRecipe_info() {
        return recipe_info;
    }

    public void setRecipe_info(String recipe_info) {
        this.recipe_info = recipe_info;
    }

    public String getRecipe_path() {
        return recipe_path;
    }

    public void setRecipe_path(String recipe_path) {
        this.recipe_path = recipe_path;
    }
}
