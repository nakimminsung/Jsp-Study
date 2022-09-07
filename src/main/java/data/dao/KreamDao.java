package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.KreamDto;
import db.DbConnect;

public class KreamDao {
	DbConnect db = new DbConnect();
	
		//전체조회
		public List<KreamDto> getAllDatas(){
			List<KreamDto> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String  sql = "select * from kream order by num desc";
			//디비연결
			conn=db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					KreamDto dto = new KreamDto();
					dto.setNum(rs.getString("num"));
					dto.setCategory(rs.getString("category"));
					dto.setSsize(rs.getString("ssize"));
					dto.setSale(rs.getString("sale"));
					dto.setResale(rs.getString("resale"));
					dto.setPhoto(rs.getString("photo"));
					dto.setKsubject(rs.getString("ksubject"));
					dto.setEsubject(rs.getString("esubject"));
					dto.setDday(rs.getString("dday"));
					
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
	
		//상품명으로 조회
		public List<KreamDto> getSearchDatas(String esubject){
			List<KreamDto> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String  sql = "select * from kream where esubject like ? order by num desc";
			//디비연결
			conn=db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, "%"+esubject+"%");
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					//db에서 가져와서 dto에 담기
					KreamDto dto = new KreamDto();
					dto.setNum(rs.getString("num"));
					dto.setCategory(rs.getString("category"));
					dto.setSsize(rs.getString("ssize"));
					dto.setSale(rs.getString("sale"));
					dto.setResale(rs.getString("resale"));
					dto.setPhoto(rs.getString("photo"));
					dto.setKsubject(rs.getString("ksubject"));
					dto.setEsubject(rs.getString("esubject"));
					dto.setDday(rs.getString("dday"));
					
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
		
		//insert
		public void insertKream(KreamDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = "insert into kream values (null,?,?,?,?,?,?,?,?)";
			//디비연결
			conn=db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setString(1, dto.getCategory());
				pstmt.setString(2, dto.getSsize());
				pstmt.setString(3, dto.getSale());
				pstmt.setString(4, dto.getResale());
				pstmt.setString(5, dto.getPhoto());
				pstmt.setString(6, dto.getKsubject());
				pstmt.setString(7, dto.getEsubject());
				pstmt.setString(8, dto.getDday());
				
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
		public void updateKream(KreamDto dto) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
//			String sql = "update kream set category=?, ssize=?, sale=?, resale=?, ksubject=?, esubject=?, dday=? where num=?";			
 			String sql = "update kream set category=?, ssize=?, sale=?, resale=?, photo=?, ksubject=?, esubject=?, dday=? where num=?";			
			
			
			//디비연결
			conn = db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
			
				System.out.println(dto.getSsize());
				System.out.println(dto.getSale());
				System.out.println(dto.getResale());
				System.out.println(dto.getPhoto());
				System.out.println(dto.getKsubject());
				System.out.println(dto.getEsubject());
				System.out.println(dto.getDday());
				System.out.println(dto.getNum());
				
				//바인딩
				pstmt.setString(1, dto.getCategory());
				pstmt.setString(2, dto.getSsize());
				pstmt.setString(3, dto.getSale());
				pstmt.setString(4, dto.getResale());
				pstmt.setString(5, dto.getPhoto());
				pstmt.setString(6, dto.getKsubject());
				pstmt.setString(7, dto.getEsubject());
				pstmt.setString(8, dto.getDday());
				pstmt.setString(9, dto.getNum());
				
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt);
			}
		}
		
		//삭제
		public void deleteKream(String num) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			String sql = "delete from kream where num=?";
			
			//디비연결
			conn = db.getMysqlConnection();
			
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
		
		//one select
		public KreamDto getData(String num) {
			KreamDto dto = new KreamDto();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from kream where num=?";
			
			//db연결
			conn = db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setString(1, num);
				
				//실행
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setCategory(rs.getString("category"));
					dto.setSsize(rs.getString("ssize"));
					dto.setSale(rs.getString("sale"));
					dto.setResale(rs.getString("resale"));
					dto.setPhoto(rs.getString("photo"));
					dto.setKsubject(rs.getString("ksubject"));
					dto.setEsubject(rs.getString("esubject"));
					dto.setDday(rs.getString("dday"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt, rs);
			}
			return dto;
		}
		
		//num과 	카테고리 읽기
		public List<KreamDto> getCategory(String category) {
			
			System.out.println("START");
			
			List<KreamDto> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from kream where category=?";
			
			//db연결
			conn = db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				//바인딩
				pstmt.setString(1, category);
				
				//실행
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					KreamDto dto = new KreamDto();
					dto.setNum(rs.getString("num"));
					dto.setCategory(rs.getString("category"));
					dto.setSsize(rs.getString("ssize"));
					dto.setSale(rs.getString("sale"));
					dto.setResale(rs.getString("resale"));
					dto.setPhoto(rs.getString("photo"));
					dto.setKsubject(rs.getString("ksubject"));
					dto.setEsubject(rs.getString("esubject"));
					dto.setDday(rs.getString("dday"));
					
					
					System.out.println(rs.getString("esubject") + " !!" );
					//System.out.println(rs.next());
					list.add(dto);
					
				}
				
//				if (rs.next()) {
//					list = getCategoryList(category, rs);
//				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt, rs);
			}
			
			for(KreamDto dto3 : list) {
				
				String cate2 = dto3.getEsubject();
				
				System.out.println(cate2 + "@@@");
			}
			
			return list;
		}
		
		public List<KreamDto> getAllCategory(){
			List<KreamDto> list = new ArrayList<>();
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String  sql = "select * from category";
			//디비연결
			conn=db.getMysqlConnection();
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					KreamDto dto = new KreamDto();
					dto.setCategory(rs.getString("name"));
					dto.setColor(rs.getString("color"));
					
					System.out.println(rs.getString("color"));
					
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
}
