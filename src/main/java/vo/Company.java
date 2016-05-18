package vo;

import java.beans.Transient;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.opensymphony.xwork2.conversion.annotations.Conversion;
import com.opensymphony.xwork2.conversion.annotations.TypeConversion;

@Entity
@Table(name = "company", catalog = "jobweb")
public class Company {

	// Fields
	private Integer id;
	private String username;
	private String companyName;


	private String phone;
	private String address;
	private String description;
	private Integer status;
	
	private Set<Internship> internship = new HashSet<Internship>();

	/** default constructor */
	public Company() {
	}

	/** least constructor */
	public Company(String username) {
		super();
		this.username = username;
	}
	
	/** full constructor */
	public Company(Integer id, String username, String companyName, String phone, String address, String description,
			Integer status, Set<Internship> internship) {
		super();
		this.id = id;
		this.username = username;
		this.companyName = companyName;
		this.phone = phone;
		this.address = address;
		this.description = description;
		this.status = status;
		this.internship = internship;
	}

	// Property accessors

	
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "username", length = 20)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "companyName", length = 20)
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	@Column(name = "phone", length = 30)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "address", length = 100)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "description", length = 255)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name = "status", length = 10)
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, mappedBy = "company")
	public Set<Internship> getInternship() {
		return internship;
	}

	public void setInternship(Set<Internship> internship) {
		this.internship = internship;
	}
	
}
