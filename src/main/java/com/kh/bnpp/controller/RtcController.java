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

        return "redirect:https://localhost:3000?roomTitle=" + request.getParameter("roomTitle");

    }

    @RequestMapping("insertRoom.do")
    @ResponseBody
    public String insertRoom(HttpServletRequest request) {
        if (biz.insertRoom(request.getParameter("roomId"), request.getParameter("roomTitle")) > 0){
            return "";
        } else {
            System.out.println("방에 입장합니다");
        }
        return "";
    }

    @RequestMapping("listRoom.do")
    public String listRoom(Model model) {

        model.addAttribute("list", biz.selectRoomList());
        return "roomList";
    }

    @RequestMapping(value = "roomPass.do", method = RequestMethod.POST)
    @ResponseBody
    public String roomPass(HttpServletRequest request) {

        String roomId = request.getParameter("roomId");
        String roomPass = request.getParameter("pass");

        if (biz.compareInfo(roomId, roomPass) == 1){
            return "redirect:https://localhost:3000/" + roomId;
        }
        return "redirect:listRoom.do";
    }
}
