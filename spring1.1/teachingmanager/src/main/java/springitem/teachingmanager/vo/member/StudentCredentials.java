package springitem.teachingmanager.vo.member;

import lombok.Data;
//存放学生的学号和密码
@Data
public class StudentCredentials {
    private String studentId;            //学生id
    private String studentNumber="";//学号
    private String password ="";//密码

    public StudentCredentials(String studentNumber, String password) {
        this.studentNumber = studentNumber;
        this.studentId = studentNumber;
        this.password = password;
    }
}
