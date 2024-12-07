package com.klef.jfsd.sdp.service;

import java.sql.Blob;
import java.util.List;
import java.util.Optional;

import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Student;

public interface StudentService 
{
	public Student checkstudentlogin(int id,String pwd);
	public Student ViewStudentByID(int id);
	public List<CourseMapping> viewstucourses(int id);
	public List<Assignment> viewassignments(int fid,int sid);
	public Assignment displayassignmentbyid(int fid,int sid);
	public List<CourseMapping> viewfaclist(int id, String code);
	public String saveAssignmentFile(int id, Blob blob);
	public Assignment viewassignmentbyid(int id);
	public List<Student> viewstudentsbyfaculty(int id);
	public Student checkstuid(int id);
	public String resetpwd(int id,String pwd);
}
