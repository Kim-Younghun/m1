package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.DBUtil;
import vo.Subject;

public class SubjectDao {
	// 1) 과목목록
	public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, updatedate, createdate FROM subject LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Subject> list = new ArrayList<>();
		while(rs.next()) {
			Subject s = new Subject();
			s.setSubjectNo(rs.getInt("subjectNo"));
			s.setSubjectName(rs.getString("subjectName"));
			s.setSubjectTime(rs.getInt("subjectTime"));
			s.setCreatedate(rs.getString("createdate"));
			s.setUpdatedate(rs.getString("updatedate"));
			list.add(s);
		}
		return list;
	}
	
	// 2) 과목추가
	public int insertSubject(Subject subject) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "INSERT INTO subject(subject_name subjectName, subject_time subjectTime, updatedate, createdate) VALUES(?, ?, NOW(), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		
		int row = 0;
		row = stmt.executeUpdate();
		return row;
	}
	
	// 3) 과목삭제 -> 1개의 행 삭제
	public int deleteSubject(int subjectNo) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "DELETE FROM Subject WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		int row = 0;
		row = stmt.executeUpdate();
		return row;
	}
	
	// 4) 과목수정 ->
	public int updateSubject(Subject subject) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "UPDATE subject SET subject_name = ?, subject_time = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, subject.getSubjectName());
		stmt.setInt(2, subject.getSubjectTime());
		int row = 0;
		row = stmt.executeUpdate();
		return row;
	}
	
	// 5) 과목 하나 상세
	public Subject selectSubjectOne(int subjectNo) throws Exception {
		Subject subject = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT subject_no subjectNo, subject_name subjectName, subject_time subjectTime, updatedate, createdate FROM subject WHERE subject_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, subjectNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			subject = new Subject();
			subject.setSubjectNo(rs.getInt("subjectNo"));
			subject.setSubjectName(rs.getString("subjectName"));
			subject.setSubjectTime(rs.getInt("subjectTime"));
			subject.setCreatedate(rs.getString("createdate"));
			subject.setUpdatedate(rs.getString("updatedate"));
		}
		
		return subject;
	}
	
	// 6) 과목전체row
	public int selectSubjectCnt() throws Exception {
		// util항목에서 만든 메서드를 호출
		DBUtil dbutil = new DBUtil();
		// 메서드를 호출해서 conn 동작
		Connection conn = dbutil.getConnection();
		String sql = "SELECT count(*) FROM subject";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		int row = 0;
		if(rs.next()) {
			row = rs.getInt(1);
		}
		return row;
	}
}
