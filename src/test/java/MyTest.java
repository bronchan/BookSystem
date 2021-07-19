import com.chan.pojo.Admin;
import com.chan.pojo.Book;
import com.chan.service.AdminServiceImpl;
import com.chan.service.BookServiceImpl;
import com.chan.utils.StringUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {

    @Test
    public void test1(){
        ApplicationContext context = new ClassPathXmlApplicationContext("application-config.xml");
        AdminServiceImpl adminServiceImpl = context.getBean("AdminServiceImpl", AdminServiceImpl.class);
        Admin adminById = adminServiceImpl.getAdminById(3);
        System.out.println(adminById);
//        int i = adminServiceImpl.add(new Admin(520, "james", "200424"));
//        System.out.println(i);
    }

    @Test
    public void test2(){
        ApplicationContext context = new ClassPathXmlApplicationContext("application-config.xml");
        BookServiceImpl bookServiceImpl = context.getBean("BookServiceImpl", BookServiceImpl.class);
        List<Book> allBooks = bookServiceImpl.getAllBooks();
        for (Book book:allBooks) {
            System.out.println(book.toString());
        }
    }

    @Test
    public void test3(){
        String str = "123456";
        boolean integer = StringUtil.isInteger(str);
        System.out.println(integer);
        int sum = sum(Integer.parseInt(str));
        System.out.println(sum);
    }

    private int sum(int i){
        return 5+i;
    }
}
