package com.chan.dao;

import com.chan.pojo.Book;

import java.util.List;

public interface BookDao {
    List<Book> getAllBooks();
    Book getBookByIsbn(int isbn);
    void add(Book book);
    int delBookByIsbn(int isbn);
    int update(Book book);
}
