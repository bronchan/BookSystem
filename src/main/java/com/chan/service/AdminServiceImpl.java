package com.chan.service;

import com.chan.dao.AdminDao;
import com.chan.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements  AdminService {

    //注解注入
    @Autowired
    private AdminDao adminMapper;
    //手动xml注入
    public void setAdminMapper(AdminDao adminMapper) {
        this.adminMapper = adminMapper;
    }

    public int getTotal() {
        return adminMapper.getTotal();
    }

    public void add(Admin admin) {
         adminMapper.add(admin);
    }

    public int update(Admin admin) {
        return adminMapper.update(admin);
    }

    public int delete(int id) {
        return adminMapper.delete(id);
    }

    public Admin getAdminById(int id) {
        return adminMapper.getAdminById(id);
    }

    public List<Admin> getAllAdmin() {
        return adminMapper.getAllAdmin();
    }
}
