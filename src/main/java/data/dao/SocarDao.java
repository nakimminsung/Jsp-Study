package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SocarDto;
import db.DbConnect;

public class SocarDao {

	DbConnect db = new DbConnect();
	
	//전체 데이터 조회
	public List<SocarDto> getAllDatas(){
		List<SocarDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from socar order by num desc";
		
		//db연결
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SocarDto dto = new SocarDto();
				dto.setNum(rs.getInt("num"));
				dto.setCarname(rs.getString("carname"));
				dto.setCarcolor(rs.getString("carcolor"));
				dto.setCaryear(rs.getString("caryear"));
				dto.setCarprice(rs.getInt("carprice"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setCompany(rs.getString("company"));
				
				//list에 추가
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
	
	//전체갯수 반환
	public int getTotalCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total = 0 ;
		
		String sql = "select count(*) from socar";
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return total;
	}
	
	//readcount update
	public void updateReadCount(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update socar set readcount=readcount+1 where num=?";
		
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, num);
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//insert
	public void insertSocar(SocarDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into socar (carname,carcolor,caryear,carprice,company,readcount) values (?,?,?,?,?,0)";
		
		//db 연결
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getCarname());
			pstmt.setString(2, dto.getCarcolor());
			pstmt.setString(3, dto.getCaryear());
			pstmt.setInt(4, dto.getCarprice());
			pstmt.setString(5, dto.getCompany());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//content num에 해당하는 DTO반환
	public SocarDto getContent(String num) {
		
		SocarDto dto = new SocarDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from socar where num=?";
		
		//db 실행
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩 
			pstmt.setString(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setCarname(rs.getString("carname"));
				dto.setCarcolor(rs.getString("carcolor"));
				dto.setCaryear(rs.getString("caryear"));
				dto.setCarprice(rs.getInt("carprice"));
				dto.setCompany(rs.getString("company"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	//삭제
	public void deleteSocar(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from socar where num=?";
		
		//db연결
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, num);
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//수정
	public void updateSocar(SocarDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update socar set carname=?, carcolor=?, caryear=?, carprice=? where num=?";
		
		conn = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getCarname());
			pstmt.setString(2, dto.getCarcolor());
			pstmt.setString(3, dto.getCaryear());
			pstmt.setInt(4, dto.getCarprice());
			pstmt.setInt(5, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//넘버가 맞는지 체크하고 true면 1
	public boolean isNumCheck(String num) {
		boolean check = false;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select count(*) from socar where num=?";
		
		conn  = db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, num);
			
			//실행
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				//초기값이 false
				if(rs.getInt(1)==1) {
					check=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return check;
	}
}
