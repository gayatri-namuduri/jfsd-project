package com.klef.jfsd.sdp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "course_table")
public class Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false)
	private String coursecode;
	@Column(nullable = false)
	private String coursename;
	@Column(nullable = false)
	private int credits;
	@Column(nullable = false)
	private String offeredDept;
	@ManyToOne
	@JoinColumn(name = "academic_id")
	private Academics academics;
	@Column(nullable = false)
	private Blob handout;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoursecode() {
		return coursecode;
	}
	public void setCoursecode(String coursecode) {
		this.coursecode = coursecode;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getCredits() {
		return credits;
	}
	public void setCredits(int credits) {
		this.credits = credits;
	}
	public String getOfferedDept() {
		return offeredDept;
	}
	public void setOfferedDept(String offeredDept) {
		this.offeredDept = offeredDept;
	}
	public Academics getAcademics() {
		return academics;
	}
	public void setAcademics(Academics academics) {
		this.academics = academics;
	}
	public Blob getHandout() {
		return handout;
	}
	public void setHandout(Blob handout) {
		this.handout = handout;
	}
}
