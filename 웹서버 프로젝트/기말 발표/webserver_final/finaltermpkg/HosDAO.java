package finaltermpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HosDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	public HosDAO() { // 생성자 = 클래스이름과 같은 생성자로 인스턴스를 생성할 때 사용 
		try { //예외처리
			Class.forName("org.postgresql.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url="jdbc:postgresql://localhost:5433/mydb";
		user="studx";
		pass="gkrtod123A!";
	}
	
	public int insertHosuser(String hos_id, String hos_passwd, String hos_name, String hos_phone, String hos_email) throws SQLException{
		String sql = "insert into hosDB(hos_id, hos_passwd, hos_name, hos_phone, hos_email) values (?, ?, ?, ?, ?);";
		try {
			conn = DriverManager.getConnection(url, user, pass); //DB연결 인스턴스
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_id);
			ps.setString(2, hos_passwd);
			ps.setString(3, hos_name);
			ps.setString(4, hos_phone);
			ps.setString(5, hos_email);
			int rec_no = ps.executeUpdate();
			return rec_no;
		} finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		
	}
	
	public int updateReservation(String hos_id, String hos_passwd, String hos_subj, String subj_time) throws SQLException{
		String sql = "update hosDB set hos_subj=?, subj_time=?, reg_time=? where hos_id=? and hos_passwd=?;";
		try {
			conn = DriverManager.getConnection(url, user, pass); //DB연결 인스턴스
			ps = conn.prepareStatement(sql);
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String hos_regdate = formatter.format(new java.util.Date());
			ps.setString(1, hos_subj);
			ps.setString(2, subj_time);
			ps.setString(3, hos_regdate);
			ps.setString(4, hos_id);
			ps.setString(5, hos_passwd);
			
			int rec_no = ps.executeUpdate();
			return rec_no;
		} finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		
	}
	
	public int delReservation(String hos_id) throws SQLException{
		String sql = "update hosDB set hos_subj='null', subj_time='null', reg_time=? where hos_id=?";
		try {
			conn = DriverManager.getConnection(url, user, pass); //DB연결 인스턴스
			ps = conn.prepareStatement(sql);
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
			String hos_regdate = formatter.format(new java.util.Date());
			ps.setString(1, hos_regdate);
			ps.setString(2, hos_id);
			int rec_no = ps.executeUpdate();
			return rec_no;
		} finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		
	}
	
	
	public boolean checkId(String hos_id) throws Exception{
		boolean flag = false;
		String sql = "select * from hosDB where hos_id=?;";
		try {
			conn = DriverManager.getConnection(url, user, pass); //DB연결 인스턴스
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		return flag;
	}
	
	public boolean checkPwd(String hos_id, String hos_passwd) throws SQLException{
		boolean flag = false;
		String sql = "select * from hosDB where hos_id=?;";
		try {
			conn = DriverManager.getConnection(url, user, pass); //MySQL
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(hos_id.equals(rs.getString("hos_id").trim()) && hos_passwd.equals(rs.getString("hos_passwd").trim())) {
					flag = true;
				}else {
					flag = false;
				}
			}
		}finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		return flag;
	}
	
	public boolean checkTime(String hos_subj, String subj_time) throws Exception{
		boolean flag = false;
		String sql = "select * from hosDB where hos_subj=? and subj_time=?;";
		try {
			conn = DriverManager.getConnection(url, user, pass); //DB연결 인스턴스
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_subj);
			ps.setString(2, subj_time);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
		}
		return flag;
	}
	
	public List<HosDTO> findAllHosuser(String hos_id, String hos_passwd) throws SQLException{
		String sql = "select * from hosDB where hos_id=? and hos_passwd=?;";
		List<HosDTO> list = new ArrayList<HosDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_id);
			ps.setString(2, hos_passwd);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		}finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
			if(rs != null)
				rs.close();
		}
	}
	
	public List<HosDTO> findAllAdminHosuser() throws SQLException{
		String sql = "select * from hosDB;";
		List<HosDTO> list = new ArrayList<HosDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		}finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
			if(rs != null)
				rs.close();
		}
	}
	
	public List<HosDTO> findNameHosuser(String hos_search, String search_select) throws SQLException{
		String sql = "select * from studuser where "+ search_select + "=?;";
		List<HosDTO> list = new ArrayList<HosDTO>();
		try {
			conn = DriverManager.getConnection(url, user, pass);
			ps = conn.prepareStatement(sql);
			ps.setString(1, hos_search);
			ResultSet rs = ps.executeQuery();
			list = makelist(rs);
			return list;
		}finally {
			if(ps != null)
				ps.close();
			if(conn != null)
				conn.close();
			if(rs != null)
				rs.close();
		}
	}
	public List<HosDTO> makelist(ResultSet rs) throws SQLException{
		List<HosDTO> list = new ArrayList<HosDTO>();
		while(rs.next()) {
			HosDTO dto = new HosDTO();
			dto.setHos_id(rs.getString("hos_id"));
			dto.setHos_name(rs.getString("hos_name"));
			dto.setHos_phone(rs.getString("hos_phone"));
			dto.setHos_email(rs.getString("hos_email"));
			dto.setHos_subj(rs.getString("hos_subj"));
			dto.setSubj_time(rs.getString("subj_time"));
			dto.setReg_time(rs.getString("reg_time"));		
			
			list.add(dto);	
		}
		return list;
	}
}
