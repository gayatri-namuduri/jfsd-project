package com.klef.jfsd.sdp.service;

import java.sql.Blob;
import java.util.List;

import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;

public interface FacultyService 
{
	public Faculty checkfacultylogin(int id,String pwd);
	public Faculty ViewFacultyByID(int id);
	public List<CourseMapping> viewmystudents(String code);
	public List<FacultyCourseMapping> viewfaccourses(int id);
	public String addassignment(Assignment a);
	public List<Assignment> showassignments(String code,int id);
	public String submitgrade(int id, double grade);
	public String updateattendance(int id,int at,int ab,int tc,double per);
}
