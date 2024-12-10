public class Users {
    private String userName ;
    private String passWord ;
    private String age;
    private String job;
    public Users() {
        super();
        // TODO Auto-generated constructor stub
    }
    public String getName() {
        return userName;
    }
    public void setName(String name) {
        this.userName = name;
    }

    public String getPassWord() { return passWord; }
    public void setPassWord(String password) {
        this.passWord = password;
    }

    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }

    public String getJob() { return job; }
    public void setJob(String job) { this.job = job; }

}