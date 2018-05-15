package com.xkj.ce.web.handler;

import java.io.File;
import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.xkj.ce.entity.Duser;
import com.xkj.ce.entity.PaginationBean;
import com.xkj.ce.service.UserService;
import com.xkj.ce.util.ServletUtil;

@Controller
@RequestMapping("/dai")
@SessionAttributes({ "loginUser" })
public class UserOfDaiHandler {

	@Autowired
	private UserService userService;

	@RequestMapping("refuse")//同意  申请成为待递员
	@ResponseBody
	public boolean refuseDai(String uuid){
		boolean result =false;
		result=userService.refuseDai(uuid);
		return result;
	}
	
	@RequestMapping("agree")//同意  申请成为待递员
	@ResponseBody
	public boolean agreeDai(String uuid){
		boolean result =false;
		result=userService.agreeDai(uuid);
		return result;
	}

	@RequestMapping("/RegisterDai")//待递员注册
	@ResponseBody
	public String RegisterDai(@RequestParam(name = "uuid", required = false) Integer uuid,
			@RequestParam(name = "dspic", required = false) MultipartFile dspic, String dsid) {
		LogManager.getLogger().debug("待递员申请注册...uuid:" + uuid + "\t dsid:" + dsid);
		boolean result = false;
		
		if(userService.getdidbyuuid(uuid)!= null){
			return String.valueOf(result);
		}
		
		Duser duser = new Duser();
		if (dspic != null && !dspic.isEmpty()) {
			try {
				File file = new File(ServletUtil.UPLOAD_DIR, dspic.getOriginalFilename());
				dspic.transferTo(file);
				duser.setDspic("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + dspic.getOriginalFilename());
				LogManager.getLogger().debug("学生证图片上传成功，上传地址为:" + file);
			} catch (IllegalStateException | IOException e) {
				LogManager.getLogger().debug("学生证图片上传失败：", e);
			}
		}
		duser.setDsid(dsid);
		duser.setUuid(uuid);
		duser.setDscore("100");
		duser.setDnum("0");
		result = userService.RegisterDai(duser);
		return String.valueOf(result);
	}

	
	@RequestMapping("/listDai") // 分页, 查看所有待递员的申请信息
	@ResponseBody // @ResponseBody做json异步响应处理注解，响应的数据对象，springMVC会把此对象转换成json字符串响应
	public PaginationBean<Duser> listDai(String page, String rows) {
		LogManager.getLogger().debug("请求UserHandler进行listDai的操作....");
		PaginationBean<Duser> list = userService.listDai(page, rows);
		return list;
	}
}
