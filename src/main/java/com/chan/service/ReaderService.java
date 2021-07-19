package com.chan.service;

import com.chan.pojo.Reader;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ReaderService {
    int getTotal();
    int deleteById(int id);
    void add(Reader reader);
    Reader getReaderById(int id);
    List<Reader> getAllReader();
}
