package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import kybmig.ssm.model.BoardModel;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.service.BoardService;
import kybmig.ssm.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PublicController {

    private UserService userService;
    private BoardService boardService;

    public PublicController(UserService userService, BoardService boardService) {
        this.userService = userService;
        this.boardService = boardService;
    }



    @GetMapping("/")
    public ModelAndView indexView(HttpServletRequest request) {
        UserModel current = userService.currentUser(request);
        ModelAndView m = new ModelAndView("index");
        m.addObject("currentUser", current);
        List<BoardModel> board = boardService.allBySQL();
        Utility.log("<board> <%s>" ,board);
        // List<TodoModel> todos = todoService.allByMybatis();
        m.addObject("board", board);
        return m;
    }


}
