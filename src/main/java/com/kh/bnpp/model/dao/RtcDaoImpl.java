package com.kh.bnpp.model.dao;

import com.kh.bnpp.model.dto.RtcDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RtcDaoImpl implements RtcDao{

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<RtcDto> selectRoomList() {

        List<RtcDto> list = new ArrayList<RtcDto>();

        try {
            list = sqlSession.selectList(NAMESPACE + "selectRoomList");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int insertRoom(String roomId) {

        int res = 0;

        Map<String, String> params = new HashMap<String, String>();
        params.put("roomId", roomId);
        params.put("roomPass", "1234");
        params.put("roomTitle", "입력");

        try {
            res = sqlSession.insert(NAMESPACE + "insertRoom", params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    @Override
    public int compareInfo(String roomId, String roomPass) {
        int res = 0;
        Map<String, String> params = new HashMap<String, String>();
        params.put("roomId", roomId);
        params.put("roomPass", roomPass);

        try {
            res = sqlSession.selectOne(NAMESPACE + "compareInfo", params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
}
