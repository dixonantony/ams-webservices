package com.ams.webservices.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="occupants")
public class Occupant {
	
	@Id
	@Column(name="occupant_id")
	private long occupantId;
	
	@Column(name="occupantcy_type")
	private String occupantcyType;		
	
	@Column(name="from_dt")
	private Date fromDate;
	
	@Column(name="to_dt")
	private Date toDate;
	
	@Column(name="full_name")
	private String fullName;
	
	@Column(name="landline_no")
	private String landlineNo;
	
	@Column(name="mobile_no")
	private String mobileNo;
	
	@Column(name="email")
	private String email;
	
	@Column(name="alter_email")
	private String alterEmail;
	
	@Column(name="whatsapp_enabled")
	private char whatsappEnabled;
	
	@Column(name="identity_no")
	private String identityNo;
	
	@Column(name="identity_type")
	private String identityType;

	@OneToMany
    @JoinTable(
        name="occupant_appartments",
        joinColumns = @JoinColumn( name="occupant_id"),
        inverseJoinColumns = @JoinColumn( name="appartment_cd")
    )
	private List<Appartment> appartments = new ArrayList<>();
	
	@OneToMany
    @JoinColumn( name="occupant_id")
	private List<OccupantDetails> occupantDetails = new ArrayList<>();
	
	public Occupant() {
		super();
	}		
	
	public Occupant(long occupantId, String occupantcyType, Date fromDate, Date toDate, String fullName,
			String landlineNo, String mobileNo, String email, String alterEmail, char whatsappEnabled,
			String identityNo, String identityType, List<Appartment> appartments,
			List<OccupantDetails> occupantDetails) {
		super();
		this.occupantId = occupantId;
		this.occupantcyType = occupantcyType;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.fullName = fullName;
		this.landlineNo = landlineNo;
		this.mobileNo = mobileNo;
		this.email = email;
		this.alterEmail = alterEmail;
		this.whatsappEnabled = whatsappEnabled;
		this.identityNo = identityNo;
		this.identityType = identityType;
		this.appartments = appartments;
		this.occupantDetails = occupantDetails;
	}

	public long getOccupantId() {
		return occupantId;
	}

	public void setOccupantId(long occupantId) {
		this.occupantId = occupantId;
	}

	public String getOccupantcyType() {
		return occupantcyType;
	}

	public void setOccupantcyType(String occupantcyType) {
		this.occupantcyType = occupantcyType;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getLandlineNo() {
		return landlineNo;
	}

	public void setLandlineNo(String landlineNo) {
		this.landlineNo = landlineNo;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAlterEmail() {
		return alterEmail;
	}

	public void setAlterEmail(String alterEmail) {
		this.alterEmail = alterEmail;
	}

	public char getWhatsappEnabled() {
		return whatsappEnabled;
	}

	public void setWhatsappEnabled(char whatsappEnabled) {
		this.whatsappEnabled = whatsappEnabled;
	}

	public List<Appartment> getAppartments() {
		return appartments;
	}

	public void setAppartments(List<Appartment> appartments) {
		this.appartments = appartments;
	}


	public String getIdentityNo() {
		return identityNo;
	}


	public void setIdentityNo(String identityNo) {
		this.identityNo = identityNo;
	}


	public String getIdentityType() {
		return identityType;
	}


	public void setIdentityType(String identityType) {
		this.identityType = identityType;
	}

	public List<OccupantDetails> getOccupantDetails() {
		return occupantDetails;
	}

	public void setOccupantDetails(List<OccupantDetails> occupantDetails) {
		this.occupantDetails = occupantDetails;
	}
	
	

}
