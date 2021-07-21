package com.kh.bnpp.model.biz;

import com.kh.bnpp.model.dao.RecipeDao;
import com.kh.bnpp.model.dto.RecipeDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecipeBizImpl implements RecipeBiz{

    @Autowired
    private RecipeDao dao;

    @Override
    public RecipeDto selectOne() {
        return dao.selectOne();
    }

}
