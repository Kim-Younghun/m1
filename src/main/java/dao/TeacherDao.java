package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Teacher;

public class TeacherDao {
	
	// 강사 1명 상세보기
	public Teacher selectTeacherOne(int teacherNo) throws Exception {
		Teacher teacher = null;
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "SELECT teacher_no, teacher_id, teacher_name, teacher_history, updatedate, createdate FROM teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			teacher = new Teacher();
			teacher.setTeacherNo(rs.getInt("teacher_no"));
			teacher.setTeacherId(rs.getString("teacher_id"));
			teacher.setTeacherName(rs.getString("teacher_name"));
			teacher.setTeacherHistory(rs.getString("teacher_history"));
			teacher.setCreatedate(rs.getString("createdate"));
			teacher.setUpdatedate(rs.getString("updatedate"));
		}
		return teacher;
	}
	
	// 강사 수정 
	public int updateTeacher(Teacher teacher) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "UPDATE teacher SET teacher_id = ?, teacher_name = ?, teacher_history = ?, updatedate=now() WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, teacher.getTeacherId());
		stmt.setString(2, teacher.getTeacherName());
		stmt.setString(3, teacher.getTeacherHistory());
		stmt.setInt(4, teacher.getTeacherNo());
		int row = 0;
		row = stmt.executeUpdate();
		return row;
	}
	
	// 강사 삭제
	public int deleteTeacher(int teacherNo) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql = "DELETE FROM Teacher WHERE teacher_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, teacherNo);
		int row = 0;
		row = stmt.executeUpdate();
		return row;
	}
	
	/*
	* 교과목 연결되지 않은 강사는 출력되지 않는다. inner join -> outer join (teacher_subject, subject 둘다를 LEFT OUTER JOIN 해야함.)
	* selectTeacherListByPage(int beginRow, int rowPerPage)
	* teacherList.jsp + 화면 캡처 + 샘플데이터 추가 
	 
	SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, GROUP_CONCAT(s.subject_name), COUNT(*)
	FROM teacher t INNER JOIN teacher_subject ts
							ON t.teacher_no = ts.teacher_no
								INNER join subject s
								ON ts.subject_no = s.subject_no
	GROUP BY t.teacher_no, t.teacher_id, t.teacher_name
	LIMIT 0, 10
	*/
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		String sql ="SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, GROUP_CONCAT(s.subject_name), COUNT(*)"
				+ " FROM teacher t LEFT OUTER JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no"
				+ " LEFT OUTER JOIN subject s ON ts.subject_no = s.subject_no"
				+ " GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("teacherNo", rs.getInt("t.teacher_no"));
			m.put("teacherId", rs.getString("t.teacher_id"));
			m.put("teacherName", rs.getString("t.teacher_name"));
			m.put("subjectNo", rs.getInt("ts.subject_no"));
			m.put("subjectName", rs.getString("GROUP_CONCAT(s.subject_name)"));
			m.put("cnt", rs.getInt("COUNT(*)"));
			mapList.add(m);
		}
		return mapList;
	}
	
	// 6) 과목전체row
	public int selectTeacherCnt() throws Exception {
		// util항목에서 만든 메서드를 호출
		DBUtil dbutil = new DBUtil();
		// 메서드를 호출해서 conn 동작
		Connection conn = dbutil.getConnection();
		String sql = "SELECT count(*) FROM teacher";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		int row = 0;
		if(rs.next()) {
			row = rs.getInt(1);
		}
		return row;
	}
}
