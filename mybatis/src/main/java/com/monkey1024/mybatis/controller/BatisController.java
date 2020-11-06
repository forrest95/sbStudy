package com.monkey1024.mybatis.controller;

import com.monkey1024.mybatis.bean.Employee;
import com.monkey1024.mybatis.bean.Player;
import com.monkey1024.mybatis.bean.Team;
import com.monkey1024.mybatis.service.EmployeeService;
import com.monkey1024.mybatis.service.PlayerService;
import com.monkey1024.mybatis.service.TeamService;
import com.monkey1024.mybatis.util.ResultData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/batis")
public class BatisController {
    //关联查询测试案例

    @Autowired
    private TeamService teamService;

    @Autowired
    private PlayerService playerService;

    @Autowired
    private EmployeeService employeeService;

    /**
     * 一对多
     * 06 onetomany
     */
    @GetMapping("/onetomany/{id}")
    public Team selectone(@PathVariable Integer id) throws Exception{
        Team team = teamService.selectTeamById(id);
        if(team==null){
            System.out.println("");
            System.out.println("id:"+id+"team没找到对象！");
            System.out.println("");
        }
        return team;
    }

    /**
     * 多对一  其实就是一对一
     * 07 many to one
     */
    @GetMapping("/manytoone/{id}")
    public Player selectPlayerById(@PathVariable Integer id) throws Exception{
        Player player=playerService.selectPlayerById(id);

        if(player==null){
            System.out.println("");
            System.out.println("id:"+id+" player没找到对象！");
            System.out.println("");
        }
        return player;
    }

    /**
     * 08 selfonetomany
     * 自关联一对多查询
     */
    @GetMapping("selfonetomany/{id}")
    public List<Employee> selectChildrenByPid(@PathVariable Integer id) throws Exception{
        List<Employee> employees=employeeService.selectChildrenByPid(id);
        return employees;
    }

    /**
     * 08 selfonetomany
     * 自关联一对多查询
     */
    @GetMapping("selfonetomany2/{id}")
    public List<Employee> selectEmployeeByPid(@PathVariable Integer id) throws Exception{
        List<Employee> employees=employeeService.selectEmployeeByPid(id);
        return employees;
    }


    /**
     * 09 selfmanytoone
     * 自关联多对一查询
     */
    @GetMapping("selfmanytoone/{mgr}")
    public Employee selectLeaderByPid(@PathVariable Integer mgr){
        System.out.println("自关联多对一查询");
        Employee employee=employeeService.selectLeaderByPid(mgr);
        return employee;
    }

    //10 统一返回结果
    @GetMapping("unite/{mgr}/{param2}")
    public ResultData unite(@PathVariable Integer mgr,@PathVariable String param2){
        System.out.println("统一返回结果");
        System.out.println("mgr: "+mgr);
        System.out.println("param2: "+param2);
//        return ResultData.success(mgr+param2,"成功11");
        return ResultData.fail("44","aa",null);
//        return ResultData.apireturn("2001",mgr+param2,"我是成功啦");
    }



}
