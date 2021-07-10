package finaltermpkg;

public class HosDTO {
	String hos_id; 
	String hos_passwd; 
	String hos_name;
	String hos_phone; 
	String hos_email;
	String hos_subj;
	String subj_time;
	String reg_time;
	private boolean verified;
	public String getHos_id() {
		return hos_id;
	}
	public void setHos_id(String hos_id) {
		this.hos_id = hos_id;
	}
	public String getHos_passwd() {
		return hos_passwd;
	}
	public void setHos_passwd(String hos_passwd) {
		this.hos_passwd = hos_passwd;
	}
	public String getHos_name() {
		return hos_name;
	}
	public void setHos_name(String hos_name) {
		this.hos_name = hos_name;
	}
	public String getHos_phone() {
		return hos_phone;
	}
	public void setHos_phone(String hos_phone) {
		this.hos_phone = hos_phone;
	}
	public String getHos_email() {
		return hos_email;
	}
	public void setHos_email(String hos_email) {
		this.hos_email = hos_email;
	}
	public String getHos_subj() {
		return hos_subj;
	}
	public void setHos_subj(String hos_subj) {
		this.hos_subj = hos_subj;
	}
	public String getSubj_time() {
		return subj_time;
	}
	public void setSubj_time(String subj_time) {
		this.subj_time = subj_time;
	}
	public String getReg_time() {
		return reg_time;
	}
	public void setReg_time(String reg_time) {
		this.reg_time = reg_time;
	}
	public boolean isVerified() {
		return verified;
	}
	public void setVerified(boolean verified) {
		this.verified = verified;
	}

}
