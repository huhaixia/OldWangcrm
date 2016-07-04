package com.oldwang.oldwangcrm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.oldwang.oldwangcrm.model.Users;
import com.oldwang.oldwangcrm.service.UserService;

/**
 * 管理用户Controller
 * 
 * @author Administrator
 */
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	/**
	 * 用户登录
	 * 
	 * @param name
	 * @param password
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginCheck(@RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password, HttpSession session, Model model) {
		String view = null;
		Users user = userService.loging(name, password);
		System.out.println("用户登录：" + name);
		session.setAttribute("uname", name);
		if (user.getUlevel() == 2) {
			view = "manager";// 经理
		} else if (user.getUlevel() == 1) {
			view = "DianZhang";// 店长
		} else if (user.getUlevel() == 0) {
			view = "salesman";// 业务员
		}
		return "Index";
	}

	/**
	 * 查询用户
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/selectAll", method = RequestMethod.GET)
	public String selectAll(Model model) {
		List<Users> list = userService.selectAllUsers();
		model.addAttribute("list", list);
		System.out.println(list.size());
		return "allUsers";
	}

	/**
	 * 添加用户跳转添加信息界面
	 * 
	 * @param moudel
	 * @return
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUser(Model moudel) {

		return "addUser";

	}

	/**
	 * 添加用户
	 * 
	 * @param request
	 * @param user
	 * @param moudel
	 * @throws IOException
	 */
	// 完整的参数项为：@RequestMapping(value="",method =
	// {"",""},headers={},params={"",""})，各参数说明如下：
	// value :String[] 设置访问地址
	// method: RequestMethod[]设置访问方式，字符数组，查看RequestMethod
	// 类，包括GET, HEAD, POST, PUT, DELETE, OPTIONS, TRACE,常用
	// RequestMethod.GET，RequestMethod.POST
	// headers:String[] headers一般结合method = RequestMethod.POST使用
	// params: String[] 访问参数设置，字符数组 例如：userId=id
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUs(
			// 在SpringMVC后台控制层获取参数的方式主要有两种，一种是request.getParameter("name")，
			// 另外一种是用注解@RequestParam直接获取。
			@RequestParam(value = "name") String name, @RequestParam(value = "password") String password,
			@RequestParam(value = "phone") String phone, @RequestParam(value = "idcard") String idcard,
			@RequestParam(value = "store_id") int storeid, @RequestParam(value = "state") int state,
			@RequestParam(value = "ulevel") int ulevel, Users user, Model moudel) throws IOException {
		System.out.println(name + ":" + password + ":" + phone + ":" + idcard + ":" + state + ":" + ulevel);
		user.setName(name);
		user.setPassword(password);
		user.setPhone(phone);
		user.setIdcard(idcard);
		user.setState(state);
		user.setUlevel(ulevel);
		int row = userService.addUser(user);
		if (row >= 1) {
			return "redirect:/selectAll";
		} else {
			return "error";
		}

	}

	/**
	 * 修改密码
	 * 
	 * @param model
	 */
	@RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
	public String modifyPwd(@RequestParam(value = "pwd") String pwd, @RequestParam(value = "name") String name,
			@RequestParam(value = "password") String password) {

		System.out.println(name + "pwd:" + pwd + "pass:" + password);
		int row = userService.modifyPwd(pwd, name, password);
		if (row >= 1) {
			return "login";
		} else {
			return "error";
		}

	}

	/**
	 * 修改用户
	 * 
	 * @param request
	 */
	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.GET)
	public String editUser(@PathVariable("id") int id, Model model) {
		Users user = userService.selectById(id);
		System.out.println(id);
		System.out.println(user.getPhone());
		model.addAttribute("user", user);
		return "editUser";
	}

	/**
	 * 用户编辑
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/editUser/editUs", method = RequestMethod.POST)
	public String editUs(HttpServletRequest request, Users user) {
		System.out.println(">>>>>>>>>>>>>>>>");
		user.setName(request.getParameter("name"));
		user.setPhone(request.getParameter("phone"));
		user.setIdcard(request.getParameter("idcard"));
		user.setStoreid(request.getParameter("storeid"));
		user.setState(Integer.parseInt(request.getParameter("state")));
		user.setUlevel(Integer.parseInt(request.getParameter("ulevel")));
		userService.editUser(user);
		return "redirect:/selectAll";

	}

	/**
	 * 退出
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@RequestMapping(value = "/exit", method = RequestMethod.GET)
	public void exitLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		request.getSession().invalidate();
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache ");
		response.setDateHeader("Expires", -10);
		response.sendRedirect("/bluesky_crm2");
	}

}
