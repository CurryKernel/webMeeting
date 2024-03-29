package DAO;

import VO.Admin;

import java.util.List;

public interface AdminRespository {
    //实现分页的查找
    public List<Admin> findAll(int pageId, int pageSize);
    //无分页
    public List<Admin> findAll();
    //增
    public void insert(String id, String password);
    //根据 id 删除
    public void deleteById(String id);
    //根据 id 修改，修改密码和账号为password，id1
    public void update(String id, String password);
    //查表的总记录数
    public int count();
    //查表是否存在
    //根据id查询
    public Admin findById(String id);

    public String check(String adminId, String password);
}
