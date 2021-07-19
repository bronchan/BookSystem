package com.chan.service;

import com.chan.pojo.Admin;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AdminService {
    int  getTotal();
    void add(Admin admin);
    int update(Admin admin);
    int delete(int id);
    Admin getAdminById(int id);
    List<Admin> getAllAdmin();
}
