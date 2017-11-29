package com.nxd.binjiang.entity.system;

import com.google.gson.Gson;

/**
 * 类名称：User.java
 * 类描述：
 *
 * @author moorgen
 * 作者单位：
 * 联系方式：
 * 创建时间：2014年6月28日
 * @version 1.0
 */
public class User {
    /**
     * @mbg.generated 2017-09-27
     */
    private String userId;

    /**
     * @mbg.generated 2017-09-27
     */
    private String userName;

    /**
     * @mbg.generated 2017-09-27
     */
    private String password;

    /**
     * @mbg.generated 2017-09-27
     */
    private String name;

    /**
     * @mbg.generated 2017-09-27
     */
    private String rights;

    /**
     * @mbg.generated 2017-09-27
     */
    private String roleId;

    /**
     * @mbg.generated 2017-09-27
     */
    private String lastLogin;

    /**
     * @mbg.generated 2017-09-27
     */
    private String ip;

    /**
     * @mbg.generated 2017-09-27
     */
    private String status;

    /**
     * @mbg.generated 2017-09-27
     */
    private String bz;

    /**
     * @mbg.generated 2017-09-27
     */
    private String skin;

    /**
     * @mbg.generated 2017-09-27
     */
    private String email;

    /**
     * @mbg.generated 2017-09-27
     */
    private String number;

    /**
     * @mbg.generated 2017-09-27
     */
    private String phone;

    private String roleName;

    /**
     * @return USER_ID
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * @return USERNAME
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    /**
     * @return PASSWORD
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * @return NAME
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return RIGHTS
     */
    public String getRights() {
        return rights;
    }

    /**
     * @param rights
     */
    public void setRights(String rights) {
        this.rights = rights == null ? null : rights.trim();
    }

    /**
     * @return ROLE_ID
     */
    public String getRoleId() {
        return roleId;
    }

    /**
     * @param roleId
     */
    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    /**
     * @return LAST_LOGIN
     */
    public String getLastLogin() {
        return lastLogin;
    }

    /**
     * @param lastLogin
     */
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin == null ? null : lastLogin.trim();
    }

    /**
     * @return IP
     */
    public String getIp() {
        return ip;
    }

    /**
     * @param ip
     */
    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    /**
     * @return STATUS
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * @return BZ
     */
    public String getBz() {
        return bz;
    }

    /**
     * @param bz
     */
    public void setBz(String bz) {
        this.bz = bz == null ? null : bz.trim();
    }

    /**
     * @return SKIN
     */
    public String getSkin() {
        return skin;
    }

    /**
     * @param skin
     */
    public void setSkin(String skin) {
        this.skin = skin == null ? null : skin.trim();
    }

    /**
     * @return EMAIL
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * @return NUMBER
     */
    public String getNumber() {
        return number;
    }

    /**
     * @param number
     */
    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    /**
     * @return PHONE
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
