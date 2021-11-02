package com.yiju.controller.util;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

public class UploadFiles {

//    /**
//     * 多文件上传
//     * @param request 类型为HttpServletRequest
//     * @param files 类型为MultipartRequest
//     * @throws IOException
//     */
//    public static Map<String, Object> uploadFiles(HttpServletRequest request, MultipartRequest files) throws IOException {
//
//        Map<String, Object> filePathMap = new HashMap<>();
//        Map<String, MultipartFile> fileMap = files.getFileMap();
//        Set<String> keySet = fileMap.keySet();
//        for(String key:keySet) {
//            MultipartFile file = fileMap.get(key);
//            String originalFilename = file.getOriginalFilename();
//
//            String path = request.getServletContext().getRealPath("/upload");
//            String basePath = path.split("webapps")[0] + "webapps\\upload";
//            File fileUpload = new File(basePath);
//            if(!fileUpload.exists()) {
//                fileUpload.mkdir();
//            }
//            String time = new SimpleDateFormat("yyyyMMdd").format(new Date());
//            String uuid = UUID.randomUUID().toString();
//            String positivePath = "uploads/"+ time + uuid + originalFilename; // 相对路径 uploads/xxx.jpg
//            String filePath = basePath + "\\" + time + uuid + originalFilename;
//            file.transferTo(new File(filePath));
//            filePathMap.put(time + uuid, positivePath);
//        }
//        return filePathMap;
//    }

    /**
     * 随机生成图片名字
     * @return 随机生成的名字
     * @throws Exception
     */
    public static String getRandomImageName() throws Exception {

        return new SimpleDateFormat("yyyyMMdd").format(new Date()) + UUID.randomUUID().toString();
    }

    //单文件上传到七牛云平台
    public String singleFileUpload(MultipartFile image) throws Exception {

        byte[] bytes = image.getBytes();
        String imageName = new SimpleDateFormat("yyyyMMdd").format(new Date()) + UUID.randomUUID().toString();
        String url = QiniuCloudUtil.put64Image(bytes, imageName);
        //System.out.println(url);
        return url;
    }

    //多文件上传到指定路径
    public static Set<String> uploadFiles(HttpServletRequest request, MultipartRequest files) throws IOException {

        Set<String> filePathMap = new HashSet<>();
        Map<String, MultipartFile> fileMap = files.getFileMap();
        Set<String> keySet = fileMap.keySet();
        for(String key:keySet) {
            MultipartFile file = fileMap.get(key);

            //以下可以使用单文件上传的方式上传文件到七牛云
            String originalFilename = file.getOriginalFilename();

            String path = request.getServletContext().getRealPath("/upload");
            String basePath = path.split("webapps")[0] + "webapps\\upload";
            File fileUpload = new File(basePath);
            if(!fileUpload.exists()) {
                fileUpload.mkdir();
            }
            String time = new SimpleDateFormat("yyyyMMdd").format(new Date());
            String uuid = UUID.randomUUID().toString();
            //String positivePath = "uploads/"+ time + uuid + originalFilename; // 相对路径 uploads/xxx.jpg
            String positivePath = time + uuid + originalFilename; // 相对路径 uploads/xxx.jpg
            String filePath = basePath + "\\" + time + uuid + originalFilename;
            file.transferTo(new File(filePath));
            filePathMap.add(positivePath);
        }
        return filePathMap;
    }


}
