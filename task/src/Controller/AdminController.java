package Controller;

import Service.AdminService;
import Service.JoinMeetingService;
import Service.MeetingInfoService;
import Service.UserService;
import VO.Admin;
import VO.Meeting;
import VO.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String para = request.getParameter("method");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //解决中文乱码
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String para = request.getParameter("method");
        /**
         * 登录
         * */
        if("Login".equals(para)){
            String AdminId = request.getParameter("AdminId");
            request.setAttribute("AdminId",AdminId);
            request.getRequestDispatcher("/Admin/Admin.jsp").forward(request,response);
        }
        /**
         * 跳转页面
         * */
        else if("selectPages".equals(para)){
            String AdminId = request.getParameter("AdminId");
            String i = request.getParameter("i");
            String p = request.getParameter("p");
            String searchId = request.getParameter("searchId");

            request.setAttribute("AdminId", AdminId);
            request.setAttribute("p",p);
            request.setAttribute("searchId",searchId);
            request.getRequestDispatcher("/Admin/AdminPage"+i+".jsp").forward(request, response);
        }
        /**
         * 修改管理员密码
         * */
        else if("ChangeAdminPass".equals(para)){
            String CPassword = request.getParameter("inputPasswordCurrent");
            String NPassword = request.getParameter("inputPasswordNew2");
            String AdminId = request.getParameter("AdminId");
            AdminService adminService = new AdminService();
            Admin admin = adminService.findById(AdminId);
            if(CPassword.equals(admin.getPassword())){
                //如果旧密码和库中一样就修改密码
                adminService.update(AdminId,NPassword);
                String msg = "密码修改成功";

                request.setAttribute("AdminId",AdminId);
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("/Admin/Admin.jsp").forward(request,response);
            }
            else{//如果和旧密码不一样，就返回修改密码失败
                String msg = "原先密码错误，修改失败";

                request.setAttribute("AdminId",AdminId);
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("/Admin/Admin.jsp").forward(request,response);
            }
        }
        /**
         * 重置用户密码
         * */
        else if("resetUserPassword".equals(para)){
            String UserId = request.getParameter("UserId");
            String password = "111111";
            UserService userService = new UserService();
            userService.updatePasswordById(UserId,password);

        }
        /**
         * 跳转到修改会议的页面
         * */
        else if("changeMeeting".equals(para)){
            String MeetingId = request.getParameter("MeetingId");
            String AdminId = request.getParameter("AdminId");

            request.setAttribute("MeetingId",MeetingId);
            request.setAttribute("AdminId",AdminId);
            request.getRequestDispatcher("/Admin/AdminChangeMeeting.jsp").forward(request,response);
        }
        /**
         * 保存修改的会议信息
         * */
        else if("saveChangeMeeting".equals(para)){
            String meetingId = request.getParameter("meetingId");
            String detail = request.getParameter("detail");
            String time = request.getParameter("time");
            String place = request.getParameter("place");

            MeetingInfoService meetingInfoService = new MeetingInfoService();
            Meeting meeting = meetingInfoService.findByPartOfUserId(meetingId).get(0);
            meeting.setDetail(detail);
            meeting.setTime(time);
            meeting.setPlace(place);
            out.print(meeting);
            meetingInfoService.update(meetingId,meeting);
        }
        /**
         * 查看参加会议的人员
         * */
        else if("searchUserInMeeting".equals(para)){
            String meetingId = request.getParameter("meetingId");
            String p = request.getParameter("p");
            String searchId = request.getParameter("searchId");

            request.setAttribute("meetingId",meetingId);
            request.setAttribute("p",p);
            request.setAttribute("searchId",searchId);
            request.getRequestDispatcher("/Admin/AdminSearchUserInMeeting.jsp").forward(request, response);
        }
        /**
         * 将某个用户从会议移除
         * */
        else if("deleteUserInMeeting".equals(para)){
            String userId = request.getParameter("userId");
            String meetingId = request.getParameter("meetingId");

            JoinMeetingService joinMeetingService = new JoinMeetingService();
            joinMeetingService.deleteByUserIdAndMeetingId(userId,meetingId);
        }
    }
}
