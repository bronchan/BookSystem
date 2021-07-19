package com.chan.service;

import com.chan.dao.ReaderBookDao;
import com.chan.pojo.ReaderBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReaderBookServiceImpl implements ReaderBookDao {
    @Autowired
    private ReaderBookDao readerBookDao;


    public List<ReaderBook> getAllReaderBook() {
        return readerBookDao.getAllReaderBook();
    }

    public void add(ReaderBook readerBook) {
         readerBookDao.add(readerBook);
    }

    public List<ReaderBook> getReaderBookByIsbn(int isbn) {
        return readerBookDao.getReaderBookByIsbn(isbn);
    }

    public List<ReaderBook> getReaderBookById(int id) {
        return readerBookDao.getReaderBookById(id);
    }

    public int deleteReaderBookByIsbn(int isbn) {
        return readerBookDao.deleteReaderBookByIsbn(isbn);
    }
}
