package vo;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "resume",catalog = "jobweb")
public class Resume {

	//Fields
	private Integer id;
	private String  personalInfo;	//个人信息(可从User中导入)
	private String  picture;		//相片
	private String  description;	//描述
//	private String  experience;		//经历
	private String  specialty;		//特长
	private Student student;

	/** default constructor */
	public Resume() {
	}

	/** Full constructor */
	public Resume(Integer id, String personalInfo, String picture,
			String description, String specialty,Student student) {
		this.id = id;
		this.personalInfo = personalInfo;
		this.picture = picture;
		this.description = description;
		this.specialty = specialty;
		this.student = student;
	}

	@Id
	@GeneratedValue
	@Column(name = "id" , unique = true , nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column( name = "personalInfo" , nullable = false)
	public String getPersonalInfo() {
		return personalInfo;
	}

	public void setPersonalInfo(String personalInfo) {
		this.personalInfo = personalInfo;
	}
	
	@Column(name = "picture" , length = 50)
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Column(name = "description")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "specialty" , nullable = false)
	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	@ManyToOne(cascade = (CascadeType.MERGE ),fetch = FetchType.LAZY)
	@JoinColumn(name="studentid")
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
}
