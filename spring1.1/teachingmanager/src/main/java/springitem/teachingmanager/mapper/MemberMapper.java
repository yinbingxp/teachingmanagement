package springitem.teachingmanager.mapper;



import springitem.teachingmanager.vo.member.Department;
import springitem.teachingmanager.vo.member.Student;
import springitem.teachingmanager.vo.member.Teacher;
import org.apache.ibatis.annotations.*;

import java.util.ArrayList;

@Mapper
public interface MemberMapper {

    /* 查询所有学院的信息 */
    @Select("select department_id as departmentId, name as departmentName from department")
    ArrayList<Department> getDepartmentInfo();

    /* 根据条件统计教师数量 */
    @Select("select count(*) from teacher left join department on teacher.department_id = department.department_id " +
            "where teacher.teacher_number like concat('%',#{teacherNumber},'%') " +
            "and teacher.name like concat('%',#{name},'%') " +
            "and department.name like concat('%',#{departmentName},'%') ")
    int getTeacherCount(Teacher param);

    /* 根据条件查询教师信息（分页） */
    @Select("select teacher.*, department.name as departmentName " +
            "from teacher left join department on teacher.department_id = department.department_id " +
            "where teacher.teacher_number like concat('%',#{param.teacherNumber},'%') " +
            "and teacher.name like concat('%',#{param.name},'%') " +
            "and department.name like concat('%',#{param.departmentName},'%') " +
            "limit #{index}, #{size}")
    ArrayList<Teacher> getTeacherInfo(Teacher param, Integer index, Integer size);

    @Select("select teacher.*, d.name as departmentName from teacher " +
            "left join department d on d.department_id = teacher.department_id ")
    ArrayList<Teacher> getTeachers();

    /* 插入一条教师信息 */
    @Insert("insert into teacher (teacher_number, name,password, department_id) values (#{teacherNumber}, #{name}, #{password}, #{departmentId})")
    void insertTeacherInfo(Teacher teacher);

    /* 根据教师id删除相应的记录 */
    void deleteTeachersInfo(String[] teacherIds);

    /* 根据教师id查询相应的记录 */
    @Select("select t.*, d.name as departmentName from teacher t " +
            "left join department d on t.department_id = d.department_id " +
            "where t.teacher_id = #{teacherId}")
    Teacher getTeacherInfoById(String teacherId);

    /* 根据教师id修改教师的信息 */
    @Update("update teacher set teacher_number = #{teacherNumber}, " +
            "name = #{name},  password = #{password}, department_id = #{departmentId}, date_time = now() " +
            "where teacher_id = #{teacherId}")
    void updateTeacherInfoById(Teacher teacher);

    /* 根据条件统计学生数量 */
    @Select("select count(*) from student where student_number " +
            "like concat('%',#{studentNumber},'%') " +
            "and name like concat('%',#{name},'%') " +
            "and student_class like concat('%',#{studentClass},'%')")
    int getStudentCount(Student param);

    /* 根据条件查询学生信息（分页） */
    @Select("select * from student where student_number " +
            "like concat('%',#{param.studentNumber},'%') " +
            "and name like concat('%',#{param.name},'%') " +
            "and student_class like concat('%',#{param.studentClass},'%') " +
            "limit #{index}, #{size}")
    ArrayList<Student> getStudentInfo(Student param, Integer index, Integer size);

    /* 插入一条学生信息 */
    @Insert("insert into student (student_number, name, student_class,password) values (#{studentNumber}, #{name}, #{studentClass},#{password})")
    void insertStudentInfo(Student student);

    /* 根据学生id删除相应的记录 */
    void deleteStudentsInfo(String[] studentIds);

    /* 根据学生id查询相应的记录 */
    @Select("select * from student where student_id = #{studentId}")
    Student getStudentInfoById(String studentId);
   //更新时间2024.11.23(更新了密码)
    /* 根据学生id修改学生的信息 */
    @Update("update student set student_number = #{studentNumber}, " +
            "name = #{name}, student_class = #{studentClass},password = #{password}, date_time = now() " +
            "where student_id = #{studentId}")
    void updateStudentInfoById(Student student);

}
