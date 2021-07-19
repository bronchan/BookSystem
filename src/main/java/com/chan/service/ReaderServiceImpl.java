package com.chan.service;

import com.chan.dao.ReaderDao;
import com.chan.pojo.Reader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReaderServiceImpl implements ReaderService {
    @Autowired
    private ReaderDao readerDao;

    public void setReaderDao(ReaderDao readerDao) {
        this.readerDao = readerDao;
    }

    public int getTotal() {
        return readerDao.getTotal();
    }

    public int deleteById(int id) {
        return readerDao.deleteById(id);
    }

    public void add(Reader reader) {
         readerDao.add(reader);
    }

    public Reader getReaderById(int id) {
        return readerDao.getReaderById(id);
    }

    public List<Reader> getAllReader() {
        return readerDao.getAllReader();
    }
}
