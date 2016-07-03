package com.oldwang.oldwangcrm.service;

import com.oldwang.oldwangcrm.model.Users;

/**
 * 账户模块接口
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 * 用户登录
	 * @param name 用户名
	 * @param pwd 用户密码
	 * @return 用户信息
	 */
	public Users loging( String name, String pwd);

	/**
	 * @param 要添加的用户
	 */
	public void addUser(Users user);

	/**
	 * 修改用户
	 * @param users要编辑的用户
	 */
	public void editUser(Users users);

	/**
	 * 修改密码
	 * @param users修改的用户
	 */
	public void modifyPwd(Users user);
}
