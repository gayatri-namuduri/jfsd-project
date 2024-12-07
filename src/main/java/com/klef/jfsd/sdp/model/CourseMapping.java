package com.klef.jfsd.sdp.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "coursemapping_table")
public class CourseMapping 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "course_id")
	private Course course;
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	@ManyToOne
	@JoinColumn(name = "faculty_id")
	private Faculty faculty;
	@Column(nullable = false)
	private int totalclasses;
	@Column(nullable = false)
	private int attended;
	@Column(nullable = false)
	private int absent;
	@Column(nullable = false)
	private double percentage;
	
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
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	public int getTotalclasses() {
		return totalclasses;
	}
	public void setTotalclasses(int totalclasses) {
		this.totalclasses = totalclasses;
	}
	public int getAttended() {
		return attended;
	}
	public void setAttended(int attended) {
		this.attended = attended;
	}
	public int getAbsent() {
		return absent;
	}
	public void setAbsent(int absent) {
		this.absent = absent;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
}
