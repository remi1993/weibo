package kybmig.ssm.service;


import kybmig.ssm.Utility;
import kybmig.ssm.mapper.UserMapper;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.model.UserRole;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class UserService {
    private UserMapper mapper;

    public UserService(UserMapper userMapper) {
        this.mapper = userMapper;
    }

    public Long createdTime (){
        Long time = System.currentTimeMillis() ;
//        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String time = sdf.format(new Date(Long.parseLong(String.valueOf(createdTime))));
        Utility.log("createdtime1 %s" ,time);
        return time;
    }

    public UserModel add(String username, String password) {

        UserModel m = new UserModel();
        m.setUsername(username);
        m.setPassword(password);
        m.setRole(UserRole.normal);
        m.setCreatedTime(this.createdTime());
        m.setAvatar("/doge.gif");
        Utility.log("注册的m %s",m);
        mapper.insertUser(m);
        return m;
    }


    public  void update(Integer id, String username, String password) {
        UserModel m = new UserModel();
        m.setId(id);
        m.setUsername(username);
        m.setPassword(password);
       mapper.updateUser(m);
    }


    public void deleteById(Integer id) {
        mapper.deleteUser(id);
    }


    public  UserModel findById(Integer id) {
        return mapper.selectUser(id);
    }


    public  UserModel findByUsername(String username) {
        return mapper.selectOnerByUsername(username);
    }

    public boolean validateLogin(String username, String password) {
        UserModel user = mapper.selectOnerByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }


    public UserModel guest() {
        UserModel user = new UserModel();
        user.setRole(UserRole.guest);
        user.setId(-1);
        user.setUsername("游客");
        user.setPassword("游客");
        return user;
    }


    public UserModel currentUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("user_id");
        if (id == null) {
            return this.guest();
        }
        UserModel user = mapper.selectUser(id);
        if (user == null) {
            user = this.guest();
        }
        return user;
    }


    public  List<UserModel> all() {
        return mapper.selectAllUser();
    }

}
