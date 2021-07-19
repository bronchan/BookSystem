package com.chan.pojo;

public class ReaderBook {
    private int id;
    private int readerId;
    private int bookIsbn;

    public ReaderBook() {
    }

    public ReaderBook(int id, int readerId, int bookIsbn) {
        this.id = id;
        this.readerId = readerId;
        this.bookIsbn = bookIsbn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReaderId() {
        return readerId;
    }

    public void setReaderId(int readerId) {
        this.readerId = readerId;
    }

    public int getBookIsbn() {
        return bookIsbn;
    }

    public void setBookIsbn(int bookIsbn) {
        this.bookIsbn = bookIsbn;
    }

    @Override
    public String toString() {
        return "ReaderBook{" +
                "id=" + id +
                ", readerId=" + readerId +
                ", bookIsbn=" + bookIsbn +
                '}';
    }
}
