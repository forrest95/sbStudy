package com.monkey1024.mybatis.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.monkey1024.mybatis.bean.Links;
import com.monkey1024.mybatis.mapper.LinksMapper;
import com.monkey1024.mybatis.service.StudentService;
import com.monkey1024.mybatis.util.Helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/link")
public class LinksController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private LinksMapper linksMapper;


    /**
     * 查询全部数据
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model) {
        List<Links> linksLists = linksMapper.selectList(null);
        model.addAttribute("linksLists", linksLists);

        //start 发送map到前端
        HashMap<String, Links> linksMap = new HashMap<>();
        for (int i = 0; i < 10; i++) {
            Links link = new Links();
            link.setId(i);
            link.setName("jack" + i);
            link.setDescription("13"+i+"11111111");
            linksMap.put(String.valueOf(i), link);
        }

        model.addAttribute("linksMap", linksMap);
        //end 结束发送map


        return "hwtc/links/index";
    }

    /**
     * 查询全部数据  实现分页
     * @param model
     * @return
     */
    @RequestMapping("/index2/{page}")
    public String index2(Model model, @PathVariable Integer page) {

        System.out.println("开始分页 /link/index2");
        PageHelper.startPage(page,4);
        List<Links> linksLists=linksMapper.selectList(null);

        PageInfo<Links> pageInfo=new PageInfo<>(linksLists);

        model.addAttribute("linksLists", pageInfo.getList());
        //最后把信息放入model转发到页面把信息带过去
        model.addAttribute("pageNo",pageInfo.getPages());
        model.addAttribute("totalCount",pageInfo.getTotal());
        model.addAttribute("prePage",pageInfo.getPrePage());
        model.addAttribute("nextPage",pageInfo.getNextPage());
        model.addAttribute("pagenum",pageInfo.getPageNum());
        model.addAttribute("pagetotal",pageInfo.getPages());



        System.out.println("##########################");
        System.out.println("总页数："+pageInfo.getPages());

        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("当前页："+pageInfo.getPageNum());

        System.out.println("上一页："+pageInfo.getPrePage());

        System.out.println("下一页："+pageInfo.getNextPage());

        System.out.println("是否有上一页："+pageInfo.isHasPreviousPage());

        System.out.println("是否有下一页："+pageInfo.isHasNextPage());

        System.out.println("是否为首页："+pageInfo.isIsFirstPage());

        System.out.println("是否为末页："+pageInfo.isIsLastPage());

        System.out.println("首页??? "+pageInfo.getNavigateFirstPage());
        System.out.println("最后一页??? "+pageInfo.getNavigateLastPage());

        System.out.println("##########################");


        return "hwtc/links/index2";
    }


    /**
     * 去修改页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/toUpdate")
    public String toUpdate(@RequestParam(value = "id") Integer id,Model model) {

        Links link=linksMapper.selectById(id);

        model.addAttribute("link", link);

//        return "hwtc/links/add_and_update";
        return "add_and_update";

    }

    /**
     * 去添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd(){
//        return "hwtc/links/add_and_update";
        return "add_and_update";
    }

    /**
     * 添加或修改
     * @param link
     * @return
     */
    @RequestMapping("/addOrUpdate")
    public String addOrUpdate(Links link) {
        System.out.println("start link 1111111111111");
        System.out.println(link);
        System.out.println("link id: "+link.getId());
        System.out.println("类型是: "+Helper.getType(link));
        System.out.println("end link 1111111111111");

        if (link.getId() == null){
            //添加

//            studentService.addStudent(link);
            linksMapper.insert(link);
        }else {
            //修改
//            studentService.updateStudent(link);
            linksMapper.updateById(link);
        }

        return "redirect:/link/index";
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/student/delete")
    public String delete(@RequestParam("id") Integer id){
        studentService.deleteStudent(id);

        return "redirect:/link/index";
    }


}
