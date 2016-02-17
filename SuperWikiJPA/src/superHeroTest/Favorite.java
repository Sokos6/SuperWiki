package superHeroTest;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="favorite_superpersons")
public class Favorite {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name="superpersons_id")
	private SuperPersons superPerson;
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	public Favorite(User user, SuperPersons superPerson){
		this.superPerson = superPerson;
		this.user = user;
	}
	public Favorite(){
		
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public SuperPersons getSuperPerson()
	{
		return superPerson;
	}
	public void setSuperPerson(SuperPersons superPerson)
	{
		this.superPerson = superPerson;
	}
	public User getUser()
	{
		return user;
	}
	public void setUser(User user)
	{
		this.user = user;
	}
	
}
