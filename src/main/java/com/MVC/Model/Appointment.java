package com.MVC.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;

public class Appointment {
	private Connection con;
	HttpSession se;
	public Appointment(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/PetHub1","root","Vaish@099" );
			se=session;
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	}
	public String addPatient(String name,String phone,String date,String disease) {
		PreparedStatement ps=null;
		String status="";
		String query="SELECT * FROM patient WHERE phone='"+phone + "'or disease='"+disease+"';";
		try {
			Statement st = null;
			ResultSet rs = null;
			st=con.createStatement();
			rs=st.executeQuery(query);
			boolean b = rs.next();
			if(b) {
				status="existed";
			}
			else {
				ps=con.prepareStatement("insert into patient values(?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, date);
				ps.setString(4, disease);
				int a=ps.executeUpdate();
				if(a>0) {
					status="success";
				}else {
					status="failure";
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	public ArrayList<AppointmentPojo> getAppinfo(){
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<AppointmentPojo> al = new ArrayList<>();
		try {
		    String query = "select * from patient";
		    ps = con.prepareStatement(query);
		   
		    rs = ps.executeQuery();
		    while (rs.next()) {
		        AppointmentPojo a = new AppointmentPojo();
		        a.setP_name(rs.getNString("p_name"));
		        a.setPhone(rs.getNString("phone"));
		        a.setDate(rs.getDate("appointment_date"));
		        a.setDisease(rs.getString("disease"));
		        al.add(a);
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		} finally {
		    if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    if (ps != null) {
		        try {
		            ps.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		}
		return al;
	}
	

}
