package com.chan.pojo;

public class Book {
    private int isbn;//编号
    private String name; //书名
    private float price; //价格
    private int num;
    private String writer; //作者

    public Book() {
    }


    public Book(int isbn, String name, float price, int num, String writer) {
        this.isbn = isbn;
        this.name = name;
        this.price = price;
        this.num = num;
        this.writer = writer;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    @Override
    public String toString() {
        return "Book{" +
                "isbn=" + isbn +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", writer='" + writer + '\'' +
                '}';
    }
}
