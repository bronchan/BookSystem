package com.chan.service;

import com.chan.pojo.Book;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface BookService {
    List<Book> getAllBooks();
    Book getBookByIsbn(int isbn);
    void add(Book book);
    int delBookByIsbn(int isbn);
    int update(Book book);
}
