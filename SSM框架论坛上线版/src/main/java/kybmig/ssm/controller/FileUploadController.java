package kybmig.ssm.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Controller
public class FileUploadController {
    String dir = "avatar";


    @GetMapping("/upload/index")
    public ModelAndView uploadView() {
        return new ModelAndView("public/upload");
    }

    @PostMapping("/upload")
    @ResponseBody
    public String singleFileUpload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "空文件";
        } else {
            String path = dir + "/" + file.getOriginalFilename();
            try (FileOutputStream os = new FileOutputStream(path)) {
                os.write(file.getBytes());
                return "上传成功";
            } catch (IOException e) {
                String s = String.format("Save file <%s> error <%s>", path, e);
                // throw new RuntimeException(s);
                e.printStackTrace();
                return "上传失败";
            }
        }
    }

    @GetMapping("/avatar/{imageName}")
    public ResponseEntity<byte[]> avatar(@PathVariable String imageName) {
        String path = dir + "/" + imageName;

        byte[] content;
        try (FileInputStream is = new FileInputStream(path)) {

            content = is.readAllBytes();
        } catch (IOException e) {
            String s = String.format("Load file <%s> error <%s>", path, e);
            throw new RuntimeException(s);
        }

        ResponseEntity<byte[]> image = ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).
                contentType(MediaType.IMAGE_JPEG).body(content);
        return image;
    }

}
