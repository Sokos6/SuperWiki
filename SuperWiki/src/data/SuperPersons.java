package data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SuperPersons")
public class SuperPersons
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private int created;
	private String creator;
	private SuperTeam team_id;
	private int super_type_id;
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getCreated()
	{
		return created;
	}
	public void setCreated(int created)
	{
		this.created = created;
	}
	public String getCreator()
	{
		return creator;
	}
	public void setCreator(String creator)
	{
		this.creator = creator;
	}
	public SuperTeam getTeam_id()
	{
		return team_id;
	}
	public void setTeam_id(SuperTeam team_id)
	{
		this.team_id = team_id;
	}
	public int getSuper_type_id()
	{
		return super_type_id;
	}
	public void setSuper_type_id(int super_type_id)
	{
		this.super_type_id = super_type_id;
	}
	public int getId()
	{
		return id;
	}
	
}
