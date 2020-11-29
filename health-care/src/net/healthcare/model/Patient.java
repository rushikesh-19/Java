package net.healthcare.model;

import java.util.List;

public class Patient {
	int patientId;
	String patientGender;
	String patientName;
	String patientBirthdate;
	int patientHeight;
	int patientWeight;
	String patientUsername;
	String patientPassword;
	String patientAllergy;
	List<String> patientSymptoms;
	String patientIllness;
	String patientOperations;
	String patientMedictions;
	String patientExercise;
	String patientDiet;
	String patientDrink;
	String patientCaffeine;
	String patientSmoke;
	String patientComments;

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getPatientGender() {
		return patientGender;
	}

	public void setPatientGender(String patientGender) {
		this.patientGender = patientGender;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getPatientBirthdate() {
		return patientBirthdate;
	}

	public void setPatientBirthdate(String patientBirthdate) {
		this.patientBirthdate = patientBirthdate;
	}

	public int getPatientHeight() {
		return patientHeight;
	}

	public void setPatientHeight(int patientHeight) {
		this.patientHeight = patientHeight;
	}

	public int getPatientWeight() {
		return patientWeight;
	}

	public void setPatientWeight(int patientWeight) {
		this.patientWeight = patientWeight;
	}

	public String getPatientUsername() {
		return patientUsername;
	}

	public void setPatientUsername(String patientUsername) {
		this.patientUsername = patientUsername;
	}

	public String getPatientPassword() {
		return patientPassword;
	}

	public void setPatientPassword(String patientPassword) {
		this.patientPassword = patientPassword;
	}

	public String getPatientAllergy() {
		return patientAllergy;
	}

	public void setPatientAllergy(String patientAllergy) {
		this.patientAllergy = patientAllergy;
	}

	public List<String> getPatientSymptoms() {
		return patientSymptoms;
	}

	public void setPatientSymptoms(List<String> patientSymptoms) {
		this.patientSymptoms = patientSymptoms;
	}

	public String getPatientIllness() {
		return patientIllness;
	}

	public void setPatientIllness(String patientIllness) {
		this.patientIllness = patientIllness;
	}

	public String getPatientOperations() {
		return patientOperations;
	}

	public void setPatientOperations(String patientOperations) {
		this.patientOperations = patientOperations;
	}

	public String getPatientMedictions() {
		return patientMedictions;
	}

	public void setPatientMedictions(String patientMedictions) {
		this.patientMedictions = patientMedictions;
	}

	public String getPatientExercise() {
		return patientExercise;
	}

	public void setPatientExercise(String patientExercise) {
		this.patientExercise = patientExercise;
	}

	public String getPatientDiet() {
		return patientDiet;
	}

	public void setPatientDiet(String patientDiet) {
		this.patientDiet = patientDiet;
	}

	public String getPatientDrink() {
		return patientDrink;
	}

	public void setPatientDrink(String patientDrink) {
		this.patientDrink = patientDrink;
	}

	public String getPatientCaffeine() {
		return patientCaffeine;
	}

	public void setPatientCaffeine(String patientCaffeine) {
		this.patientCaffeine = patientCaffeine;
	}

	public String getPatientSmoke() {
		return patientSmoke;
	}

	public void setPatientSmoke(String patientSmoke) {
		this.patientSmoke = patientSmoke;
	}

	public String getPatientComments() {
		return patientComments;
	}

	public void setPatientComments(String patientComments) {
		this.patientComments = patientComments;
	}

	@Override
	public String toString() {
		return "Patient [patientId=" + patientId + ", patientGender=" + patientGender + ", patientName=" + patientName
				+ ", patientBirthdate=" + patientBirthdate + ", patientHeight=" + patientHeight + ", patientWeight="
				+ patientWeight + ", patientUsername=" + patientUsername + ", patientPassword=" + patientPassword
				+ ", patientAllergy=" + patientAllergy + ", patientSymptoms=" + patientSymptoms + ", patientIllness="
				+ patientIllness + ", patientOperations=" + patientOperations + ", patientMedictions="
				+ patientMedictions + ", patientExercise=" + patientExercise + ", patientDiet=" + patientDiet
				+ ", patientDrink=" + patientDrink + ", patientCaffeine=" + patientCaffeine + ", patientSmoke="
				+ patientSmoke + ", patientComments=" + patientComments + "]";
	}

}
