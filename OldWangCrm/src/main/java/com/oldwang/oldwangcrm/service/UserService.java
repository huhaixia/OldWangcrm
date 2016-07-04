package com.oldwang.oldwangcrm.service;

import java.util.List;

import com.oldwang.oldwangcrm.model.Users;

/**
 * 用户服务接口
 * 
 * @author Administrator
 */
public interface UserService {

	/**
	 * 用户登录
	 * 
	 * @param name
	 *            用户名
	 * @param pwd
	 *            密码
	 * @return 用户信息
	 */
	public Users loging(String name, String password);

	/**
	 * 查询所有用户
	 */
	public List<Users> selectAllUsers();

	/**
	 * 添加用户
	 * 
	 * @param 要添加的用户
	 */
	public int addUser(Users user);

	/**
	 * 编辑用户
	 * 
	 * @param users
	 *            要编辑的用户
	 */
	public void editUser(Users user);

	/**
	 * 查询用户信息通过
	 * 
	 * @param id
	 * @return
	 */
	public Users selectById(int id);

	/**
	 * 修改密码
	 * 
	 * @param users
	 *            修改的用户
	 * @param pwd
	 *            新密码
	 * @param password
	 *            原密码
	 */
	public int modifyPwd(String password, String name, String psd);
}
