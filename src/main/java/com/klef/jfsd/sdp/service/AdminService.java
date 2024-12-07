package com.klef.jfsd.sdp.service;

import java.util.List;

import com.klef.jfsd.sdp.model.Academics;
import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;

public interface AdminService 
{
	public Admin checkadminlogin(String uname,String pwd);
	public String addstudent(Student s);
	public String addfaculty(Faculty f);
	public String addcourse(Course c);
	public List<Student> viewallstudents();
	public List<Faculty> viewallfaculty();
	public List<Course> viewallcourses();
	public Student viewstudentbyid(int id);
	public String deletestudent(int id);
	public Faculty viewfacultybyid(int id);
	public String deletefaculty(int id);
	public String coursemapping(CourseMapping cm);
	public Course displayCourseById(int id);
	public List<Academics> viewallacyears();
	public Academics viewaybyid(int id);
	public String assigncoursetofaculty(FacultyCourseMapping fcm);
	public List<FacultyCourseMapping> viewallfcmapping();
}
