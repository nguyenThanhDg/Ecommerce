/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dev.configs;

import com.dev.utils.GoogleConfig;
import com.dev.pojo.Google;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 * @author heaty566
 */
//@WebServlet(urlPatterns = { "/" })
public class LoginGoogleHandler extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	public static void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            if (request.getParameter("code") != null){
                String code = request.getParameter("code");
		String accessToken = getToken(code);
		          Google user = getUserInfo(accessToken);
		System.out.println(user + "dayne");
            }
		
	}

	public static String getToken(String code) throws ClientProtocolException, IOException {
		// call api to get token
		String response = Request.Post(GoogleConfig.GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GoogleConfig.GOOGLE_CLIENT_ID)
						.add("client_secret", GoogleConfig.GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", GoogleConfig.GOOGLE_REDIRECT_URI).add("code", code)
						.add("grant_type", GoogleConfig.GOOGLE_GRANT_TYPE).build())
				.execute().returnContent().asString();

		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}

	public static Google getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
		String link = GoogleConfig.GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();

		Google googlePojo = new Gson().fromJson(response, Google.class);

		return googlePojo;
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the +
	// sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}