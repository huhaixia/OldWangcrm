package com.oldwang.oldwangcrm.mapping;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.oldwang.oldwangcrm.service.UserService;

/**
 * 账户数据层
 * @author Administrator
 *
 */
public interface UserMapper {

	/**
	 * 用户登录
	 * @param name 用户名
	 * @param pwd用户密码
	 * @return 用户信息
	 */
	@Select("select * from users where name=#{name} and pwd=#{pwd}")
	public UserService loging(@Param("name") String name, @Param("pwd") String pwd);

	/**
	 * 添加用户
	 * 
	 * @param 要添加的用户
	 */
	@Insert("insert into users values(#{user.id},#{user.name},#{user.password}"
			+ "#{user.phone},#{user.idcard},#{user.store},#{user.ulevel},#{user.state})")
	public void addUser(UserService user);

	/**
	 * 编辑用户
	 * @param users 要编辑的用户
	 */
	@Update("update users set x")
	public void editUser(UserService users);

	/**
	 * 修改密码
	 * @param users 修改的用户
	 */
	@Update("update users set password={#password} where name=#{user.name} and password=#{user.password}")
	public void modifyPwd(UserService user);

}
