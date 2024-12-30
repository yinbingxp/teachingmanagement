package springitem.teachingmanager.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import springitem.teachingmanager.dto.login.LoginParam;
import springitem.teachingmanager.dto.login.ModifyPasswordParam;
import springitem.teachingmanager.mapper.LoginMapper;
import springitem.teachingmanager.service.LoginService;
import springitem.teachingmanager.utils.JwtUtil;
import springitem.teachingmanager.vo.login.LoginData;

import java.util.HashMap;
import java.util.Map;
import springitem.teachingmanager.utils.ReturnResult.Result;
import springitem.teachingmanager.vo.member.Administrator;
import springitem.teachingmanager.vo.member.Student;
import springitem.teachingmanager.vo.member.Teacher;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    LoginMapper loginMapper;

    @Override
    public LoginData login(LoginParam json) {
        String account = json.getAccount();
        String password = json.getPassword();
        String authority = json.getAuthority();
        LoginData data = new LoginData();
        switch (authority) {
            case "1":
                Administrator administrator = loginMapper.administratorLogin(account, password);
                if (administrator == null) {
                    return null;
                } else {
                    data.setId(administrator.getAdministratorId());
                    data.setName(administrator.getName());
                }
                break;
            case "2":
                Student student = loginMapper.studentLogin(account, password);
                if (student == null) {
                    return null;
                } else {
                    data.setId(student.getStudentId());
                    data.setName(student.getName());
                }
                break;
            case "3":
                Teacher teacher = loginMapper.teacherLogin(account, password);
                if (teacher == null) {
                    return null;
                } else {
                    data.setId(teacher.getTeacherId());
                    data.setName(teacher.getName());
                }
                break;
            default:
                return null;
        }
        //用jwt工具封装好token返回给前端
        Map<String,Object> claims = new HashMap<>();
        claims.put("role", json.getAuthority());
        claims.put("name", data.getName());
        claims.put("id",data.getId());
        String token = JwtUtil.genJWT(claims);
        data.setRole(authority);
        data.setToken(token);
        return data;
    }

    @Override
    public void checkLogin(LoginData data) throws Exception {
        String token = data.getToken();
        Map<String, Object> claims = JwtUtil.parseJWT(token);
        String role = (String) claims.get("role");
        String name = (String) claims.get("name");
        String id = (String) claims.get("id");
        if (!role.equals(data.getRole()) || !name.equals(data.getName()) || !id.equals(data.getId())) {
            throw new Exception("用户登录信息被篡改！");
        }
    }

    @Override
    public void modifyUserPassword(ModifyPasswordParam json) {
        String authority = json.getAuthority();
        switch (authority) {
            case "1":
                loginMapper.updateAdministratorPassword(json);
                break;
            case "2":
                loginMapper.updateStudentPassword(json);
                break;
            case "3":
                loginMapper.updateTeacherPassword(json);
                break;
            default:
                break;
        }
    }

}
