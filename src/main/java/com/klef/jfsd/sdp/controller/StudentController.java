package com.klef.jfsd.sdp.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.klef.jfsd.sdp.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired 
	private JavaMailSender mailSender; 

	@PostMapping("sendemail") 
	public ModelAndView sendEmail(HttpServletRequest request) throws Exception { 
	    ModelAndView mv = new ModelAndView();
	    
	    try {
	        String name = request.getParameter("name"); 
	        String toemail = request.getParameter("email"); 
	        String subject = request.getParameter("subject"); 
	        String msg = request.getParameter("message"); 

	        MimeMessage mimeMessage = mailSender.createMimeMessage(); 
	        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true); 

	        int otp = (int)(Math.random() * 99999); // random number generation 

	        helper.setTo(toemail); 
	        helper.setSubject(subject); 
	        helper.setFrom("student@gmail.com"); 

	        String htmlContent =  
	            "<h3>Contact Form Details</h3>" + 
	            "<p><strong>Name:</strong> " + name + "</p>" + 
	            "<p><strong>Email:</strong> " + toemail + "</p>" + 
	            "<p><strong>Subject:</strong> " + subject + "</p>" + 
	            "<p><strong>Message:</strong> " + msg + "</p>" + 
	            "<p><strong>OTP:</strong> " + otp + "</p>"; 

	        helper.setText(htmlContent, true); 
	        mailSender.send(mimeMessage); 

	        mv.setViewName("mailsuccess"); // Success view
	        mv.addObject("message", "Email Sent Successfully");

	    } catch (Exception e) {
	        mv.setViewName("grievance"); // Redirect to grievance.jsp on error
	        mv.addObject("message", "Network Error "); // Error message
	    }

	    return mv; 
	}

	
	@GetMapping("studentlogin")
	public ModelAndView studentlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentlogin");
		return mv;
	}
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt( request.getParameter("id"));
		String pwd = request.getParameter("pwd");
		Student s = studentService.checkstudentlogin(id, pwd);
		if(s!=null) {
		mv.setViewName("studenthome");
		HttpSession session = request.getSession();
  		 session.setAttribute("student", s);
		}
		else {
			String msg = "Login Failed";
			mv.addObject("message", msg);
			mv.setViewName("studentlogin");
		}
		return mv;
	}
	
	@GetMapping("forgotstupwd")
	public ModelAndView forgotstupwd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("forgotstupwd");
		return mv;
	}
	
	@PostMapping("checkstuid")
	public ModelAndView checkstuid(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int id = Integer.parseInt( request.getParameter("id"));
		Student s = studentService.checkstuid(id);
		if(s!=null) {
		mv.setViewName("changestupwd");
		}
		else {
			String msg="No student found with this id";
			mv.addObject("message",msg);
		mv.setViewName("forgotstupwd");
		}
		return mv;
	}
	
	@PostMapping("resetpwd")
	public ModelAndView resetpwd(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("studentlogin");
		int id=Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		String msg = studentService.resetpwd(id,pwd);
		mv.addObject("message", msg);
		return mv;
	}
	
	@GetMapping("updatestupwd")
	public ModelAndView updatestupwd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatestupwd");
		return mv;
	}
	
	@PostMapping("updatepwd")
	public ModelAndView updatepwd(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		int id=Integer.parseInt(request.getParameter("id"));
		String pwd=request.getParameter("pwd");
		String msg = studentService.resetpwd(id,pwd);
		mv.setViewName("studentprofile");
		mv.addObject("message", msg);
		return mv;
	}
	
	@GetMapping("studenthome")
	public ModelAndView studenthome()
	{
		ModelAndView mv = new ModelAndView("studenthome");
		return mv;
	}
	
	@GetMapping("studentprofile")
	public ModelAndView studentprofile()
	{
		ModelAndView mv = new ModelAndView("studentprofile");
		return mv;
	}
	
	@GetMapping("studentlogout")
	public ModelAndView studentlogout(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("student"); 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studentlogin");
		return mv;
	}
	
	@GetMapping("grievance")
	public ModelAndView grievance()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("grievance");
		return mv;
	}
	
	@GetMapping("stusessionexpiry")
	public ModelAndView sessionexpiry()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sessionexpiry");
		return mv;
	}
	
	@PostMapping("coursereg")
	  public ModelAndView coursemapping(HttpServletRequest request)
	  {
		  ModelAndView mv = new ModelAndView("coursereg");
	  	  
	      List<Course> courselist = adminService.viewallcourses();
	      mv.addObject("courselist", courselist);
		  
		  List<Faculty> facultylist = adminService.viewallfaculty();
		  mv.addObject("facultylist", facultylist);
		  List<FacultyCourseMapping> fcmlist=adminService.viewallfcmapping();
		  mv.addObject("fcmlist", fcmlist);
		  int ayid=Integer.parseInt(request.getParameter("ay"));
			Academics ay=adminService.viewaybyid(ayid);
			HttpSession session = request.getSession();
	 		session.setAttribute("ay", ay);
		  return mv;
	  }
	
	@PostMapping("coursemappinginsert")
	public ModelAndView coursemappinginsert(HttpServletRequest request) {
	    String msg = null;
	    ModelAndView mv = new ModelAndView("courseregsuccess");
	    List<Course> courselist = adminService.viewallcourses();
	    for (int i = 0; i < courselist.size(); i++) {
	        int sid = Integer.parseInt(request.getParameter("sid"));
	        String id = request.getParameter("fid[" + i + "]");
	        System.out.println(id);
	        if(!id.isEmpty()) {
	        CourseMapping cm = new CourseMapping();
	        int fid = Integer.parseInt(request.getParameter("fid[" + i + "]"));
	        cm.setCourse(adminService.displayCourseById(courselist.get(i).getId()));  
	        cm.setFaculty(adminService.viewfacultybyid(fid));  
	        cm.setStudent(adminService.viewstudentbyid(sid));  
	        cm.setAbsent(0);
	        cm.setAttended(0);
	        cm.setTotalclasses(0);
	        cm.setPercentage(0);
	        msg = adminService.coursemapping(cm);
	        }
	    }

	    mv.addObject("message", msg);

	    return mv;
	}
	
	@PostMapping("viewstucourses")
	public ModelAndView viewstucourses(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		List<CourseMapping> cmlist = studentService.viewstucourses(id);
		if(cmlist==null) {
			mv.setViewName("stnoresults");
		}else {
		mv.setViewName("viewstucourses");
	    mv.addObject("cmlist",cmlist);
		}
	    return mv; 
	}
	
	@PostMapping("myattendance")
	public ModelAndView myattendance(@RequestParam int id)
	{
		ModelAndView mv = new ModelAndView();
		List<CourseMapping> cmlist = studentService.viewstucourses(id);
		if(cmlist.size()==0) {
			mv.setViewName("stnoresults");
		}else {
		mv.setViewName("myattendance");
	    mv.addObject("cmlist",cmlist);
		}
	    return mv; 
	}
	
	@GetMapping("regcourseay")
	public ModelAndView regcourseay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("courseregay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("stucourseay")
	public ModelAndView stucourseay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("stucourseay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("myatay")
	public ModelAndView myatay()
	{
		   List<Academics> aylist= adminService.viewallacyears();
		   ModelAndView mv=new ModelAndView("myatay");
		   mv.addObject("aylist",aylist);
		   return mv;
	}
	
	@GetMapping("viewassignments")
	public ModelAndView viewassignments(@RequestParam int fid,@RequestParam int sid)
	{
		ModelAndView mv = new ModelAndView();
		List<Assignment> aslist = studentService.viewassignments(fid,sid);
		if(aslist==null) {
			mv.setViewName("stnoresults");
		}else {
		mv.setViewName("viewassignments");
	    mv.addObject("aslist",aslist);
		}
	    return mv; 
	}
	
	@GetMapping("displayquestions")
	public ResponseEntity<byte[]> displayquestions(@RequestParam int id) throws Exception
	{
	  Assignment as =  studentService.viewassignmentbyid(id);
	  byte [] pdfBytes = null;
	  pdfBytes = as.getQuestions().getBytes(1,(int) as.getQuestions().length());

	  return ResponseEntity.ok().contentType(MediaType.APPLICATION_PDF).body(pdfBytes);
	  
	}
	
	@PostMapping("uploadassignment")
	public ModelAndView uploadassignment(@RequestParam("assignmentFile") MultipartFile file,@RequestParam("assignmentId") int id) throws Exception
	{
		ModelAndView mv = new ModelAndView("viewassignments");
		String msg=null;
		try {
			byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	        msg = studentService.saveAssignmentFile(id, blob); // You need to implement this service method
	        mv.addObject("message", msg);
	    } catch (Exception e) {
	        mv.addObject("message",msg);
	    }
	    return mv;
	}
	
	
}
