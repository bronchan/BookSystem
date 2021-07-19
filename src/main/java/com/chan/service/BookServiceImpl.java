package com.chan.service;

import com.chan.dao.BookDao;
import com.chan.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    public List<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }

    public Book getBookByIsbn(int isbn) {
        return bookDao.getBookByIsbn(isbn);
    }

    public void add(Book book) {
        bookDao.add(book);
    }

    public int delBookByIsbn(int isbn) {
        return bookDao.delBookByIsbn(isbn);
    }

    public int update(Book book) {
        return bookDao.update(book);
    }
}
