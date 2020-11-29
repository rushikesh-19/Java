package net.healthcare.model;

public class Doctor {
	int doctorId;
	String doctorName;
	String doctorUsername;
	String doctorPassword;
	String dateOfJoining;
	String doctorPost;
	String doctorExperience;
	String doctorDesignation;

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDoctorUsername() {
		return doctorUsername;
	}

	public void setDoctorUsername(String doctorUsername) {
		this.doctorUsername = doctorUsername;
	}

	public String getDoctorPassword() {
		return doctorPassword;
	}

	public void setDoctorPassword(String doctorPassword) {
		this.doctorPassword = doctorPassword;
	}

	public String getDateOfJoining() {
		return dateOfJoining;
	}

	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}

	public String getDoctorPost() {
		return doctorPost;
	}

	public void setDoctorPost(String doctorPost) {
		this.doctorPost = doctorPost;
	}

	public String getDoctorExperience() {
		return doctorExperience;
	}

	public void setDoctorExperience(String doctorExperience) {
		this.doctorExperience = doctorExperience;
	}

	public String getDoctorDesignation() {
		return doctorDesignation;
	}

	public void setDoctorDesignation(String doctorDesignation) {
		this.doctorDesignation = doctorDesignation;
	}

	@Override
	public String toString() {
		return "Doctor [doctorId=" + doctorId + ", doctorName=" + doctorName + ", doctorUsername=" + doctorUsername
				+ ", doctorPassword=" + doctorPassword + ", dateOfJoining=" + dateOfJoining + ", doctorPost="
				+ doctorPost + ", doctorExperience=" + doctorExperience + ", doctorDesignation=" + doctorDesignation
				+ "]";
	}

}
