package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SimpleBoardDto;
import db.DbConnect;

public class SimpleBoardDao {
	DbConnect db = new DbConnect();
	
	//전체 조회
	public List<SimpleBoardDto> getAllDatas(){
		List<SimpleBoardDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard order by num desc";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SimpleBoardDto dto = new SimpleBoardDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPass(rs.getString("pass"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
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
	
	//num에 해당하는 DTO 반환
	public SimpleBoardDto getContent(String num) {
		
		SimpleBoardDto dto = new SimpleBoardDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from simpleboard where num=?";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1,num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setPass(rs.getString("pass"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setSubject(rs.getString("subject"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	//insert
	public void insertBoard(SimpleBoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into simpleboard (writer,pass,subject,content,readcount,writeday) values (?,?,?,?,0,now())";
		
		conn=db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//readcount update
	public void updateReadCount(String num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update simpleboard set readcount=readcount+1 where num=?";
		
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
	//전체갯수 반환
		public int getTotalCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int total = 0;
			
			String sql = "select count(*) from simpleboard";
			
			conn=db.getMysqlConnection();
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					total=rs.getInt(1); //1번열
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt, rs);
			}
			return total;
		}
}
