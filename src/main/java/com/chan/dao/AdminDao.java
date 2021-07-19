package com.chan.dao;

import com.chan.pojo.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminDao {
    int  getTotal();
    void add(Admin admin);
    int update(Admin admin);
    int delete(int id);
    Admin getAdminById(int id);
    List<Admin> getAllAdmin();

}
