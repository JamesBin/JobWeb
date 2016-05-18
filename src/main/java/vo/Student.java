package vo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "student", catalog = "jobweb")
public class Student {

	// Fields
	private Integer id;
	private String username;
	private String realName;
	private Integer sex;
	private String email;
	private String phone;
	private String school;

	private Set<Resume> resume = new HashSet<Resume>();
	private Set<Interns> internses = new HashSet<Interns>(0);
	
	private Set<Internstu> internstus = new HashSet<Internstu>(0);

	/** default constructor */
	public Student() {
	}
	
	/** least constructor */
	public Student(String username) {
		this.username = username;
	}
	
	public Student(Integer id, String username) {
		super();
		this.id = id;
		this.username = username;
	}
	
	/** full constructor */
	public Student(Integer id, String username, String realName, Integer sex, String email, String phone, String school,
			Set<Resume> resume,Set<Interns> internses,Set<Internstu> internstus) {
		super();
		this.id = id;
		this.username = username;
		this.realName = realName;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.school = school;
		this.resume = resume;
		this.internses = internses;
		this.internstus = internstus;
	}

	@Id
	@GeneratedValue
	@Column(name = "id",unique = true, nullable = false)
	public Integer getId(){
		return id;
	}

	public void setId(Integer id){
		this.id = id;
	}

	@Column(name = "username", length = 30)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "realName", length = 30)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	@Column(name = "sex", length = 30)
	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name = "phone", length = 30)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Column(name = "school", length = 50)
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, mappedBy = "student")
	public Set<Resume> getResume() {
		return resume;
	}

	public void setResume(Set<Resume> resume) {
		this.resume = resume;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "student")
	public Set<Interns> getInternses() {
		return this.internses;
	}

	public void setInternses(Set<Interns> internses) {
		this.internses = internses;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "student")
	public Set<Internstu> getInternstus() {
		return this.internstus;
	}

	public void setInternstus(Set<Internstu> internstus) {
		this.internstus = internstus;
	}
}
