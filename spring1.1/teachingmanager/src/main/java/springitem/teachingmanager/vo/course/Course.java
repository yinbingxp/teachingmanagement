package springitem.teachingmanager.vo.course;

import lombok.Data;

@Data
public class Course {
    private String courseId;            //课程id
    private String name = "";           //课程名称
    private String teacherId;           //教师id
    private String teacherName = "";    //教师名称
    private String credit;              //学分
    private String hour;                //学时
    private String time;                //上课时间
    private String placeId;             //上课地点id
    private String placeName;           //上课地点
    private String description;         //课程描述
    private String courseStatusId;      //课程状态id
    private String courseStatusName;    //课程状态
//    private boolean isSelected;         //是否被选
    private Float score;                //课程成绩

}
