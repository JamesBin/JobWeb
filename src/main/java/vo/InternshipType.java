package vo;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 实习类别 实体表
 * 
 * @author zwb
 * 
 */
@Entity
@Table(name = "internshipType", catalog = "jobweb")
public class InternshipType {

	private Integer id;
	private String typeName;
	private Set<Internship> internship = new HashSet<Internship>();

	public InternshipType() {
		super();
	}

	public InternshipType(Integer id, String typeName,
			Set<Internship> internship) {
		super();
		this.id = id;
		this.typeName = typeName;
		this.internship = internship;
	}

	@Id
	@GeneratedValue
	@Column(name = "id" , nullable = false , unique = true)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "typeName" , nullable = false , length = 100)
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@OneToMany(cascade = { CascadeType.MERGE }, mappedBy = "internshipType")
	public Set<Internship> getInternship() {
		return internship;
	}

	public void setInternship(Set<Internship> internship) {
		this.internship = internship;
	}
}
