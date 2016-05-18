package vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role" ,catalog = "jobweb")
public class Role {
	
	// Fields
	private Integer id ; 
	private String rolename;

	// Constructors
	public Role() {
	}

	/** full constructor */
	public Role(Integer id, String rolename) {
		this.id = id;
		this.rolename = rolename;
	}

	@Id
	@GeneratedValue
	@Column(name = "id" ,unique = true , nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "rolename" ,nullable = false ,length = 30)
	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	
}
