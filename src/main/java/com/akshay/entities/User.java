
package com.akshay.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(length = 10, name = "User_Id")
        private int userId;
        @Column(length = 30, name = "User_Name")
        private String userName;
        @Column(length = 30, name = "User_Email")
        private String userEmail;
        @Column(length = 30, name = "User_Password")        
        private String userPassword;
        @Column(length = 30, name = "User_Mobile")
        private String userMobile;
        @Column(length = 30, name = "User_Pic")
        private String userPic;
        @Column(length = 30, name = "User_Address")
        private String userAddress;
        @Column(name="user_type")
        private String userType;

    public User(int userId, String userName, String userEmail, String userPassword, String userMobile, String userPic, String userAddress, String userType) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userMobile = userMobile;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User(String userName, String userEmail, String userPassword, String userMobile, String userPic, String userAddress, String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userMobile = userMobile;
        this.userPic = userPic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(String userMobile) {
        this.userMobile = userMobile;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    
    
    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userMobile=" + userMobile + ", userPic=" + userPic + ", userAddress=" + userAddress + '}';
    }
        
        
    
}
