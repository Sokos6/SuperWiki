package data;

import java.time.Year;
import java.util.List;

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
	private String alias;	
	private Year created;
	private String creator;
	private SuperTeam team;
	private String appearance;
	private List<SuperPersonType> superPersonType;
	private List<SuperPersons>  nemesis;
	private int team_id;
	private String appearance;
	private String costume;
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public Year getCreated()
	{
		return created;
	}
	public void setCreated(Year created)
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
	public int getTeam_id()
	{
		return team_id;
	}
	public void setTeam_id(int team_id)
	{
		this.team_id = team_id;
	}
	public String getAlias()
	{
		return alias;
	}
	public void setAlias(String alias)
	{
		this.alias = alias;
	}
	public String getAppearance()
	{
		return appearance;
	}
	public void setAppearance(String appearance)
	{
		this.appearance = appearance;
	}
	public String getCostume()
	{
		return costume;
	}
	public void setCostume(String costume)
	{
		this.costume = costume;
	}
}
