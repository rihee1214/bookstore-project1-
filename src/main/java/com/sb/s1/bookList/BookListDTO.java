package com.sb.s1.bookList;

public class BookListDTO {

	private String icbn;
	private String bookName;
	private long price;
	private long gNumber;
	private long eBookPrice;
	private String bookContent;
	private String bookEx;
	private String bookIdx;
	private String bookPub;
	
	
	public String getIcbn() {
		return icbn;
	}
	public void setIcbn(String icbn) {
		this.icbn = icbn;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public long getgNumber() {
		return gNumber;
	}
	public void setgNumber(long gNumber) {
		this.gNumber = gNumber;
	}
	public long geteBookPrice() {
		return eBookPrice;
	}
	public void seteBookPrice(long eBookPrice) {
		this.eBookPrice = eBookPrice;
	}
	public String getBookContent() {
		return bookContent;
	}
	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}
	public String getBookEx() {
		return bookEx;
	}
	public void setBookEx(String bookEx) {
		this.bookEx = bookEx;
	}
	public String getBookIdx() {
		return bookIdx;
	}
	public void setBookIdx(String bookIdx) {
		this.bookIdx = bookIdx;
	}
	public String getBookPub() {
		return bookPub;
	}
	public void setBookPub(String bookPub) {
		this.bookPub = bookPub;
	}
	
}
