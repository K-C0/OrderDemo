package org.wdl.hotelTest.bean;

public class User implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String loginName;
	private String password;
	private String email;
	private String phone;
	private java.util.Date createDate;
	private int disabled;//0：新建   1：已激活
	private int createUserId;
	private int roleId;
	
	private User createUser;
	
	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setLoginName(String loginName){
		this.loginName = loginName;
	}
	public String getLoginName(){
		return this.loginName;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return this.password;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	public void setPhone(String phone){
		this.phone = phone;
	}
	public String getPhone(){
		return this.phone;
	}
	
	public void setCreateDate(java.util.Date createDate){
		this.createDate = createDate;
	}
	public java.util.Date getCreateDate(){
		return this.createDate;
	}
	public void setDisabled(int disabled){
		this.disabled = disabled;
	}
	public int getDisabled(){
		return this.disabled;
	}
	
	
	public int getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(int createUserId) {
		this.createUserId = createUserId;
	}
	public User getCreateUser() {
		return createUser;
	}
	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", loginName=" + loginName + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", createDate=" + createDate + ", disabled=" + disabled + ", createUserId="
				+ createUserId + ", roleId=" + roleId + ", createUser=" + createUser + "]";
	}
	
	
}