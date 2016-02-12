package data;

import java.time.Year;

public class SuperPersonType
{
	private SuperType superType;
	private SuperPersons superPerson;
	private Year startYear;
	private Year endYear;
	
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
	public SuperType getSuperType()
	{
		return superType;
	}
	public void setSuperType(SuperType superType)
	{
		this.superType = superType;
	}
	public SuperPersons getSuperPerson()
	{
		return superPerson;
	}
	public void setSuperPerson(SuperPersons superPerson)
	{
		this.superPerson = superPerson;
	}
}
