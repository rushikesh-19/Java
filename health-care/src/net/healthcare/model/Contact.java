package net.healthcare.model;

public class Contact {

	int contactId;
	String name;
	String email;
	int phone;
	String query;
	
	public int getContactId() {
		return contactId;
	}
	public void setContactId(int contactId) {
		this.contactId = contactId;
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
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
	@Override
	public String toString() {
		return "Contact [contactId=" + contactId + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", query=" + query + "]";
	}
	
}
