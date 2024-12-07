package com.klef.jfsd.sdp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.FacultyCourseMapping;

@Repository
public interface FacultyCourseMappingRepository extends JpaRepository<FacultyCourseMapping, Integer>
{
	@Query("select fcm from FacultyCourseMapping fcm where fcm.faculty.id=?1")
	public List<FacultyCourseMapping> viewfaccourses(int id);
}
