package com.oldwang.oldwangcrm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldwang.oldwangcrm.mapping.UserMapper;
import com.oldwang.oldwangcrm.model.Users;
import com.oldwang.oldwangcrm.service.UserService;

/**
 * 用户服务接口实现类
 * 
 * @author Administrator
 */
@Service(value = "userService")
public class UserServiceImpl implements UserService {

	/**
	 * 声明用户数据层
	 */
	@Autowired
	private UserMapper userMapper;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	/**
	 * 登录方法实现
	 */
	@Override
	public Users loging(String name, String pwd) {

		return userMapper.loging(name, pwd);
	}

	/**
	 * 添加用户实现
	 */
	@Override
	public int addUser(Users user) {
		return userMapper.addUser(user);
	}

	/**
	 * 编辑用户
	 */
	@Override
	public void editUser(Users user) {
		userMapper.editUser(user);
	}

	/**
	 * 修改密码实现
	 */
	@Override
	public int modifyPwd(String pwd, String name, String password) {
		return userMapper.modifyPwd(pwd, name, password);
	}

	@Override
	public List<Users> selectAllUsers() {
		return userMapper.selectAllUsers();

	}

	/**
	 * 查询用户实现
	 */
	@Override
	public Users selectById(int id) {
		return userMapper.selectById(id);

	}

}
