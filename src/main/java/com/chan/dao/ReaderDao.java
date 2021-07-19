package com.chan.dao;

import com.chan.pojo.Reader;

import java.util.List;

public interface ReaderDao {
    int getTotal();
    int deleteById(int id);
    void add(Reader reader);
    Reader getReaderById(int id);
    List<Reader> getAllReader();
}
