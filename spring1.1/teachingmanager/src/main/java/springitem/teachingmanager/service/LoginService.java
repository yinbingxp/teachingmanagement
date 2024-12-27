package springitem.teachingmanager.service;


import springitem.teachingmanager.dto.login.LoginParam;
import springitem.teachingmanager.dto.login.ModifyPasswordParam;
import springitem.teachingmanager.vo.login.LoginData;

public interface LoginService {

    /**
     * 用户登录
     * @param json 从前端传过来的数据
     * @return token字符串
     */
    LoginData login(LoginParam json);

    /**
     * 检查用户登录状态
     * @param data  用户传入的数据
     */
    void checkLogin(LoginData data) throws Exception;

    /**
     * 修改用户密码
     * @param json 用户修改密码的参数
     */
    void modifyUserPassword(ModifyPasswordParam json);

}
