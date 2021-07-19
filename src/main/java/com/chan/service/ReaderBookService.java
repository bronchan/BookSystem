package com.chan.service;

import com.chan.pojo.ReaderBook;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ReaderBookService {
    List<ReaderBook> getAllReaderBook();
    void add(ReaderBook readerBook);
    List<ReaderBook> getReaderBookByIsbn(int isbn);
    List<ReaderBook> getReaderBookById(int id);
    int deleteReaderBookByIsbn(int isbn);
}
