package superHeroTest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String email;
	private String password;
	

	@Column(name = "create_time")
	private Date timeStamp;
	@OneToMany(mappedBy = "user")
	private List<Comment> comments = new ArrayList<Comment>();
	@OneToMany(mappedBy="user", fetch=FetchType.EAGER)
	private List<Favorite> favorites = new ArrayList<Favorite>();

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public Date getTimeStamp()
	{
		return timeStamp;
	}

	public void setTimeStamp(Date timeStamp)
	{
		this.timeStamp = timeStamp;
	}
	public List<Comment> getComments()
	{
		return comments;
	}
	
	public void setComments(List<Comment> comments)
	{
		this.comments = comments;
	}
	
	public List<Favorite> getFavorites()
	{
		return favorites;
	}
	
	public void setFavorites(List<Favorite> favorites)
	{
		this.favorites = favorites;
	}

	@Override
	public String toString()
	{
		return "User [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", timeStamp=" + timeStamp + ", comments=" + comments + ", favorites=" + favorites + "]";
	}
}
