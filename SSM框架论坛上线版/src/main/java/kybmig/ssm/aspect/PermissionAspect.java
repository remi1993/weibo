package kybmig.ssm.aspect;


import kybmig.ssm.Utility;
import kybmig.ssm.model.*;
import kybmig.ssm.service.*;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

// 会被注册成切面，这样方法才会在事件发生的时候执行
@Aspect
// 自动注册成 spring bean，这样 spring 就能认得出这个类
@Component
// Aspect 切面：注册事件，在某类事情发生的时候调用
public class PermissionAspect {
    private WeiboService weiboService;
    private UserService userService;
    private TopicService topicService;
    private TopicCommentService topicCommentService;
    private HttpServletRequest request;
    private TodoService todoService;

    public PermissionAspect(UserService service, HttpServletRequest request, TopicService topicService, TopicCommentService topicCommentService, TodoService todoService, WeiboService weiboService) {
        Utility.log("PermissionAspect 注入需要的依赖", request, service);
        this.weiboService = weiboService;
        this.request = request;
        this.userService = service;
        this.topicService = topicService;
        this.topicCommentService = topicCommentService;
        this.todoService = todoService;
    }


    // @Before("execution(* kybmig.ssm.controller.TodoController.*(..))")
    // public void matchSingle() {
    //     Utility.log("最简单的单方法匹配 %s", request.getRequestURI());
    // }


//    @Around("execution(* kybmig.ssm.controller.TodoController.index(..)) || execution(* kybmig.ssm.controller.TodoController.add(..))")
//    public ModelAndView matchSingle(ProceedingJoinPoint joint) throws Throwable {
//        Utility.log("路由函数之前执行 %s", request.getRequestURI());
//
//        // 这一句就是在执行路由函数
//        ModelAndView result = (ModelAndView) joint.proceed();
//
//        Utility.log("路由函数之后执行 %s", request.getRequestURI());
//        return result;
//    }

    @Around("execution(* kybmig.ssm.controller.TopicController.*(..)) || execution(* kybmig.ssm.controller.TopicCommentController.*(..)) || execution(* kybmig.ssm.controller.TodoController.*(..))|| execution(* kybmig.ssm.controller.UserindexController.*(..))|| execution(* kybmig.ssm.controller.WeiboController.*(..))")
    public ModelAndView loginRequired(ProceedingJoinPoint joint) throws Throwable {
        // 在 TodoController 下面所有方法被执行的时候调用
        // @Around 能在执行方法之前和之后处理。由 loginRequired 决定什么时候调用 controller 的方法。
        // execution 匹配方法执行。Aspect 功能非常多，除了能在方法执行的时候插入，还能在其他地方插入。
        // * kybmig.ssm.controller.TodoController.*(..)
        // 第一个 *，匹配任意的方法返回值
        // 第二个 *，匹配 TodoController 下的任意方法，可以把 * 换成具体方法名。这里有自动补全。
        // (..) 匹配任意参数签名
        // 简写 @Around("within(kybmig.ssm.controller.TodoController)")
        // ProceedingJoinPoint 正在被调用的方法
        // 返回值类型要和被处理的控制器方法类型一样。所以 TodoController 的所有方法返回值都要是 ModelAndView
        Utility.log("loginRequired 正在访问的 url %s", request.getRequestURI());
        Utility.log("loginRequired 正在执行的方法 %s %s", joint.getSignature(), joint.getArgs());
        Integer userID = (Integer) request.getSession().getAttribute("user_id");
        if (userID == null) {
            // 跳转回登陆页面
            Utility.log("loginRequired 没有 session");
            return new ModelAndView("redirect:/login");
        } else {
            UserModel u = userService.findById(userID);
            if (u == null || u.getRole().equals(UserRole.guest)) {
                // 跳转回登陆页面
                Utility.log("loginRequired 用户不存在 %s", userID);
                return new ModelAndView("redirect:/login");
            } else {
                // 执行被插入的方法
                return (ModelAndView) joint.proceed();
            }
        }
    }


    @Around("execution(* kybmig.ssm.controller.TopicController.edit(..)) || execution(* kybmig.ssm.controller.TopicController.delete(..)) ")
    public ModelAndView ownerRequird(ProceedingJoinPoint joint) throws Throwable {
        // 在 TodoController 下面所有方法被执行的时候调用
        // @Around 能在执行方法之前和之后处理。由 loginRequired 决定什么时候调用 controller 的方法。
        // execution 匹配方法执行。Aspect 功能非常多，除了能在方法执行的时候插入，还能在其他地方插入。
        // * kybmig.ssm.controller.TodoController.*(..)
        // 第一个 *，匹配任意的方法返回值
        // 第二个 *，匹配 TodoController 下的任意方法，可以把 * 换成具体方法名。这里有自动补全。
        // (..) 匹配任意参数签名
        // 简写 @Around("within(kybmig.ssm.controller.TodoController)")
        // ProceedingJoinPoint 正在被调用的方法
        // 返回值类型要和被处理的控制器方法类型一样。所以 TodoController 的所有方法返回值都要是 ModelAndView
        Utility.log("ownerRequird 正在访问的 url %s", request.getRequestURI());
        Utility.log("ownerRequird 正在执行的方法 %s %s", joint.getSignature(), joint.getArgs());
        Integer userID = (Integer) request.getSession().getAttribute("user_id");
        Integer topicId = Integer.valueOf(request.getParameter("id"));
        if (userID == null) {
            // 跳转回登陆页面
            Utility.log("loginRequired 没有 session");
            return new ModelAndView("redirect:/login");
        } else {
            UserModel u = userService.findById(userID);
            Utility.log("user after find %s", u);
            if (u == null && u.getRole().equals(UserRole.guest)) {
                // 跳转回登陆页面
                Utility.log("loginRequired 用户不存在 %s", userID);
                return new ModelAndView("redirect:/login");
            } else {
                TopicModel topic = topicService.findById(topicId);
                Utility.log("topic before route: %s", topic);
                Utility.log("user before route: %s", u);
                if (u.getId().equals(topic.getUserId())) {
                    Utility.log("进入u.getId().equals(topic.getUserId()");
                    return (ModelAndView) joint.proceed();
                } else {
                    Utility.log("进入跳转");
                    return new ModelAndView("redirect:/login");
                }
            }
        }
    }

    @Around("execution(* kybmig.ssm.controller.TopicCommentController.edit(..)) || execution(* kybmig.ssm.controller.TopicCommentController.delete(..)) ")
    public ModelAndView TopicCommentownerRequird(ProceedingJoinPoint joint) throws Throwable {
        Utility.log("TopicCommentownerRequird 正在访问的 url %s", request.getRequestURI());
        Utility.log("TopicCommentownerRequird 正在执行的方法 %s %s", joint.getSignature(), joint.getArgs());
        Integer userID = (Integer) request.getSession().getAttribute("user_id");
        Integer topicId = Integer.valueOf(request.getParameter("id"));
        if (userID == null) {
            // 跳转回登陆页面
            Utility.log("loginRequired 没有 session");
            return new ModelAndView("redirect:/login");
        } else {
            UserModel u = userService.findById(userID);
            Utility.log("user after find %s", u);
            if (u == null && u.getRole().equals(UserRole.guest)) {
                // 跳转回登陆页面
                Utility.log("loginRequired 用户不存在 %s", userID);
                return new ModelAndView("redirect:/login");
            } else {
                TopicCommentModel topicComment = topicCommentService.findById(topicId);
                Utility.log("topic before route: %s", topicComment);
                Utility.log("user before route: %s", u);
                if (u.getId().equals(topicComment.getUserId())) {
                    Utility.log("进入u.getId().equals(topic.getUserId()");
                    return (ModelAndView) joint.proceed();
                } else {
                    Utility.log("进入跳转");
                    return new ModelAndView("redirect:/login");
                }
            }
        }
    }


//    @Around("execution(* kybmig.ssm.controller.TodoController.edit(..)) || execution(* kybmig.ssm.controller.TodoController.delete(..)) ")
//    public ModelAndView TodoownerRequird(ProceedingJoinPoint joint) throws Throwable {
//        Utility.log("ownerRequird 正在访问的 url %s", request.getRequestURI());
//        Utility.log("ownerRequird 正在执行的方法 %s %s", joint.getSignature(), joint.getArgs());
//        Integer userID = (Integer) request.getSession().getAttribute("user_id");
//        Integer topicId = Integer.valueOf(request.getParameter("id"));
//        if (userID == null) {
//            // 跳转回登陆页面
//            Utility.log("loginRequired 没有 session");
//            return new ModelAndView("redirect:/login");
//        } else {
//            UserModel u = userService.findById(userID);
//            Utility.log("user after find %s", u);
//            if (u == null && u.getRole().equals(UserRole.guest)) {
//                // 跳转回登陆页面
//                Utility.log("loginRequired 用户不存在 %s", userID);
//                return new ModelAndView("redirect:/login");
//            } else {
//                TodoModel todo = todoService.findById(id);
//                Utility.log("topic before route: %s", todo);
//                Utility.log("user before route: %s", u);
//                if (u.getId().equals(todo.getserId())) {
//                    Utility.log("进入u.getId().equals(topic.getUserId()");
//                    return (ModelAndView) joint.proceed();
//                } else {
//                    Utility.log("进入跳转");
//                    return new ModelAndView("redirect:/login");
//                }
//            }
//        }
//    }

    @Around("execution(* kybmig.ssm.controller.WeiboController.edit(..)) || execution(* kybmig.ssm.controller.WeiboController.delete(..))")
    public ModelAndView WeiboownerRequird(ProceedingJoinPoint joint) throws Throwable {
        Utility.log("WeiboownerRequird url %s", request.getRequestURI());
        Utility.log("WeiboownerRequird 正在执行的方法 %s %s", joint.getSignature(), joint.getArgs());
        Integer userID = (Integer) request.getSession().getAttribute("user_id");
        Integer weiboId = Integer.valueOf(request.getParameter("id"));
        Utility.log("weiboId %s", weiboId);
        if (userID == null) {
            // 跳转回登陆页面
            Utility.log("loginRequired 没有 session");
            return new ModelAndView("redirect:/login");
        } else {
            UserModel u = userService.findById(userID);
            Utility.log("user after find %s", u);
            if (u == null && u.getRole().equals(UserRole.guest)) {
                // 跳转回登陆页面
                Utility.log("loginRequired 用户不存在 %s", userID);
                return new ModelAndView("redirect:/login");
            } else {
                WeiboModel weibo = weiboService.findById(weiboId);
                Utility.log("weibo before route: %s", weibo);
                Utility.log("user before route: %s", u);
                if (u.getId().equals(weibo.getUserId())) {
                    Utility.log("进入u.getId().equals(topic.getUserId()");
                    return (ModelAndView) joint.proceed();
                } else {
                    Utility.log("进入跳转");
                    return new ModelAndView("redirect:/login");
                }
            }
        }
    }

}
