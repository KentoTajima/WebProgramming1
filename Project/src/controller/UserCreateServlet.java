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
 * Servlet implementation class UserCreateServlet
 */
@WebServlet("/UserCreateServlet")
public class UserCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreateServlet() {
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
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
		dispatcher.forward(request, response);

	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        // リクエストパラメータの文字コードを指定
        request.setCharacterEncoding("UTF-8");



		// リクエストパラメータの入力項目を取得
		String loginId = request.getParameter("loginId");
		String name = request.getParameter("name");
		String birthDate = request.getParameter("birthDate");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");


		UserDao userDao = new UserDao();
		User user = userDao.findByLoginId(loginId);


		 if(loginId.equals("")||name.equals("")||birthDate.equals("")||password.equals("")||password2.equals("")) {
			request.setAttribute("errMsg", "入力されてない箇所がありました");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
			dispatcher.forward(request, response);
			return;
		 }

		 else if (user != null) {
        	request.setAttribute("errMsg", "入力された内容は既に存在しています");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
			dispatcher.forward(request, response);
			return;

		}

		else if(!password.equals(password2)) {
			request.setAttribute("errMsg", "パスワードが異なります");
			// ログインjspにフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/userCreate.jsp");
			dispatcher.forward(request, response);
			return;


		}else {
			  user = userDao.insert(loginId,name,birthDate, password);
				// ユーザ一覧のサーブレットにリダイレクト
				response.sendRedirect("UserListServlet");
		}

	}


}

