package kybmig.ssm.service;


import kybmig.ssm.Utility;
import kybmig.ssm.mapper.WeiboMapper;
import kybmig.ssm.model.ModelFactory;
import kybmig.ssm.model.TodoModel;
import kybmig.ssm.model.WeiboModel;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WeiboService {
    private WeiboMapper mapper;

    public WeiboService (WeiboMapper weiboMapper) {
        this.mapper = weiboMapper;
    }

    public Long createdTime (){
        Long time = System.currentTimeMillis() ;
        Utility.log("createdtime1 %s" ,time);
        return time;
    }

    public WeiboModel add(String content, Integer userId, Long createdTime) {
        WeiboModel m = new WeiboModel();
        m.setContent(content);
        m.setUserId(userId);
        m.setCreatedTime(this.createdTime());
        Utility.log("weibo add user: %s", m);
        mapper.insertWeibo(m);
        return m;
    }


    public  void update(Integer id, String content) {
        WeiboModel m = new WeiboModel();
        m.setId(id);
        m.setContent(content);
        mapper.updateWeibo(m);
    }

    public void deleteById(Integer id) {
        mapper.deleteWeibo(id);
    }


    public List<WeiboModel> findByuserId(Integer userId) {
        List<WeiboModel> m = mapper.selectOneWithWeibo(userId);
        return m;
    }

    public  WeiboModel findById(Integer id) {
        Utility.log("成功进入findebyid");
        WeiboModel m = mapper.selectWeibo(id);
        return m;
    }


    public  ArrayList<WeiboModel> all() {
        return load();
    }

    public ArrayList<WeiboModel> load() {
        String className = WeiboModel.class.getSimpleName();

        ArrayList<WeiboModel> ms = ModelFactory.load(className, 2, modelData -> {
            Integer id = Integer.valueOf(modelData.get(0));
            String content = modelData.get(1);

            WeiboModel m = new WeiboModel();
            m.setId(id);
            m.setContent(content);
            return m;
        });
        return ms;
    }

    public static void save(ArrayList<WeiboModel> list) {
        String className = WeiboModel.class.getSimpleName();
        ModelFactory.save(className, list, model -> {
            ArrayList<String> lines = new ArrayList<>();
            lines.add(model.getId().toString());
            lines.add(model.getContent());
            return lines;
        });
    }
}
