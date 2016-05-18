package vo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "internship", catalog = "jobweb")
/**
 * @Info 实习信息表
 */
public class Internship {

	// Fields
	private Integer id;
	private String jobTitle; 				// 职称
	private String description; 			// 职责描述
	private Integer salary; 				// 薪水
	private Company company;				//公司id
	private InternshipType internshipType;  //实习类别id
	
	private Set<Internstu> internstus = new HashSet<Internstu>(0);

	/** default constructor */
	public Internship() {
	}

	/** full constructor */
	public Internship(Integer id, String jobTitle, String description,
			Integer salary, Company company , InternshipType internshipType,Set<Internstu> internstus ) {
		this.id = id;
		this.jobTitle = jobTitle;
		this.description = description;
		this.salary = salary;
		this.company = company;
		this.internshipType = internshipType;
		this.internstus = internstus;
	}

	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "jobTitle", nullable = false, length = 20)
	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	@Column(name = "description", nullable = false)
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "salary", length = 10)
	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "companyid")
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "internshipid")
	public InternshipType getInternshipType() {
		return internshipType;
	}

	public void setInternshipType(InternshipType internshipType) {
		this.internshipType = internshipType;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "internship")
	public Set<Internstu> getInternstus() {
		return this.internstus;
	}

	public void setInternstus(Set<Internstu> internstus) {
		this.internstus = internstus;
	}
}
