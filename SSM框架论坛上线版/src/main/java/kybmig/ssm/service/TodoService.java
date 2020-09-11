package kybmig.ssm.service;


import com.mysql.cj.jdbc.MysqlDataSource;
import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TodoMapper;
import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class TodoService {
    private TodoMapper mapper;

    public TodoService (TodoMapper todoMapper) {
        this.mapper = todoMapper;
    }

    public Long createdTime (){
        Long time = System.currentTimeMillis() ;
        Utility.log("createdtime1 %s" ,time);
        return time;
    }

    public  Long updatedTime (){
        Long time = System.currentTimeMillis() ;
        Utility.log("updatedtimeLong %s" ,time);
        return time;
    }

    public TodoModel add(String content, Integer userId, Long createdTime) {
        TodoModel m = new TodoModel();
        m.setContent(content);
        m.setUserId(userId);
        m.setCreatedTime(this.createdTime());
//        m.setUpdatedTime(this.updatedTime());
        Utility.log("topic add user: %s", m);
        mapper.insertTodo(m);
        return m;
    }


    public  void update(Integer id, String content) {
        ArrayList<TodoModel> todos = load();
        for (int i = 0; i < todos.size(); i++) {
            TodoModel e = todos.get(i);
            if (e.getId().equals(id)) {
                e.setContent(content);
            }
        }
        save(todos);
    }


    public  List<TodoModel> findByuserId(Integer userId) {
        List<TodoModel> m = mapper.selectOneWithTodo(userId);
        return m;
    }

    public ArrayList<TodoModel> load() {
        String className = TodoModel.class.getSimpleName();

        ArrayList<TodoModel> ms = ModelFactory.load(className, 2, modelData -> {
            Integer id = Integer.valueOf(modelData.get(0));
            String content = modelData.get(1);

            TodoModel m = new TodoModel();
            m.setId(id);
            m.setContent(content);
            return m;
        });
        return ms;
    }

    public static void save(ArrayList<TodoModel> list) {
        String className = TodoModel.class.getSimpleName();
        ModelFactory.save(className, list, model -> {
            ArrayList<String> lines = new ArrayList<>();
            lines.add(model.getId().toString());
            lines.add(model.getContent());
            return lines;
        });
    }

//   public TodoModel addBySQL(String content, Integer userId) {
//        TodoModel m = new TodoModel();
//        m.setContent(content);
//        m.setUserId(userId);
//        MysqlDataSource ds = Utility.getDataSource();
//        String sqlInsert = "INSERT INTO Todo (content, userId) VALUES (?,?)";
//
//        try (
//                Connection connection = ds.getConnection();
//                PreparedStatement statement = connection.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS)
//        ) {
//            statement.setString(1, m.getContent());
//            statement.setInt(1, m.getUserId());
//            System.out.println(String.format("Session.add <%s>", statement));
//
//            // 执行升级
//            statement.executeUpdate();
//            // 得到返回结果, 如果用 statement.getResultSet, 会返回一个 null
//            // 用 try 语句是为了不用在最后写一个 rs.close()
//            try(ResultSet rs = statement.getGeneratedKeys()) {
//                rs.first();
//                Integer id = rs.getInt("GENERATED_KEY");
//                m.setId(id);
//            }
//
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return m;
//    }


    public TodoModel updateBySQL(Integer id, String content) {
        TodoModel m = new TodoModel();
        m.setId(id);
        m.setContent(content);

        MysqlDataSource ds = Utility.getDataSource();
        String sqlInsert = "UPDATE `todo` set content = (?) where id = (?)";

        try (
                Connection connection = ds.getConnection();
                PreparedStatement statement = connection.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS)
        ) {
            statement.setString(1, m.getContent());
            statement.setInt(2, m.getId());
            System.out.println(String.format("Session.add <%s>", statement));

            // 执行升级
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return m;
    }


    public TodoModel findByIdBySQL(Integer id) {
        TodoModel m = new TodoModel();

        MysqlDataSource ds = Utility.getDataSource();
        String sql = "select * from `todo` where id = ?";

        try (
                Connection connection = ds.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            statement.setInt(1, id);
            System.out.println(String.format("Session.add <%s>", statement));

            // 执行升级

            // 得到返回结果, 如果用 statement.getResultSet, 会返回一个 null
            // 用 try 语句是为了不用在最后写一个 rs.close()
            try(ResultSet rs = statement.executeQuery()) {
                rs.first();
                Integer i = rs.getInt("id");
                String content = rs.getString("content");

                m.setId(i);
                m.setContent(content);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return m;
    }


//    public ArrayList<TodoModel> allBySQL() {
//        ArrayList<TodoModel> ms = new ArrayList<>();
//
//        MysqlDataSource ds = Utility.getDataSource();
//        String sql = "select * from `todo`";
//
//        try (
//                Connection connection = ds.getConnection();
//                PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
//        ) {
//            System.out.println(String.format("Session.add <%s>", statement));
//
//            // 执行升级
//
//            // 得到返回结果, 如果用 statement.getResultSet, 会返回一个 null
//            // 用 try 语句是为了不用在最后写一个 rs.close()
//            try(ResultSet rs = statement.executeQuery()) {
//                while (rs.next()) {
//                    Integer id = rs.getInt("id");
//                    String content = rs.getString("content");
//
//                    TodoModel m = new TodoModel();
//                    m.setId(id);
//                    m.setContent(content);;
//
//                    ms.add(m);
//
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return ms;
//    }


       public void deleteBySQL(Integer id) {

        MysqlDataSource ds = Utility.getDataSource();
        String sqlInsert = "delete from `todo`  where id = (?)";

        try (
                Connection connection = ds.getConnection();
                PreparedStatement statement = connection.prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS)
        ) {
            statement.setInt(1, id);
            System.out.println(String.format("Session.add <%s>", statement));

            // 执行升级
            statement.executeUpdate();
            // 得到返回结果, 如果用 statement.getResultSet, 会返回一个 null
            // 用 try 语句是为了不用在最后写一个 rs.close()

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
