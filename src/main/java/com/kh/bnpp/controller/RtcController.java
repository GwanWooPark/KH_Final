package com.kh.bnpp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RtcController {

    @RequestMapping("webRtc.do")
    public String webRtc() {

        String kakao_url = "https://kakaoi-newtone-openapi.kakao.com/v1/recognize";
        String headers = "{\"Transfer-Encoding\": \"chunked\", \"Content-Type\": \"application/octet-stream\"," +
                "\"Authorization\": \"KakaoAK 8cb7899ce6c96b55769b91a18e92efd3\"}"; //json
        return "webRtc";
    }


}
