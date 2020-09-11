package kybmig.ssm.service;


import kybmig.ssm.Utility;
import kybmig.ssm.mapper.TopicCommentMapper;
import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.model.TopicCommentModel;
import kybmig.ssm.model.TopicModel;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Service
public class TopicCommentService {
    private TopicMapper mapper;
    private TopicCommentMapper topicCommentMapper;
    private TopicService topicService;

    public TopicCommentService(TopicMapper topicMapper, TopicCommentMapper topicCommentMapper, TopicService topicService ) {
        this.mapper = topicMapper;
        this.topicCommentMapper = topicCommentMapper;
        this.topicService = topicService;
    }


    public TopicCommentModel add(Integer topicid, String content, Integer userId, Long createdTime, Long updatedTime) {
        TopicCommentModel m = new TopicCommentModel();
        m.setTopicId(topicid);
        m.setContent(content);
        m.setUserId(userId);
        m.setCreatedTime(topicService.createdTime());
        m.setUpdatedTime(topicService.updatedTime());
        // Utility.log("topic add user: %s", m);

        topicCommentMapper.insertTopicComment(m);
        Utility.log("topic add user: %s", m);
        return m;
    }



    public  void update(Integer id, String content, Long updatedTime,Integer TopicId) {
        TopicCommentModel m = new TopicCommentModel();
        m.setId(id);
        m.setTopicId(TopicId);
        m.setContent(content);
        m.setUpdatedTime(topicService.updatedTime());
        topicCommentMapper.updateTopicComment(m);
    }


    public void deleteById(Integer id) {
        topicCommentMapper.deleteTopicComment(id);
    }


    public  TopicCommentModel findById(Integer id) {
        TopicCommentModel m = topicCommentMapper.selectTopicComment(id);
        Utility.log("TopicModel id %s", id);
        Utility.log("TopicModel m %s", m);
        return m;
    }




    public  List<TopicCommentModel> all() {
        return topicCommentMapper.selectAllTopicComment();
    }

    public List<TopicCommentModel> topicCommentList(Integer topicId) {
        return topicCommentMapper.selectAllTopicCommentByTopicId(topicId);
    }


}
