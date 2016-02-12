package data;

import java.time.Year;

public class SuperPersonType
{
	private SuperType superType;
	private SuperPerson superPerson;
	private Year startYear;
	private Year endYear;
	
	public int getSuperType_id()
	{
		return superType_id;
	}
	public void setSuperType_id(int superType_id)
	{
		this.superType_id = superType_id;
	}
	public int getSuperPerson_id()
	{
		return superPerson_id;
	}
	public void setSuperPerson_id(int superPerson_id)
	{
		this.superPerson_id = superPerson_id;
	}
	public Year getStartYear()
	{
		return startYear;
	}
	public void setStartYear(Year startYear)
	{
		this.startYear = startYear;
	}
	public Year getEndYear()
	{
		return endYear;
	}
	public void setEndYear(Year endYear)
	{
		this.endYear = endYear;
	}
}
