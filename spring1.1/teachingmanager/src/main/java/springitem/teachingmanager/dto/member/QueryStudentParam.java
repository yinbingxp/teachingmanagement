package springitem.teachingmanager.dto.member;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import springitem.teachingmanager.vo.member.Student;

/**
 * 查询学生信息的类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryStudentParam {
    private Integer pageSize;
    private Integer currentPage;
    private Student param;
}
