public class Voter {
    private String v_id;
    private String v_name;
    private String v_age;
    private String v_sex;
    private String v_data;
    private String v_job;

    public Voter(String id,String name,String age,String sex,String data,String job) {
        this.v_id = id;
        this.v_name = name;
        this.v_age = age;
        this.v_sex = sex;
        this.v_data = data;
        this.v_job = job;
    }

    public String getV_age() {
        return v_age;
    }
    public void setV_age(String v_age) {
        this.v_age = v_age;
    }
    public String getV_data() {
        return v_data;
    }
    public void setV_data(String v_data) {
        this.v_data = v_data;
    }
    public String getV_job() {
        return v_job;
    }
    public void setV_job(String v_job) {
        this.v_job = v_job;
    }
    public String getV_id() {
        return v_id;
    }
    public void setV_id(String v_id) {
        this.v_id = v_id;
    }
    public String getV_name() {
        return v_name;
    }
    public void setV_name(String v_name) {
        this.v_name = v_name;
    }

    public void setV_sex(String v_sex) {
        this.v_sex = v_sex;
    }
    public String getV_sex() {
        return v_sex;
    }

}
