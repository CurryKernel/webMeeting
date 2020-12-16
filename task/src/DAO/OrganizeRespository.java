package DAO;

public interface OrganizeRespository {

    public String insert(String organizeId, String organizeName, String password, String phone,String department,String email);

    public String checkOrganizeId(String organizeId);

    public String check(String organizeId,String password);
}
