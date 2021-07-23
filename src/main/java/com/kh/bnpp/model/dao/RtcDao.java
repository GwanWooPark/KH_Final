package com.kh.bnpp.model.dao;

import com.kh.bnpp.model.dto.RtcDto;

import java.util.List;

public interface RtcDao {

    String NAMESPACE = "com.rtc.";

    public List<RtcDto> selectRoomList();
    public int insertRoom(String roomId, String roomTitle);
    public int compareInfo(String roomId, String roomPass);

}
