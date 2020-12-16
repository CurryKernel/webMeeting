package VO;

public class Organize {
    private String organizeId;//用户账号
    private String organizeName;
    private String password;//用户密码
    private String phone;//用户电话
    private String department;//用户所属部门
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOrganizeName() {
        return organizeName;
    }

    public void setOrganizeName(String organizeName) {
        this.organizeName = organizeName;
    }

    public String getOrganizeId() {
        return organizeId;
    }

    public void setOrganizeId(String organizeId) {
        this.organizeId = organizeId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Organize(){
        super();
    }
    public Organize(String organizeId, String organizeName, String password, String phone,String department,String email) {
        super();
        this.organizeId = organizeId;
        this.organizeName = organizeName;
        this.password = password;
        this.phone = phone;
        this.department = department;
        this.email=email;
    }

    @Override
    public String toString() {
        return "Organize{" +
                "organizeId='" + organizeId + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", department='" + department + '\'' +
                ",email='"+email+'\''+
                '}';
    }
}
