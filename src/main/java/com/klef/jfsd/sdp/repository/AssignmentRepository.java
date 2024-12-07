package com.klef.jfsd.sdp.repository;

import java.sql.Blob;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Assignment;

import jakarta.transaction.Transactional;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment, Integer>
{
	@Query("select a from Assignment a where a.faculty.id=?1 and a.student.id=?2")
	public List<Assignment> viewassignments(int fid,int sid);
	
	@Query("update Assignment a set a.answers=?1 where a.id=?2")
	@Modifying
	@Transactional
	public void uploadassignment(Blob blob,int id);
	
	@Query("update Assignment a set a.grade=?2 where a.id=?1")
	@Modifying
	@Transactional
	public void submitgrade(int id,double grade);
	
	@Query("select a from Assignment a where a.faculty.id=?1 and a.student.id=?2")
	public Assignment viewassignment(int fid,int sid);
	
	@Query("select a from Assignment a where a.course.coursecode=?1 and a.faculty.id=?2")
	public List<Assignment> showassignments(String code,int id);
}
