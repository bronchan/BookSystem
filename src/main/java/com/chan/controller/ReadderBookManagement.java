package com.chan.controller;

import com.chan.pojo.Book;
import com.chan.pojo.Reader;
import com.chan.pojo.ReaderBook;
import com.chan.service.BookServiceImpl;
import com.chan.service.ReaderBookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;
//借阅管理
//RestController注解，不跳转页面，只给当前页面返回数据
@RestController
public class ReadderBookManagement {
    @Qualifier("readerBookServiceImpl")
    @Autowired
    private ReaderBookServiceImpl readerBookService;

    @Qualifier("bookServiceImpl")
    @Autowired
    private BookServiceImpl bookService;

    @RequestMapping("/borrowingBook")
    public String borrowingBook(HttpSession session,String bookISBN){
        int isbn = Integer.parseInt(bookISBN);
        String msg = "借阅成功";
//        查出本书信息
        Book book = bookService.getBookByIsbn(isbn);
//        图书不存在
        if (book==null) return "-1";
//        图书数量不足
        if (book.getNum()<1) return "-2";

//        获取当前用户信息
        Reader reader =(Reader) session.getAttribute("user");

//        根据当前图书编号查出所有借阅该书的信息
        List<ReaderBook> readerBookList = readerBookService.getReaderBookByIsbn(isbn);

//        借阅该书的读者有当前用户
        for (ReaderBook readerBook:readerBookList) {
            if (readerBook.getReaderId() == reader.getId()){
                return "-3";
            }
        }
        ReaderBook readerBook = new ReaderBook();
        readerBook.setBookIsbn(isbn);
        readerBook.setReaderId(reader.getId());
        readerBookService.add(readerBook);
        System.out.println(msg);
        return msg;
    }

    @RequestMapping("/returningBook")
    public String returningBook(String bookISBN){
        String msg = "归还错误";
        int isbn = Integer.parseInt(bookISBN);
        int i = readerBookService.deleteReaderBookByIsbn(isbn);
        if (i>0){
            msg = "归还成功";
            System.out.println("归还成功");
        }
        return msg;
    }


}
