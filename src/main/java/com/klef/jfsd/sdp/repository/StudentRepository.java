package com.klef.jfsd.sdp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdp.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("select s from Student s where s.id=?1 and s.password=?2")
	public Student checkstudentlogin(int id, String password);
	
	@Query("select s from Student s where s.id=?1")
	public Student checkstudentid(int id);
	
	@Query("update Student s set s.password=?2 where s.id=?1")
	@Modifying
	@Transactional
	public void resetpwd(int id,String pwd);
}
