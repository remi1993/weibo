package kybmig.ssm.service;


import com.mysql.cj.jdbc.MysqlDataSource;
import kybmig.ssm.Utility;
import kybmig.ssm.mapper.BoardMapper;
import kybmig.ssm.mapper.TodoMapper;
import kybmig.ssm.model.BoardModel;
import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.TodoModel;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class BoardService {
    private BoardMapper mapper;

    public BoardService(BoardMapper boardMapper) {
        this.mapper = boardMapper;
    }


//    public  List<BoardModel> allByMybatis() {
//        List<BoardModel> rs = this.mapper.selectAllBoard();
//        return rs;
//    }

    public ArrayList<BoardModel> allBySQL() {
        ArrayList<BoardModel> ms = new ArrayList<>();

        MysqlDataSource ds = Utility.getDataSource();
        String sql = "select * from `board`";

        try (
                Connection connection = ds.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)
        ) {
            System.out.println(String.format("Session.add <%s>", statement));

            // 执行升级

            // 得到返回结果, 如果用 statement.getResultSet, 会返回一个 null
            // 用 try 语句是为了不用在最后写一个 rs.close()
            try(ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    Integer id = rs.getInt("id");
                    String name = rs.getString("name");

                    BoardModel m = new BoardModel();
                    m.setId(id);
                    m.setName(name);;

                    ms.add(m);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ms;
    }

}
