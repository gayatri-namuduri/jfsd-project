package com.klef.jfsd.sdp.controller;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Academics;
import com.klef.jfsd.sdp.model.Assignment;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.FacultyService;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController 
{
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("facultylogin")
	public ModelAndView facultylogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultylogin");
		return mv;
	}
	
	@PostMapping("checkfacultylogin")
	public ModelAndView checkfacultylogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt( request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		Faculty f = facultyService.checkfacultylogin(id, pwd);
		if(f!=null) {
		mv.setViewName("facultyhome");
		HttpSession session = request.getSession();
  		 session.setAttribute("faculty", f);
		}
		else {
			String msg = "Login Failed";
			mv.addObject("message", msg);
			mv.setViewName("facultylogin");
		}
		return mv;
	}
	
	@GetMapping("facultyhome")
	public ModelAndView facultyhome()
	{
		ModelAndView mv = new ModelAndView("facultyhome");
		return mv;
	}
	
	@GetMapping("facultyprofile")
	public ModelAndView facultyprofile()
	{
		ModelAndView mv = new ModelAndView("facultyprofile");
		return mv;
	}
	
	@GetMapping("facultylogout")
	public ModelAndView facultylogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("faculty"); 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultylogin");
		return mv;
	}
	
	@GetMapping("facsessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpiry");
		return mv;
	}
	
	@PostMapping("viewfaccourses")
	public ModelAndView viewfaccourses(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		List<FacultyCourseMapping> fcmlist = facultyService.viewfaccourses(id);
		if(fcmlist==null) {
			mv.setViewName("facnoresults");
		}else {
		mv.setViewName("viewfaccourses");
	    mv.addObject("fcmlist",fcmlist);
		}
	    return mv; 
	}
	
	@GetMapping("viewmystudents")
	public ModelAndView viewmystudents(@RequestParam String code)
	{
		ModelAndView mv = new ModelAndView();
		List<CourseMapping> cmlist = facultyService.viewmystudents(code);
		if(cmlist==null) {
			mv.setViewName("facnoresults");
		}else {
		mv.setViewName("viewmystudents");
	    mv.addObject("cmlist",cmlist);
		}
	    return mv; 
	}
	
	@GetMapping("postattendance")
	public ModelAndView postattendance(@RequestParam String code)
	{
		ModelAndView mv = new ModelAndView();
		List<CourseMapping> cmlist = facultyService.viewmystudents(code);
		if(cmlist==null) {
			mv.setViewName("facnoresults");
		}else {
		mv.setViewName("postattendance");
	    mv.addObject("cmlist",cmlist);
		}
	    return mv; 
	}
	
	@GetMapping("faccourseay")
	public ModelAndView faccourseay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("faccourseay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("addassignment")
	public ModelAndView addassignment(HttpServletRequest request,@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addassignment");
 		Course c=adminService.displayCourseById(id);
 		HttpSession session1 = request.getSession();
 		session1.setAttribute("course", c);
		return mv;
	}
	
	@PostMapping("insertassignment")
	public ModelAndView insertassignment(HttpServletRequest request,@RequestParam("questions") MultipartFile file) throws Exception
	{
		
		List<Student> students=studentService.viewstudentsbyfaculty(Integer.parseInt(request.getParameter("fid")));
		
		for (Student student : students) {
			Assignment a = new Assignment();
			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			a.setCourse(adminService.displayCourseById(Integer.parseInt(request.getParameter("cid"))));
			a.setDeadline(LocalDateTime.parse(request.getParameter("deadline")));
			a.setTitle(request.getParameter("title"));
			a.setQuestions(blob);
			a.setFaculty(adminService.viewfacultybyid(Integer.parseInt(request.getParameter("fid"))));
			a.setStudent(student);
	        
	        // Save the assignment
			facultyService.addassignment(a); 
	    }
		
		ModelAndView mv = new ModelAndView("addcassignmentsuccess");
		String msg = "Assignments uploaded successfully";
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("viewsubmissions")
	public ModelAndView viewsubmissions(@RequestParam String code,@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		List<Assignment> aslist = facultyService.showassignments(code,id);
		if(aslist==null) {
			mv.setViewName("facnoresults");
		}else {
		mv.setViewName("viewsubmissions");
	    mv.addObject("aslist",aslist);
		}
	    return mv; 
	}
	
	@GetMapping("displayanswers")
	public ResponseEntity<byte[]> displayquestions(@RequestParam int fid,@RequestParam int sid) throws Exception
	{
	  Assignment as =  studentService.displayassignmentbyid(fid,sid);
	  byte [] pdfBytes = null;
	  pdfBytes = as.getAnswers().getBytes(1,(int) as.getAnswers().length());

	  return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(pdfBytes);
	  
	}
	
	@PostMapping("submitgrade")
	public ModelAndView submitgrade(@RequestParam double grade,@RequestParam("assignmentId") int id)
	{
		ModelAndView mv = new ModelAndView("submitgradesuccess");
		String msg=null;
		try {
			
	        msg = facultyService.submitgrade(id, grade); // You need to implement this service method
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        mv.addObject("message",msg);
	    }
	    return mv;
	}
	
	@PostMapping("submitattendance")
	public ModelAndView submitAttendance(HttpServletRequest request) {
	    String msg = null;
	    ModelAndView mv = new ModelAndView("postattendancesuccess");
	    List<CourseMapping> courseMappings = facultyService.viewmystudents(request.getParameter("code"));
	    
	    for (CourseMapping cm : courseMappings) {
	        int studentId = cm.getStudent().getId();
	        int courseId = cm.getCourse().getId();
	        String attendanceParam = request.getParameter("attendance_" + studentId + "_" + courseId);
	        int attended = cm.getAttended();
	        int absent = cm.getAbsent();
	        int totalClasses = cm.getTotalclasses();
	        int cid = cm.getId();
	        
	        if (attendanceParam != null) {
	            int attendance = Integer.parseInt(attendanceParam);
	            totalClasses++;
	            if (attendance == 1) {
	                attended++;
	            } else {
	                absent++;
	            }
	            
	            // Safely calculate the percentage to avoid division by zero
	            double percentage = 0;
	            if (totalClasses > 0) {
	                percentage = (double) (attended * 100.0) / totalClasses;
	                percentage = Math.round(percentage * 100.0) / 100.0;
	            }

	            msg = facultyService.updateattendance(cid, attended, absent, totalClasses, percentage);
	        }
	    }

	    // Add the result message to the model
	    mv.addObject("message", msg);

	    return mv;
	}


	
}
