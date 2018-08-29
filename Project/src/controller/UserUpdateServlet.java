package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	HttpSession session = request.getSession();
		if(session.getAttribute("userInfo")==null){
			response.sendRedirect("LoginServlet");
			return;
		}
    	// URLからGETパラメータとしてIDを受け取る
		String id = request.getParameter("id");

		// 確認用：idをコンソールに出力
		System.out.println(id);

		// TODO  未実装：ユーザ情報をリクエストスコープにセットしてjspにフォワード
		UserDao userDao = new UserDao();
		User user = userDao.find(id);
		request.setAttribute("user", user);
		request.setAttribute("id", id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
		dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        // リクエストパラメータの文字コードを指定
        request.setCharacterEncoding("UTF-8");

		// リクエストパラメータの入力項目を取得
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String id = request.getParameter("id");
		System.out.println(id);

		if(name.equals("")||birthDate.equals("")) {
			UserDao userDao = new UserDao();
			User user = userDao.find(id);
			request.setAttribute("errMsg", "入力されてない箇所がありました");
			request.setAttribute("user", user);
			request.setAttribute("id", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
			dispatcher.forward(request, response);
			return;
		 }else if(!password.equals(password2)) {
			UserDao userDao = new UserDao();
			User user = userDao.find(id);
			request.setAttribute("errMsg", "パスワードが異なります");
			request.setAttribute("user", user);
			request.setAttribute("id", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userUpdate.jsp");
			dispatcher.forward(request, response);
			return;
		 }else if(password.equals("")&&password2.equals("")) {
			 UserDao userDao = new UserDao();
			 User user = userDao.update2(name,birthDate,id);
			    response.sendRedirect("UserListServlet");
		 }else{
			UserDao userDao = new UserDao();
		    User user = userDao.update(name,birthDate,password,id);
		    response.sendRedirect("UserListServlet");

		 }

    }
}
