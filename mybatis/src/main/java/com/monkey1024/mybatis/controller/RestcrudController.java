package com.monkey1024.mybatis.controller;

import com.alibaba.fastjson.JSON;
import com.monkey1024.mybatis.bean.Links;
import com.monkey1024.mybatis.bean.Student;
import com.monkey1024.mybatis.mapper.LinksMapper;
import com.monkey1024.mybatis.mapper.StudentMapper;
import com.monkey1024.mybatis.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/crud")
public class RestcrudController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private LinksMapper linksMapper;

    @Autowired
    private StudentMapper studentMapper ;

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @GetMapping("/get_users")
    public List<Student> findAll() throws Exception{

        List<Student> studentList = studentService.selectAllStudent();
        return studentList;
        //返回json格式的数据
//        return JSON.toJSONString(studentList);
    }

    @GetMapping("/get_links")
    public List<Links> selectList() throws Exception{

        List<Links> linkList = linksMapper.selectList(null);
        return linkList;
        //返回json格式的数据
//        return JSON.toJSONString(studentList);
    }

    /**
     * 根据id查找
     * @param id
     * @return
     * @throws Exception
     */
    @GetMapping("/user/{id}")
    public Student findById(@PathVariable Integer id) throws Exception{
        Student student = studentService.selectStudentById(id);
        if(student==null){
            System.out.println("id:"+id+"没找到对象！");
        }
        return student;
//        return JSON.toJSONString(student);
    }

    /**
     * 新增
     * 前端必须设置好 Content-Type:application/json
     */
    @PostMapping("/add_user")
    public String create(@RequestBody Student student){
        System.out.println("/crud/add_user");
        try {
            System.out.println(student);
            studentService.addStudent(student);
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }

        return JSON.toJSONString("success");
    }

    /**
     * 更新
     * @param id
     * @param student
     * @return
     */
    @PutMapping("/update_user/{id}")
    public String update(@PathVariable String id,@RequestBody Student student){
        try {
//            DataUtil.update(id,user);
            studentService.updateStudent(student);
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }

        return JSON.toJSONString("success");
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @DeleteMapping("/delete_user/{id}")
    public String delete(@PathVariable Integer id){
        try {
//            DataUtil.delete(id);
            studentService.deleteStudent(id);
        } catch (Exception e) {
            e.printStackTrace();
            return JSON.toJSONString("fail");
        }

        return JSON.toJSONString("success");
    }


    /**
     * 删除
     * @param id
     * @return
     */
//    @DeleteMapping("/deleteu/{id}")
    @GetMapping("/deleteu/{id}")
    public String deleteu(@PathVariable Integer id){
        studentMapper.deleteStudent(id);

        return JSON.toJSONString("success");
    }

}
