package vo;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Interns entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "interns", catalog = "jobweb")
public class Interns implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student student;
	private Date start;
	private Date end;
	private String comname;
	private String department;
	private String position;
	private String details;

	// Constructors

	/** default constructor */
	public Interns() {
	}

	/** minimal constructor */
	public Interns(Student student, Date start, Date end, String comname,
			String department, String position) {
		this.student = student;
		this.start = start;
		this.end = end;
		this.comname = comname;
		this.department = department;
		this.position = position;
	}

	/** full constructor */
	public Interns(Student student, Date start, Date end, String comname,
			String department, String position, String details) {
		this.student = student;
		this.start = start;
		this.end = end;
		this.comname = comname;
		this.department = department;
		this.position = position;
		this.details = details;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stuid", nullable = false)
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "start", nullable = false, length = 10)
	public Date getStart() {
		return this.start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "end", nullable = false, length = 10)
	public Date getEnd() {
		return this.end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Column(name = "comname", nullable = false, length = 50)
	public String getComname() {
		return this.comname;
	}

	public void setComname(String comname) {
		this.comname = comname;
	}

	@Column(name = "department", nullable = false, length = 50)
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Column(name = "position", nullable = false, length = 50)
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "details")
	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

}