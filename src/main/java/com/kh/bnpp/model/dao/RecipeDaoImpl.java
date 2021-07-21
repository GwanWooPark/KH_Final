package com.kh.bnpp.model.dao;

import com.kh.bnpp.model.dto.RecipeDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDaoImpl implements RecipeDao{

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public RecipeDto selectOne() {

        RecipeDto dto = null;
        try {
            dto = sqlSession.selectOne(NAMESPACE + "selectOne");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
