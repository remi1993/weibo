package kybmig.ssm.service;


import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TopicCommentMapper;
import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class UserindexService {
    private TopicMapper mapper;
    private TopicCommentMapper topicCommentMapper;



    public UserindexService(TopicMapper topicMapper, TopicCommentMapper topicCommentMapper) {
        this.mapper = topicMapper;
        this.topicCommentMapper = topicCommentMapper;
    }



    public  List<TopicModel> findByUserId(Integer userId) {
        List<TopicModel> m = mapper.selectOneWithCommentsByuserId(userId);
//        Utility.log("TopicModel id %s", userId);
//        Utility.log("TopicModel m %s", m);
        return m;
    }

    public  List<TopicModel> findTopicCommentByUserId(Integer userId) {
        List<TopicModel> m = mapper.selectOneWithCommentsWithUserByuserId(userId);
//        Utility.log("TopicModel id %s", userId);
//        Utility.log("TopicModel m %s", m);
        return m;
    }
}
