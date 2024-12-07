package com.klef.jfsd.sdp.controller;


import java.sql.Blob;
import java.util.List;

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
import com.klef.jfsd.sdp.model.Admin;
import com.klef.jfsd.sdp.model.Course;
import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.model.FacultyCourseMapping;
import com.klef.jfsd.sdp.model.Student;
import com.klef.jfsd.sdp.service.AdminService;
import com.klef.jfsd.sdp.service.FacultyService;
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private FacultyService facultyService;
	
	
	@GetMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@PostMapping("checkadminlogin")
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		Admin admin = adminService.checkadminlogin(uname, pwd);
		if(admin!=null) {
		mv.setViewName("adminhome");
		HttpSession session = request.getSession();
  		 session.setAttribute("admin", admin);
		}
		else {
			String msg = "Login Failed";
			mv.addObject("message", msg);
			mv.setViewName("adminlogin");
		}
		return mv;
	}
	
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView("adminhome");
		return mv;
	}
	
	@GetMapping("addstudent")
	public ModelAndView addstudent()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addstudent");
		return mv;
	}
	
	@PostMapping("insertstudent")
	public ModelAndView insertstudent(HttpServletRequest request,@RequestParam("profile") MultipartFile file) throws Exception
	{	
		Student s = new Student();
		s.setId(Integer.parseInt(request.getParameter("id")));
		s.setName(request.getParameter("name"));
		s.setGender(request.getParameter("gender"));
		s.setEmail(request.getParameter("email"));
		s.setPassword("klef@123");
		s.setContact(request.getParameter("contact"));
		s.setDob(request.getParameter("dob"));
		s.setLocation(request.getParameter("location"));
		s.setMajor(request.getParameter("major"));
		byte[] bytes = file.getBytes();
		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		  s.setProfile(blob);
		
		String msg = adminService.addstudent(s);
		ModelAndView mv = new ModelAndView("addstudentsuccess");
		mv.addObject("message", msg);
		
		return mv;
	}
	
	@GetMapping("addfaculty")
	public ModelAndView addfaculty()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addfaculty");
		return mv;
	}
	
	@PostMapping("insertfaculty")
	public ModelAndView insertfaculty(HttpServletRequest request,@RequestParam("profile") MultipartFile file) throws Exception
	{
		Faculty f = new Faculty();
		f.setId(Integer.parseInt(request.getParameter("id")));
		f.setName(request.getParameter("name"));
		f.setGender(request.getParameter("gender"));
		f.setEmail(request.getParameter("email"));
		f.setPassword("klef@123");
		f.setContact(request.getParameter("contact"));
		f.setDob(request.getParameter("dob"));
		f.setLocation(request.getParameter("location"));
		f.setDepartment(request.getParameter("dept"));
		f.setDesignation(request.getParameter("desg"));
		byte[] bytes = file.getBytes();
		  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		  f.setProfile(blob);
		
		ModelAndView mv = new ModelAndView("addfacultysuccess");
		String msg = adminService.addfaculty(f);
		mv.addObject("message",msg);
		return mv;
	}
	
	@PostMapping("addcourse")
	public ModelAndView addcourse(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addcourse");
		int ayid=Integer.parseInt(request.getParameter("ay"));
		Academics ay=adminService.viewaybyid(ayid);
		HttpSession session = request.getSession();
 		session.setAttribute("ay", ay);
		return mv;
	}
	
	@PostMapping("insertcourse")
	public ModelAndView insertcourse(HttpServletRequest request,@RequestParam("handout") MultipartFile file) throws Exception
	{
		Course c = new Course();
		byte[] bytes = file.getBytes();
		Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		c.setCoursecode(request.getParameter("coursecode"));
		c.setCoursename(request.getParameter("coursename"));
		c.setCredits(Integer.parseInt(request.getParameter("credits")));
		c.setOfferedDept(request.getParameter("offereddept"));
		c.setAcademics(adminService.viewaybyid(Integer.parseInt(request.getParameter("ayid"))));
		c.setHandout(blob);
		
		ModelAndView mv = new ModelAndView("addcoursesuccess");
		String msg = adminService.addcourse(c);
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("displayhandout")
	public ResponseEntity<byte[]> displayhandout(@RequestParam int id) throws Exception
	{
	  Course course =  adminService.displayCourseById(id);
	  byte [] pdfBytes = null;
	  pdfBytes = course.getHandout().getBytes(1,(int) course.getHandout().length());

	  return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(pdfBytes);
	  
	}
	
	@PostMapping("coursetofaculty")
	public ModelAndView coursetofaculty(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		List<Course> clist = adminService.viewallcourses();
	    mv.addObject("clist",clist);
	    List<Faculty> faclist = adminService.viewallfaculty();
	    mv.addObject("faclist",faclist);
		mv.setViewName("assigncourses");
		int ayid=Integer.parseInt(request.getParameter("ay"));
		Academics ay=adminService.viewaybyid(ayid);
		HttpSession session = request.getSession();
 		session.setAttribute("ay", ay);
		return mv;
	}
	
	@PostMapping("assigncourses")
	public ModelAndView assigncourses(HttpServletRequest request)
	{
		FacultyCourseMapping fcm=new FacultyCourseMapping();
		fcm.setCourse(adminService.displayCourseById(Integer.parseInt(request.getParameter("course"))));
		fcm.setFaculty(adminService.viewfacultybyid(Integer.parseInt(request.getParameter("faculty"))));
		
		ModelAndView mv = new ModelAndView("assigncoursesuccess");
		String msg = adminService.assigncoursetofaculty(fcm);
		mv.addObject("message",msg);
		return mv;
	}
	
	@GetMapping("viewallstudents")
	public ModelAndView viewallstudents()
	{
		ModelAndView mv = new ModelAndView();
		List<Student> stdlist = adminService.viewallstudents();
		mv.setViewName("viewallstudents");
	    mv.addObject("stdlist",stdlist);
	    return mv; 
	}
	
	@GetMapping("displaystuprofile")
	public ResponseEntity<byte[]> displaystuprofile(@RequestParam("id") int id) throws Exception
	{
	  Student student =  studentService.ViewStudentByID(id);
	  byte [] imageBytes = null;
	  imageBytes = student.getProfile().getBytes(1,(int) student.getProfile().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	@GetMapping("viewallfaculty")
	public ModelAndView viewallfaculty()
	{
		ModelAndView mv = new ModelAndView();
		List<Faculty> faclist = adminService.viewallfaculty();
		mv.setViewName("viewallfaculty");
	    mv.addObject("faclist",faclist);
	    return mv; 
	}
	
	@PostMapping("viewallcourses")
	public ModelAndView viewallcourses(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		List<Course> courselist = adminService.viewallcourses();
		mv.setViewName("viewallcourses");
	    mv.addObject("courselist",courselist);
	    return mv; 
	}
	
	@PostMapping("viewfcmapping")
	public ModelAndView viewfcmapping(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		List<FacultyCourseMapping> fcmlist = adminService.viewallfcmapping();
		mv.setViewName("viewfcmapping");
	    mv.addObject("fcmlist",fcmlist);
	    return mv; 
	}
	
	@GetMapping("displaystudent")
	   public ModelAndView displaystudent(@RequestParam int id)
	   {
		   Student student=adminService.viewstudentbyid(id);
		   ModelAndView mv=new ModelAndView("viewstudentbyid");
		   mv.addObject("student",student);
		   return mv;
	   }
	
	@GetMapping("displayfaculty")
	   public ModelAndView displayfaculty(@RequestParam int id)
	   {
		   Faculty faculty=adminService.viewfacultybyid(id);
		   ModelAndView mv=new ModelAndView("viewfacultybyid");
		   mv.addObject("faculty",faculty);
		   return mv;
	   }
	
	@GetMapping("deletestudent")
    public String deleteoperation(@RequestParam int id)
    {
   	 adminService.deletestudent(id);
   	 return "redirect:/viewallstudents";
    }
	
	@GetMapping("deletefaculty")
    public String deletefaculty(@RequestParam int id)
    {
   	 adminService.deletefaculty(id);
   	 return "redirect:/viewallfaculty";
    }
	
	@GetMapping("displayfacprofile")
	public ResponseEntity<byte[]> displayfacprofile(@RequestParam int id) throws Exception
	{
	  Faculty faculty =  facultyService.ViewFacultyByID(id);
	  byte [] imageBytes = null;
	  imageBytes = faculty.getProfile().getBytes(1,(int) faculty.getProfile().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	@GetMapping("adminlogout")
	public ModelAndView adminlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin"); 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("adsessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpiry");
		return mv;
	}
	
	@GetMapping("courseay")
	public ModelAndView  courseay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("courseay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("viewcourseay")
	public ModelAndView viewcourseay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("viewcourseay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("fcmay")
	public ModelAndView fcmay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("fcmay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("viewfcmay")
	public ModelAndView viewfcmay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("viewfcmay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
}
