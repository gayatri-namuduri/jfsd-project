package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.CourseMapping;
import com.klef.jfsd.sdp.model.Faculty;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, Integer>
{
	@Query("select f from Faculty f where f.id=?1 and f.password=?2")
	public Faculty checkfacultylogin(int id, String password);
	
	@Query("select cm from CourseMapping cm where cm.course.coursecode=?1")
	public List<CourseMapping> viewmystudents(String code);
}
