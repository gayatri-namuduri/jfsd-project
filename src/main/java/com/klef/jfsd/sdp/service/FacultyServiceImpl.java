package com.klef.jfsd.sdp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.repository.AssignmentRepository;
import com.klef.jfsd.sdp.repository.CourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.sdp.repository.FacultyRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;
	
	@Autowired
	private AssignmentRepository assignmentRepository;
	
	@Autowired
	private CourseMappingRepository courseMappingRepository;

	@Override
	public Faculty checkfacultylogin(int id, String pwd) 
	{
		return facultyRepository.checkfacultylogin(id, pwd);
	}

	@Override
	public Faculty ViewFacultyByID(int id) 
	{
		return facultyRepository.findById(id).get();
	}

	@Override
	public List<CourseMapping> viewmystudents(String code) 
	{
		return facultyRepository.viewmystudents(code);
	}

	@Override
	public List<FacultyCourseMapping> viewfaccourses(int id) 
	{
		return facultyCourseMappingRepository.viewfaccourses(id);
	}

	@Override
	public String addassignment(Assignment a) 
	{
		assignmentRepository.save(a);
		return "Assignment added successfully";
	}

	@Override
	public List<Assignment> showassignments(String code, int id) 
	{
		return assignmentRepository.showassignments(code,id);
	}

	@Override
	public String submitgrade(int id, double grade) 
	{
		assignmentRepository.submitgrade(id, grade);
		return "Assignment graded successfully";
	}

	@Override
	public String updateattendance(int id,int at, int ab, int tc, double per) 
	{
		courseMappingRepository.updateattendance(id, at, ab, tc, per);
		return "Attendance saved successfully";
	}

	
}
