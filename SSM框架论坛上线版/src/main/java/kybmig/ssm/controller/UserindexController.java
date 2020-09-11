package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.service.TopicCommentService;
import kybmig.ssm.service.TopicService;
import kybmig.ssm.service.UserService;
import kybmig.ssm.service.UserindexService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class UserindexController {
    public static HashMap<String, String> tokenMap = new HashMap<>();
    private TopicService topicService;
    private UserService userService;
    private TopicCommentService topicCommentService;
    private UserindexService UserindexService;

    public UserindexController(TopicService topicService, UserService userService, TopicCommentService topicCommentService,    UserindexService UserindexService) {
        this.topicService = topicService;
        this.userService = userService;
        this.topicCommentService = topicCommentService;
        this.UserindexService =UserindexService;
    }


    @GetMapping("/user/{userId}")
    public ModelAndView UserindexView(@PathVariable Integer userId) {
        List<TopicModel> topics = UserindexService.findByUserId(userId);
        List<TopicModel> topicComments = UserindexService.findTopicCommentByUserId(userId);
        Utility.log("topicComments %s",topicComments);
        ModelAndView m = new ModelAndView("User_index");
        m.addObject("topics", topics);
        m.addObject("user", userService.findById(userId));
        m.addObject("topicComments", topicComments);
        return m;
    }
}
