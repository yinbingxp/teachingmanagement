package springitem.teachingmanager.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import springitem.teachingmanager.dto.application.CourseApplication;
import springitem.teachingmanager.service.CourseApplicationService;
import springitem.teachingmanager.utils.ReturnResult.Result;
import java.util.ArrayList;

@Slf4j
@RestController
public class CourseApplicationController {

    @Autowired
    CourseApplicationService courseApplicationService;

    //申请新增一门课程
    @PostMapping("/apply/add/course")
    public Result applyANewCourse(@RequestBody CourseApplication json) {
        if (courseApplicationService.applyANewCourse(json)) {
           return new Result().success();
        }
        return new Result().error("申请新增失败，不存在这样的审批或者操作！");
    }

    //申请修改一门课程
    @PostMapping("/apply/modify/course")
    public Result applyModifyCourse(@RequestBody CourseApplication json) {

        return new Result().error("申请修改失败，不存在这样的审批或操作！");
    }

    //申请删除一门课程
    @PostMapping("/apply/deltele/course")
    public Result applyDeleteCourse(@RequestBody CourseApplication json) {
        return new Result().error("申请删除失败， 不存在这样的审批或操作！");
    }

    //根据id查询全部申请
    @GetMapping("/all/application")
    public Result getAllApplicationByTeacherId(String teacherId) {
        ArrayList<CourseApplication> data = courseApplicationService.getAllApplicationByTeacherId(teacherId);
        return new Result().success(data);
    }

    //根据id和审批状态查询记录
    @GetMapping("/application")
    public Result getApplicationByTeacherIdAndExaminationName(String teacherId, String courseExaminationName) {
        ArrayList<CourseApplication> data = courseApplicationService.getApplicationByTeacherIdAndExaminationName(teacherId, courseExaminationName);
        return new Result().success(data);
    }

    //根据申请id查询一条申请记录
    @GetMapping("/get/application")
    public Result getCourseApplicationById(String courseApplicationId) {
        CourseApplication data = courseApplicationService.getCourseApplicationById(courseApplicationId);
        return new Result().success(data);
    }

}
