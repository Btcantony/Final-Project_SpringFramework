package main.java.com.web.dto;

import java.util.List;

import lombok.Data;

@Data
public class Body {
	public List<DataItem> items;
    public int numOfRows;
    public int pageNo;
    public int totalCount;
}
