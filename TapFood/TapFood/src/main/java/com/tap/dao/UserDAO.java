package com.tap.dao;

import java.util.List;

import com.tap.model.User;

public interface UserDAO {
 void addUser(User user);
 User getUser(int userid);
 void updateUser(User user);
 void deleteUser(int userid);
 List<User >getAllUsers();
 
}
