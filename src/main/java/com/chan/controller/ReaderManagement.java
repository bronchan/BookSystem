package com.chan.controller;

import com.chan.pojo.Reader;
import com.chan.service.ReaderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

//管理员管理读者的类
@Controller
public class ReaderManagement {

    @Qualifier("readerServiceImpl")
    @Autowired
    private ReaderServiceImpl readerService;

    @RequestMapping("/toReaderManaging")
    public String toReaderManaging(){
        return "redirect:/readerManaging";
    }
    @RequestMapping("/readerManaging")
    public String getReaderManaging(Model model){
        List<Reader> allReader = readerService.getAllReader();
        model.addAttribute("readerList",allReader);
        return  "readerManaging";
    }

    @RequestMapping("/deleteReader/{id}")
    public String deleteReader(@PathVariable("id") int id){
        int i = readerService.deleteById(id);
        if (i>0){
            System.out.println("删除成功");
        }
        return "redirect:/readerManaging";
    }
}
