package kybmig.ssm.controller;
import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TodoMapper;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.TodoService;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TodoController {

    private TodoService todoService;
    private UserService userService;

    public TodoController(TodoService todoService, UserService userService) {
        this.todoService = todoService;
        this.userService = userService;
    }


    @PostMapping("/todo/add")
    public ModelAndView add(String content, HttpServletRequest request, Long createdTime) {
        Utility.log("content %s",content);
        content = content.replace(">", "&gt");
        content = content.replace("<", "&lt");

        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        todoService.add(content, userId, createdTime);
        ModelAndView m = new ModelAndView("redirect:/todo/"+userId);
        return m;
    }


    @PostMapping("/todo/update")
    public ModelAndView update(Integer id, String content, HttpServletRequest request) {
        Utility.log("content: %s", content);
        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        todoService.updateBySQL(id, content);
        ModelAndView m = new ModelAndView("redirect:/todo/"+userId);
        return m;
    }


    @GetMapping("/todo/delete")
    public ModelAndView delete(Integer id, HttpServletRequest request) {
        // Integer todoId = Integer.parseInt(id);
        // todoService.deleteById(id);
        UserModel currentUser = userService.currentUser(request);
        Integer userId = currentUser.getId();
        todoService.deleteBySQL(id);
        ModelAndView m = new ModelAndView("redirect:/todo/"+userId);
        return m;
    }


    @GetMapping("/todo/edit")
    public ModelAndView edit(Integer id) {
        // TodoModel todo = todoService.findById(id);
        TodoModel todo = todoService.findByIdBySQL(id);
        ModelAndView m = new ModelAndView("todo_edit");
        m.addObject("todo", todo);
        return m;
    }


    @GetMapping("/todo/{userId}")
    public ModelAndView index(@PathVariable Integer userId, HttpServletRequest request) {
        Utility.log("todo index");
        UserModel current = userService.currentUser(request);
        List<TodoModel> todos = todoService.findByuserId(userId);
        ModelAndView m = new ModelAndView("todo_index");
        m.addObject("currentUser", current);
        m.addObject("todos", todos);
        return m;
    }
}
