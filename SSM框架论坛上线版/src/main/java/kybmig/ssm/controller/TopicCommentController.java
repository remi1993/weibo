package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TopicCommentService;
import kybmig.ssm.service.TopicService;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import static kybmig.ssm.controller.TopicController.tokenMap;


@Controller
public class TopicCommentController {
    private TopicService topicService;
    private TopicCommentService topicCommentService;
    private UserService userService;

    public TopicCommentController(TopicCommentService topicCommentService,TopicService topicService, UserService userService) {
        this.topicCommentService = topicCommentService;
        this.topicService = topicService;
        this.userService = userService;
    }


    @PostMapping("/topiccomment/add")
    public ModelAndView add(Integer topicId, String content, HttpServletRequest request, Long updatedTime, Long createdTime) {
        content = content.replace(">", "&gt");
        content = content.replace("<", "&lt");
        UserModel currentUser = userService.currentUser(request);
        TopicCommentModel t = topicCommentService.add(topicId, content, currentUser.getId(), createdTime, updatedTime);
        Utility.log("/topiccomment/add: %s", t);
        ModelAndView m = new ModelAndView("redirect:/topic/detail/"+topicId);
        Utility.log("ModelAndView m: %s", m);
        return m;
    }


//    @GetMapping("/topiccomment/edit")
//    public ModelAndView edit( Integer id, String token, HttpServletRequest request) {
//        UserModel currentUser = userService.currentUser(request);
////        Utility.log("currentUser %s" , currentUser);
//        String userToken = tokenMap.get(currentUser.getId().toString());
////        Utility.log("userToken %s" , userToken);
////        Utility.log("token %s" , token);
//        if (userToken.equals(token)) {
//            TopicCommentModel ls = topicCommentService.findById(id);
////            Utility.log("topicCommentService.findById(id) %s", ls);
//            ModelAndView m = new ModelAndView("topic_comment_edit");
//            m.addObject("topiccomment", ls);
//            return m;
//        } else {
//            Utility.log("编辑失败返回登录页面");
//            return new ModelAndView("redirect:/login");
//        }
////        topicCommentService.findById(id);
////        ModelAndView m = new ModelAndView("topic_comment_edit");
////        return m;
//    }

    @GetMapping("/topiccomment/edit")
    public ModelAndView edit(Integer id) {
        TopicCommentModel topicComment = topicCommentService.findById(id);
        ModelAndView m = new ModelAndView("topic_comment_edit");
        m.addObject("topiccomment", topicComment);
        return m;
    }

    @PostMapping("/topiccomment/update")
    public ModelAndView update(Integer topicId,Integer id ,String content, Long updatedTime) {
        Utility.log("content: %s", content);
        Utility.log("update-topicId: %s", topicId);
        topicCommentService.update(id, content, updatedTime,topicId);
        ModelAndView m = new ModelAndView("redirect:/topic/detail/"+topicId);
        return m;
    }

        @GetMapping("/topiccomment/delete")
        //利用AOP进行用户身份验证
    public ModelAndView delete(Integer id, Integer topicId) {
        topicCommentService.deleteById(id);
        ModelAndView m = new ModelAndView("redirect:/topic/detail/"+topicId);
        return m;
    }
}
