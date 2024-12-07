package com.klef.jfsd.sdp.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "student_table")
public class Student 
{
	@Id
	private int id;
	@Column(nullable = false,length = 75)
	private String name;
	@Column(nullable = false,length = 50,unique = true)
	private String email;
	@Column(nullable = false,length = 20)
	private String password;
	@Column(nullable = false,length = 30)
	private String dob;
	@Column(nullable = false,length = 15)
	private String gender;
	@Column(nullable = false,length = 15,unique = true)
	private String contact;
	@Column(nullable = false)
	private String location;
	@Column(nullable = false,length = 30)
	private String major;
	@Column(nullable = false)
	private Blob profile;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Blob getProfile() {
		return profile;
	}
	public void setProfile(Blob profile) {
		this.profile = profile;
	}
}
