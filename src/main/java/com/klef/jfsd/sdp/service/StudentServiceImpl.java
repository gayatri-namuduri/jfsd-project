package com.klef.jfsd.sdp.service;

import java.sql.Blob;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.AssignmentRepository;
import com.klef.jfsd.sdp.repository.CourseMappingRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseMappingRepository courseMappingRepository;
	
	@Autowired
	private AssignmentRepository assignmentRepository;

	@Override
	public Student checkstudentlogin(int id, String pwd) 
	{
		return studentRepository.checkstudentlogin(id, pwd);
	}

	@Override
	public Student ViewStudentByID(int id) 
	{
		return studentRepository.findById(id).get();
	}

	@Override
	public List<CourseMapping> viewstucourses(int id) 
	{
		return courseMappingRepository.viewstucourses(id);
	}

	@Override
	public List<Assignment> viewassignments(int fid,int sid) 
	{
		return assignmentRepository.viewassignments(fid,sid);
	}

	@Override
	public Assignment displayassignmentbyid(int fid,int sid) 
	{
		return assignmentRepository.viewassignment(fid, sid);
	}

	@Override
	public List<CourseMapping> viewfaclist(int id, String code) 
	{
		return courseMappingRepository.viewfaclist(id, code);
	}

	@Override
	public String saveAssignmentFile(int id, Blob blob) 
	{
		
		assignmentRepository.uploadassignment(blob, id);
		return "Assignment uploaded successfully";
	}

	@Override
	public Assignment viewassignmentbyid(int id) 
	{
		return assignmentRepository.findById(id).get();
	}

	@Override
	public List<Student> viewstudentsbyfaculty(int id) 
	{
		return courseMappingRepository.studentlist(id);
	}

	@Override
	public Student checkstuid(int id) 
	{
		return studentRepository.checkstudentid(id);
	}

	@Override
	public String resetpwd(int id, String pwd) 
	{
		studentRepository.resetpwd(id,pwd);
		return "Password Updated Successfully";
	}
}
