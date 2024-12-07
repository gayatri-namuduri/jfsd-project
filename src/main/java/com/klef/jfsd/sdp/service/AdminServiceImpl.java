package com.klef.jfsd.sdp.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Academics;
import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.repository.AcademicsRepository;
import com.klef.jfsd.sdp.repository.AdminRepository;
import com.klef.jfsd.sdp.repository.CourseMappingRepository;
import com.klef.jfsd.sdp.repository.CourseRepository;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;
import com.klef.jfsd.sdp.repository.StudentRepository;

import jakarta.transaction.Transactional;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private CourseMappingRepository courseMappingRepository;
	
	@Autowired
	private AcademicsRepository academicsRepository;
	
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Override
	public Admin checkadminlogin(String uname, String pwd) 
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public String addstudent(Student s) 
	{
		studentRepository.save(s);
		return "Student added successfully";
	}

	@Override
	public String addfaculty(Faculty f) 
	{
		facultyRepository.save(f);
		return "Faculty added successfully";
	}

	@Override
	public List<Student> viewallstudents() 
	{
		return (List<Student>) studentRepository.findAll();
	}

	@Override
	public List<Faculty> viewallfaculty() 
	{
		return facultyRepository.findAll();
	}

	@Override
	public String addcourse(Course c) 
	{
		courseRepository.save(c);
		return "Course added successfully";
	}

	@Override
	public List<Course> viewallcourses() 
	{
		return courseRepository.findAll();
	}
	
	@Override
	public Student viewstudentbyid(int id) 
	{
		return studentRepository.findById(id).get();
	}

	

	@Override
	@Transactional
	public String deletestudent(int id) 
	{
		courseMappingRepository.deletecoursemapping(id);
		studentRepository.deleteById(id);
		return "Student deleted successfully";
	}

	@Override
	public Faculty viewfacultybyid(int id) 
	{
		return facultyRepository.findById(id).get();
	}

	@Override
	@Transactional
	public String deletefaculty(int id) 
	{
		courseMappingRepository.deletefcoursemapping(id);
		facultyRepository.deleteById(id);
		return "Faculty deleted successfully";
	}

	@Override
	public String coursemapping(CourseMapping cm) 
	{
		courseMappingRepository.save(cm);
		return null;
	}

	@Override
	public Course displayCourseById(int id) 
	{
		return courseRepository.findById(id).get();
	}

	@Override
	public List<Academics> viewallacyears() 
	{
		return (List<Academics>) academicsRepository.findAll();
	}
	
	@Override
	public Academics viewaybyid(int id) 
	{
		return academicsRepository.findById(id).get();
	}

	@Override
	public String assigncoursetofaculty(FacultyCourseMapping fcm) 
	{
		facultyCourseMappingRepository.save(fcm);
		return "Courses assigned to Faculty successfully";
	}

	@Override
	public List<FacultyCourseMapping> viewallfcmapping() 
	{
		return facultyCourseMappingRepository.findAll();
	}

}
