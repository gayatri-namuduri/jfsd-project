package com.klef.jfsd.sdp.model;

import java.sql.Blob;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "assignment_table")
public class Assignment 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "course_id")
	private Course course;
	@ManyToOne
	@JoinColumn(name = "faculty_id")
	private Faculty faculty;
	@ManyToOne
	@JoinColumn(name = "student_id")
	private Student student;
	@Column(nullable = false)
	private LocalDateTime deadline;
	@Column(nullable = false)
	private String title;
	@Column(nullable = false)
	private Blob questions;
	private Blob answers;
	private double grade;
	
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
	public LocalDateTime getDeadline() {
		return deadline;
	}
	public void setDeadline(LocalDateTime deadline) {
		this.deadline = deadline;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Blob getQuestions() {
		return questions;
	}
	public void setQuestions(Blob questions) {
		this.questions = questions;
	}
	public Blob getAnswers() {
		return answers;
	}
	public void setAnswers(Blob answers) {
		this.answers = answers;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public Faculty getFaculty() {
		return faculty;
	}
	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
}
