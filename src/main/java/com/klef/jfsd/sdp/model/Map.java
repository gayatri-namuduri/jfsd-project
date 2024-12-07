package com.klef.jfsd.sdp.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public class Map 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	 @ManyToOne
	@JoinColumn(name = "course_code")
	private Course course;
	 @ManyToOne
	@JoinColumn(name = "sid")
	private Student student;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
