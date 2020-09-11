package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/register")
    public ModelAndView registerView() {
        ModelAndView m = new ModelAndView("user/register");
        return m;
    }


    @PostMapping("/user/register")
    public ModelAndView register(HttpServletRequest request) {

        String username = request.getParameter("username");
        String password =  request.getParameter("password");
        userService.add(username, password);
        ModelAndView m = new ModelAndView("redirect:/login");
        return m;
    }

    @GetMapping("/login")
    public ModelAndView loginView(HttpServletRequest request) {
        UserModel currentUser = userService.currentUser(request);
        ModelAndView m = new ModelAndView("user/login");
        m.addObject("currentUser", currentUser);
        return m;
    }


    @PostMapping("/user/login")
    public ModelAndView login(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password=  request.getParameter("password");

        if (userService.validateLogin(username, password)) {
            UserModel user = userService.findByUsername(username);
            Utility.log("登录成功");
            request.getSession().setAttribute("user_id", user.getId());
            return new ModelAndView("redirect:/");
        } else {
            ModelAndView m = new ModelAndView("redirect:/register");
            return m;
        }

    }
}
