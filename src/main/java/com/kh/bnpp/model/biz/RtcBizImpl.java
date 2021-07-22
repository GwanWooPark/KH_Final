package com.kh.bnpp.model.biz;

import com.kh.bnpp.model.dao.RtcDao;
import com.kh.bnpp.model.dto.RtcDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RtcBizImpl implements RtcBiz{

    @Autowired
    private RtcDao dao;

    @Override
    public List<RtcDto> selectRoomList() {
        return dao.selectRoomList();
    }

    @Override
    public int insertRoom(String roomId) {
        return dao.insertRoom(roomId);
    }

    @Override
    public int compareInfo(String roomId, String roomPass) {
        return dao.compareInfo(roomId, roomPass);
    }
}
