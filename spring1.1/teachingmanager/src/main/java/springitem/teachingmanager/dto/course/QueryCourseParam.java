package springitem.teachingmanager.dto.course;


import lombok.Data;
import springitem.teachingmanager.vo.course.Course;

@Data
public class QueryCourseParam {
    private Integer pageSize;       //页大小
    private Integer currentPage;    //第几页
    private Course param;           //课程的查询参数
}
