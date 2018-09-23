package com.tjp.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tjp.dao.UserDao;

/**
 * Servlet implementation class UploadImgServlet
 */
public class UploadImgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadImgServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		String uid = (String) request.getSession().getAttribute("uid");
		if (method.equals("upload")) {
			// 上传图片作为头像
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List<FileItem> list = upload.parseRequest(request);
				for (FileItem item : list) {
					if (!item.isFormField()) {
						String imgName = item.getName();
						String fileName = uid + "-head" + imgName.substring(imgName.indexOf("."));
						String url = "D:/MyProgram/blog/WebContent/temp_img/" + fileName;
						InputStream in = item.getInputStream();
						OutputStream os = new FileOutputStream(url);
						byte[] b = new byte[1024];
						int len = 0;
						while ((len = in.read(b)) != -1) {
							os.write(b, 0, len);
							os.flush();
						}
						os.close();
						in.close();
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			response.setContentType("text/html;charset=utf-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().println("ok");
		} 
		if (method.equals("confirm")) {
			//前端上传图片点击确认后，将图片从temp_img存入head-img，并且将文件名存入数据库
			String fileName = uid + "-head.png";
			String url = "D:/MyProgram/blog/WebContent/temp_img/" + fileName;
			File file = new File(url);
			String desUrl = "D:/MyProgram/blog/WebContent/head-img/" + fileName;
			if (file.exists()) {
				InputStream in = new FileInputStream(file);
				OutputStream out = new FileOutputStream(desUrl);
				byte[] b = new byte[1024];
				int len;
				while ((len = in.read(b))!= -1) {
					out.write(b, 0, len);
					out.flush();
				}
				out.close();
				in.close();
				file.delete();
			}
			//将文件名存入数据库
			UserDao dao = new UserDao();
			dao.saveImg(uid, fileName);
		}
		if (method.equals("cancel")) {
			String fileName = uid + "-head.png";
			String url = "D:/MyProgram/blog/WebContent/temp_img/" + fileName;
			File file = new File(url);
			file.delete();
		}
		if (method.equals("show")) {
			String fileName = uid + "-head.png";
			String url = "D:/MyProgram/blog/WebContent/temp_img/" + fileName;
			InputStream in = new FileInputStream(url);
			response.setContentType("image/png");
			OutputStream out = response.getOutputStream();
			byte[] b = new byte[1024];
			int len;
			while ((len = in.read(b))!= -1) {
				out.write(b, 0, len);
				out.flush();
			}
			out.close();
			in.close();
		}
		if (method.equals("showAgain")) {
			String fileName = uid + "-head.png";
			String url = "D:/MyProgram/blog/WebContent/head-img/" + fileName;
			File file = new File(url);
			if (file.exists()) {
				InputStream in = new FileInputStream(file);
				response.setContentType("image/png");
				OutputStream out = response.getOutputStream();
				byte[] b = new byte[1024];
				int len;
				while ((len = in.read(b))!= -1) {
					out.write(b, 0, len);
					out.flush();
				}
				out.close();
				in.close();
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
