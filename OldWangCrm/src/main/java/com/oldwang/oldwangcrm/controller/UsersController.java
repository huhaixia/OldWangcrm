package com.oldwang.oldwangcrm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oldwang.oldwangcrm.model.Users;
import com.oldwang.oldwangcrm.service.UserService;


/**
 * 账户模块控制器
 * @author Administrator
 *
 */
	@Controller
	public class UsersController {
		@Autowired
		private UserService userService;
		
		@RequestMapping(value="/login",method=RequestMethod.POST)
		public String loginCheck(
				@RequestParam(value = "name") String name,
				@RequestParam(value = "pwd") String pwd,
				Model model){
			String view = null;
			System.out.println("到达LoginCheck"+name+"；"+pwd);
			Users user =userService.loging(name, pwd);
			if(user.getUlevel()==2){
				view="jingLi";
			}else if(user.getUlevel()==1){
				view="dianZhang";
			}else if(user.getUlevel()==0){
				view="salesman";
			} 
			return view;
		}
	}

