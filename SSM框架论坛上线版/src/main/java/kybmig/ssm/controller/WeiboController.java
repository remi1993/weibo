package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.mapper.WeiboMapper;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.model.WeiboModel;
import kybmig.ssm.service.TodoService;
import kybmig.ssm.service.UserService;
import kybmig.ssm.service.WeiboService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WeiboController {

    private WeiboService weiboService;
    private UserService userService;

    public WeiboController(WeiboService weiboService, UserService userService) {
        this.weiboService = weiboService;
        this.userService = userService;
    }


    @PostMapping("/weibo/add")
    public ModelAndView add(String content, HttpServletRequest request, Long createdTime) {
        Utility.log("content %s",content);
        content = content.replace(">", "&gt");
        content = content.replace("<", "&lt");

        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        weiboService.add(content, userId, createdTime);
        ModelAndView m = new ModelAndView("redirect:/weibo/"+userId);
        return m;
    }

    @GetMapping("/weibo/edit")
    public ModelAndView edit(Integer id) {
         WeiboModel weibo = weiboService.findById(id);
        ModelAndView m = new ModelAndView("weibo_edit");
        m.addObject("weibo", weibo);
        return m;
    }

    @PostMapping("/weibo/update")
    public ModelAndView update(Integer id, String content, HttpServletRequest request) {
        Utility.log("content: %s", content);
        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        weiboService.update(id, content);
        ModelAndView m = new ModelAndView("redirect:/weibo/"+userId);
        return m;
    }

    @GetMapping("/weibo/delete")
    public ModelAndView delete(Integer id, String token, HttpServletRequest request) {
        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        weiboService.deleteById(id);
        ModelAndView m = new ModelAndView("redirect:/weibo/"+userId);
        return m;
    }

    @GetMapping("/weibo/{userId}")
    public ModelAndView index(@PathVariable Integer userId, HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        ModelAndView m = new ModelAndView("weibo_index");
        m.addObject("currentUser", current);
        m.addObject("user", userService.findById(userId));
        List<WeiboModel> weibos = weiboService.findByuserId(userId);
        m.addObject("weibos", weibos);
        return m;
    }
}
