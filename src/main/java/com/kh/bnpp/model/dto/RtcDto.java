package com.kh.bnpp.model.dto;

public class RtcDto {

    private String rtc_room;
    private String rtc_pass;

    public RtcDto() {
    }

    public RtcDto(String rtc_room, String rtc_pass) {
        this.rtc_room = rtc_room;
        this.rtc_pass = rtc_pass;
    }

    public String getRtc_room() {
        return rtc_room;
    }

    public void setRtc_room(String rtc_room) {
        this.rtc_room = rtc_room;
    }

    public String getRtc_pass() {
        return rtc_pass;
    }

    public void setRtc_pass(String rtc_pass) {
        this.rtc_pass = rtc_pass;
    }
}
