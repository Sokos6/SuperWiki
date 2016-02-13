package data;

import java.time.Year;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "superpersons")
public class SuperPersons {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String alias;
	private Year created;
	private String creator;
	@ManyToOne
	@JoinColumn(name = "Team_id")
	private SuperTeam team;
	private String appearance;
	@OneToMany(mappedBy = "superPerson")
	private List<SuperPersonType> superPersonType;
	@ManyToMany
	@JoinTable(name = "nemesis", joinColumns = @JoinColumn(name = "superperson_id") , inverseJoinColumns = @JoinColumn(name = "nemesis_id") )
	private List<SuperPersons> nemesis;
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

	public SuperTeam getTeam()
	{
		return team;
	}

	public void setTeam(SuperTeam team)
	{
		this.team = team;
	}

	public List<SuperPersonType> getSuperPersonType()
	{
		return superPersonType;
	}

	public void setSuperPersonType(List<SuperPersonType> superPersonType)
	{
		this.superPersonType = superPersonType;
	}

	public List<SuperPersons> getNemesis()
	{
		return nemesis;
	}

	public void setNemesis(List<SuperPersons> nemesis)
	{
		this.nemesis = nemesis;
	}
}
