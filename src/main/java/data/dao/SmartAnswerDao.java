package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SmartAnswerDto;
import db.DbConnect;

public class SmartAnswerDao {
	DbConnect db = new DbConnect();
	
	//insert
	public void insertAnswer(SmartAnswerDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		String sql = "insert into smartanswer (num, nickname, content, writeday) values (?,?,?,now())";
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}	
	}
	
	//출력
	public List<SmartAnswerDto> getAnswerList(String num) {
		List<SmartAnswerDto> list = new ArrayList<SmartAnswerDto>();		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from smartanswer where num =" +num;
		
		conn = db.getMysqlConnection(); 
		try {
			pstmt = conn.prepareStatement(sql); 

			rs = pstmt.executeQuery();
			while(rs.next()) { 
				SmartAnswerDto dto = new SmartAnswerDto(); 
				dto.setNum(rs.getString("num"));
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;		
	}
	
	//수정 시 나타낼 데이터
	public SmartAnswerDto getAnswerData(String idx) {
		SmartAnswerDto dto = new SmartAnswerDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from smartanswer where idx =" + idx;

		conn = db.getMysqlConnection(); 
		try {
			pstmt = conn.prepareStatement(sql); 

			rs = pstmt.executeQuery();
			while(rs.next()) { 
				dto.setNum(rs.getString("num"));
				dto.setIdx(rs.getString("idx"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	//수정
	public void updateAnswer(SmartAnswerDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update smartanswer set nickname=?, content=?, where idx=?";
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getIdx());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}	
	}
	
	//삭제
	public void deleteAnswer(String idx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from smartanswer where idx=?";
		
		conn = db.getMysqlConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, idx);
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
}
