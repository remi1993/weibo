package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TodoService;
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

@Controller
public class TopicController {
    public static HashMap<String, String> tokenMap = new HashMap<>();
    private TopicService topicService;
    private UserService userService;
    private TopicCommentService topicCommentService;

    public TopicController(TopicService topicService, UserService userService, TopicCommentService topicCommentService) {
        this.topicService = topicService;
        this.userService = userService;
        this.topicCommentService = topicCommentService;
    }


    @PostMapping("/topic/add")
    public ModelAndView add(String title, String content,Integer boardId, HttpServletRequest request, Long updatedTime,  Long createdTime) {
        Utility.log("content: %s", content);
        title = title.replace(">", "&gt");
        title = title.replace("<", "&lt");

        content = content.replace(">", "&gt");
        content = content.replace("<", "&lt");
        UserModel currentUser = userService.currentUser(request);
        topicService.add(title, content, currentUser.getId(), boardId, createdTime, updatedTime);
        ModelAndView m = new ModelAndView("redirect:/topic");
        Utility.log("topic add m: %s", m);
        return m;
    }

    @GetMapping("/topic/detail/{id}")
    public ModelAndView detail(@PathVariable Integer id,HttpServletRequest request) {
        String token = UUID.randomUUID().toString();
        Utility.log("detail-token %s",token);
        UserModel currentUser = userService.currentUser(request);
        tokenMap.put(currentUser.getId().toString(), token);
        Utility.log("detail-tokenMap %s",tokenMap);
        List<TopicModel> topics = topicService.all();

        TopicModel topic = topicService.findById(id);
        ModelAndView m = new ModelAndView("topic_detail");
        m.addObject("topic", topic);
        TopicModel topiccomment = topicService.findByIdwithTopicComment(id);
        m.addObject("topiccomment", topiccomment);
        Utility.log("topics <%s>", topics);
        m.addObject("token", token);
        Utility.log("m.addObject <%s>", m);

        return m;
    }


    @GetMapping("/topic/edit")
    public ModelAndView edit(Integer id, String token, HttpServletRequest request) {
        TopicModel topic = topicService.findById(id);
        ModelAndView m = new ModelAndView("topic_edit");
        m.addObject("topic", topic);
        return m;
    }



    @PostMapping("/topic/update")
    public ModelAndView update(Integer id, String title ,String content, Long updatedTime) {
        Utility.log("content: %s", content);
        topicService.update(id, title, content, updatedTime);
        ModelAndView m = new ModelAndView("redirect:/topic");
        return m;
    }


    @GetMapping("/topic/delete")
    public ModelAndView delete(Integer id, String token, HttpServletRequest request) {
        topicService.deleteById(id);
        ModelAndView m = new ModelAndView("redirect:/topic");
        return m;
    }


    @GetMapping("/topic")
    public ModelAndView index(HttpServletRequest request) {
        String token = UUID.randomUUID().toString();
        UserModel currentUser = userService.currentUser(request);
        tokenMap.put(currentUser.getId().toString(), token);
        List<TopicModel> topics = topicService.all();
        ModelAndView m = new ModelAndView("topic_index");
        m.addObject("topics", topics);
        m.addObject("currentUser", currentUser);
        Utility.log("topics <%s>", topics);
        m.addObject("token", token);
        return m;
    }
}
