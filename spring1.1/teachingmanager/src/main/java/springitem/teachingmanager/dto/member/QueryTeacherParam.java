package springitem.teachingmanager.dto.member;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import springitem.teachingmanager.vo.member.Teacher;

/**
 * 查询教师信息的类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryTeacherParam {
    private Integer pageSize;
    private Integer currentPage;
    private Teacher param;
}
