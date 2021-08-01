package com.kh.bnpp.controller;


import com.kh.bnpp.model.biz.RtcBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class RtcController {

    @Autowired
    private RtcBiz biz;

    @RequestMapping("createRoom.do")
    public String webRtc(Model model, HttpServletRequest request) {

        return "redirect:https://192.168.35.74:3000?roomTitle=" + request.getParameter("roomTitle");

    }

    @RequestMapping(value = "insertRoom.do")
    @ResponseBody
    public String insertRoom(HttpServletRequest request) {

        System.out.println("roomId : " + request.getParameter("roomId"));
        System.out.println("roomTitle : " + request.getParameter("roomTitle"));
        if (biz.insertRoom(request.getParameter("roomId"), request.getParameter("roomTitle")) > 0){
            return "";
        } else {
            System.out.println("방에 입장합니다");
        }
        return "";
    }

    @RequestMapping(value = "roomPass.do")
    @ResponseBody
    public String roomPass(HttpServletRequest request) {


        String roomId = request.getParameter("roomId");
        System.out.println(roomId);
        String roomPass = request.getParameter("pass");

        return "redirect:https://192.168.35.74:3000/" + roomId;
    }
}
