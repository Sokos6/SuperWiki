package data;

public class Comment
{
	private int id;
	private int user_id;
	private String message;
	private int dateTime;
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getUser_id()
	{
		return user_id;
	}
	public void setUser_id(int user_id)
	{
		this.user_id = user_id;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
	}
	public int getDateTime()
	{
		return dateTime;
	}
	public void setDateTime(int dateTime)
	{
		this.dateTime = dateTime;
	}
}
