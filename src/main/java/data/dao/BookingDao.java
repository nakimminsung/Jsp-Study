package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import data.dto.BookingDto;
import db.DbConnect;

public class BookingDao {
	DbConnect db = new DbConnect();
	
	//insert
	public void insertBooking(BookingDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="insert into booking values (null,?,?,?,?,?,?,?,now())";
		
		//db연결
		conn = db.getMysqlConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getGender());
			pstmt.setString(3, dto.getBookday());
			pstmt.setInt(4, dto.getInwon());
			pstmt.setString(5, dto.getFoodphoto());
			pstmt.setString(6, dto.getFoodprice());
			pstmt.setString(7, dto.getMessage());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	//전체 출력
	public List<BookingDto> getAllBookings(){
		List<BookingDto> list = new ArrayList<>();
		String sql = "select * from booking order by num asc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//db 연결
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookingDto dto = new BookingDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBookday(rs.getString("bookday"));
				dto.setFoodphoto(rs.getString("foodphoto"));
				dto.setFoodprice(rs.getString("foodprice"));
				dto.setGender(rs.getNString("gender"));
				dto.setInwon(rs.getInt("inwon"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setMessage(rs.getString("message"));
				
				//리스트에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//num에 해당하는 부킹정보 반환
	public BookingDto getBooking(String num) {
		
		BookingDto dto = new BookingDto();
		String sql = "select * from booking where num=?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//db 연결
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBookday(rs.getString("bookday"));
				dto.setFoodphoto(rs.getString("foodphoto"));
				dto.setFoodprice(rs.getString("foodprice"));
				dto.setGender(rs.getNString("gender"));
				dto.setInwon(rs.getInt("inwon"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				dto.setMessage(rs.getString("message"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
}
