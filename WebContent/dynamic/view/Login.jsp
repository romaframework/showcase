<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/roma.tld" prefix="roma"%>
<%@ page buffer="none"%>

<%@page import="org.romaframework.core.config.ApplicationConfiguration"%>
<%@page import="org.romaframework.core.*"%>

<%
	String appName = Utility.getCapitalizedString(Roma.component(ApplicationConfiguration.class).getApplicationName());
%>



<div class="container">
	<div class="row">
		<div class="box span5 offset3">
			<h1>
				<a style="text-decoration: none"
					href='<%=request.getContextPath()%>/app/direct/home'><%=appName%></a>
			</h1>
			<roma:class />
		</div>
	</div>
</div>
