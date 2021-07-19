package com.chan.controller;

import com.chan.pojo.Book;
import com.chan.pojo.Reader;
import com.chan.pojo.ReaderBook;
import com.chan.service.BookServiceImpl;
import com.chan.service.ReaderBookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

//管理书籍的类
@Controller
public class BookManagement {
    @Qualifier("bookServiceImpl")
    @Autowired
    private BookServiceImpl bookService;

    @Qualifier("readerBookServiceImpl")
    @Autowired
    private ReaderBookServiceImpl readerBookService;

//    显示书籍页面，全部书籍
    @RequestMapping("/toBookManaging")
    public String toBookManaging(){
        return "redirect:getBookManaging";
    }
    @RequestMapping("/getBookManaging")
    public String bookManaging(Model model){
        List<Book> allBooks = bookService.getAllBooks();
        model.addAttribute("bookList",allBooks);
        return "bookManaging";
    }
//    删除书籍
    @RequestMapping("/deleteBook/{isbn}")
    public String deleteBook(@PathVariable("isbn") String isbn){
        int i = bookService.delBookByIsbn(Integer.parseInt(isbn));
        if (i>0){
            System.out.println("删除成功");
        }
        return "redirect:/getBookManaging";
    }
//    去往修改书籍页面
    @RequestMapping("/toEditBook/{isbn}")
    public String toEditBook(HttpSession session, @PathVariable("isbn") String isbn){
        Book book = bookService.getBookByIsbn(Integer.parseInt(isbn));
        session.setAttribute("book",book);
        return "redirect:/editBook";
    }
    @RequestMapping("/editBook")
    public String editBook(){
        return "editBook";
    }

//    更新书籍
    @RequestMapping("/updateBook")
    public String updateBook(Book book){
        int i = bookService.update(book);
        if (i>0){
            System.out.println("修改成功");
        }
        return "redirect:/getBookManaging";
    }
//    去往添加书籍页面
    @RequestMapping("/toAddBook")
    public String toEditBook(){
        return "redirect:/addBook";
    }
    @RequestMapping("/addBook")
    public String addBook(){
        return "addBook";
    }

//    添加书籍
    @RequestMapping("/doAddBook")
    public String addBook(Book book){
        bookService.add(book);
        return "redirect:/getBookManaging";
    }

//    去往书籍借阅页面
    @RequestMapping("/toBorrowBook")
    public String toBorrowBook(){
        return "redirect:/borrowBook";
    }
    @RequestMapping("/borrowBook")
    public String getBorrowBook(Model model){
        List<Book> allBooks = bookService.getAllBooks();
        model.addAttribute("bookList",allBooks);
        return "borrowBook";
    }
//    去往书籍归还页面
    @RequestMapping("/toReturnBook")
    public String toReturnBook(){
        return "redirect:/returnBook";
    }
    @RequestMapping("/returnBook")
    public String getReturnBook(Model model,HttpSession session){
        Reader reader =(Reader) session.getAttribute("user");
        int id = reader.getId();
//        查询该用户所借阅的书
        List<ReaderBook> readerBookList= readerBookService.getReaderBookById(id);
//        设置借阅图书的全局属性
        List<Book> bookList = new ArrayList<Book>();
//        如果该用户借阅的图书不为空
        if (readerBookList!=null){
            for (ReaderBook readerBook:readerBookList) {
//                根据借阅图书编号查询出图书信息
                Book bookByIsbn = bookService.getBookByIsbn(readerBook.getBookIsbn());
                bookList.add(bookByIsbn);
            }
        }
        model.addAttribute("bookBorrowing",bookList);
        return "returnBook";
    }

}
