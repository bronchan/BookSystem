package com.chan.dao;

import com.chan.pojo.ReaderBook;

import java.util.List;

public interface ReaderBookDao {
    List<ReaderBook> getAllReaderBook();
    void add(ReaderBook readerBook);
    List<ReaderBook> getReaderBookByIsbn(int isbn);
    List<ReaderBook> getReaderBookById(int id);
    int deleteReaderBookByIsbn(int isbn);
}
