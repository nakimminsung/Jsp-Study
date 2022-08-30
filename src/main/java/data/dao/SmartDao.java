package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.SmartDto;
import db.DbConnect;

public class SmartDao {
	DbConnect db = new DbConnect();
	
	//insert
	public void insertSmart(SmartDto dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into smartbbs (writer,subject,content,mainphoto,writeday) values (?,?,?,?,now())";
		
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getMainphoto());
			
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//pagin list
	public List<SmartDto> getPagingList(int startNum,int perPage)
	{
		List<SmartDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from smartbbs order by num desc limit ?,?";

		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			
			//실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SmartDto dto = new SmartDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setMainphoto(rs.getString("mainphoto"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcount(rs.getInt("readcount"));
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
	
	
	//one select
		public SmartDto getData(String num)
		{
			SmartDto dto=new SmartDto();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from smartbbs where num=?";

			conn=db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setString(1, num);
				
				//실행
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setWriter(rs.getString("writer"));
					dto.setContent(rs.getString("content"));
					dto.setMainphoto(rs.getString("mainphoto"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcount(rs.getInt("readcount"));
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
		
	//readcount update
	public void updateReadCount(String num)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update smartbbs set readcount=readcount+1 where num=?";
		
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
	
	//update
	public void updateSmart(SmartDto dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update smartbbs set writer=?, subject=?, content=?, mainphoto=? where num=?";
		
		conn=db.getMysqlConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getMainphoto());
			pstmt.setString(5, dto.getNum());
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}	
	}

	//delete
	public void deleteSmart(String num)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from smartbbs where num=?";

		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);

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
	
	//가장 최근에 추가된 글의 num값 얻기
	public int getMaxnum() {
		int max = 0;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select max(num) max from smartbbs";

		conn = db.getMysqlConnection();

		//pstmt
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt("max"); // rs.getInt(1) 이렇게 써도됨
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return max;
	}
	
	//전체갯수 반환
	public int getTotalCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total = 0;

		String sql = "select count(*) from smartbbs";

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
