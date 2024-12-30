package springitem.teachingmanager.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import springitem.teachingmanager.dto.application.CourseApplication;
import springitem.teachingmanager.service.CourseExaminationService;
import springitem.teachingmanager.utils.ReturnResult.Result;
import java.util.ArrayList;

@RestController
public class CourseExaminationController {

    @Autowired
    CourseExaminationService courseExaminationService;

    //查询所有待审批的数据
    @GetMapping("/wait/examination")
    public Result getWaitExamination(String examinationName) {
        ArrayList<CourseApplication> data = courseExaminationService.getWaitExamination(examinationName);
        return new Result().success(data);
    }

    //查询所有已审批的数据
    @GetMapping("/already/examination")
    public Result getAlreadyExamination(String examinationName) {
        ArrayList<CourseApplication> data = courseExaminationService.getAlreadyExamination(examinationName);
        return new Result().success(data);
    }

    //审批一条记录
    @PostMapping("/course/examination")
    public Result examineACourse(@RequestBody CourseApplication json) {
        try {
            courseExaminationService.examineACourse(json);
            return new Result().success();
        } catch (Exception e) {
            return new Result().error(e.getMessage());
        }
    }

}
