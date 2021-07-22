package com.kh.bnpp.model.biz;

import com.kh.bnpp.model.dto.RtcDto;

import java.util.List;

public interface RtcBiz {

    public List<RtcDto> selectRoomList();
    public int insertRoom(String roomId);
    public int compareInfo(String roomId, String roomPass);
}
