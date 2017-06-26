package kr.co.bit.project.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet{

	private HandlerMapping mappings = null;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String configName = config.getInitParameter("configName");
		mappings = new HandlerMapping(configName);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("���� ȣ��");
		
		String uri = req.getRequestURI();
		System.out.println("��û uri: "+uri);

		String project = req.getContextPath();  // ������Ʈ �̸�
		uri = uri.substring(project.length());
//		uri.replace(project, "");
		
		
		System.out.println("��û uri: "+uri);
		
		try {		
			// ��û ó���� ���� req, res �Ѱ���
			Controller controller = mappings.getController(uri);
			String callPage = controller.handleRequest(req, res);
			
			System.out.println(callPage);
			
			if(callPage!=null){
				RequestDispatcher dispatcher = req.getRequestDispatcher(callPage);
				dispatcher.forward(req, res);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
	}

	
}
