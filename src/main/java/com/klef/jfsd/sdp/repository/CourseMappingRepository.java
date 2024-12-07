package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface CourseMappingRepository extends JpaRepository<CourseMapping, Integer>
{
	@Modifying
	@Query("delete from CourseMapping cm where cm.student.id=?1")
	public void deletecoursemapping(int id);
	
	@Modifying
	@Query("delete from CourseMapping cm where cm.faculty.id=?1")
	public void deletefcoursemapping(int id);
	
	@Query("select cm from CourseMapping cm where cm.student.id=?1")
	public List<CourseMapping> viewstucourses(int id);
	
	@Query("select cm from CourseMapping cm where cm.faculty.id=?1 and cm.course.coursecode=?2")
	public List<CourseMapping> viewfaclist(int id,String code);
	
	@Query("select cm.student from CourseMapping cm where cm.faculty.id=?1")
	public List<Student> studentlist(int id);
	
	@Query("update CourseMapping cm set cm.attended=?2, cm.absent=?3, cm.totalclasses=?4, cm.percentage=?5 where cm.id=?1")
	@Modifying
	@Transactional
	public void updateattendance(int id,int at,int ab,int tc,double per);
}
