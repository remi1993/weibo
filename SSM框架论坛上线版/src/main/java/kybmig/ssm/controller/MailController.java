package kybmig.ssm.controller;

import kybmig.ssm.Utility;
import org.springframework.boot.autoconfigure.mail.MailProperties;
import org.springframework.core.task.AsyncTaskExecutor;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Component
class AsyncTask {
    private MailSender sender;
    private MailProperties mailProperties;

    public AsyncTask(MailSender sender, MailProperties mailProperties) {
        this.sender = sender;
        this.mailProperties = mailProperties;
    }


    @Async
    public void sendMail(String address, String title, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(mailProperties.getUsername());
        mailMessage.setSubject(title);
        mailMessage.setTo(address);
        mailMessage.setText(content);

        sender.send(mailMessage);
        Utility.log("异步发送邮件函数");
    }
}

@Controller
@RequestMapping("/mail")
public class MailController {
    private MailSender sender;
    private MailProperties mailProperties;
    private AsyncTask asyncTask;

    public MailController(MailSender sender, MailProperties mailProperties, AsyncTask asyncTask) {
        this.sender = sender;
        this.mailProperties = mailProperties;
        this.asyncTask = asyncTask;
    }

    @GetMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("mail/index");
    }

    public void sendMail(String address, String title, String content) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(mailProperties.getUsername());
        mailMessage.setSubject(title);
        mailMessage.setTo(address);
        mailMessage.setText(content);

        sender.send(mailMessage);
    }

    @GetMapping("/send")
    public ModelAndView send(String address, String title, String content) {
        sendMail(address, title, content);

        return new ModelAndView("/mail/index");
    }


    @ResponseBody
    @PostMapping("/send/async")
    public String  sendAsync(String address, String title, String content) {
        asyncTask.sendMail(address, title, content);
        Utility.log("发送邮件完毕");
        return "发送成功";
    }
}
