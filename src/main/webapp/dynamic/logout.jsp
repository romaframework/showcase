<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="org.romaframework.core.flow.*"%>
<%@page import="org.romaframework.aspect.session.*"%>
<%@page import="org.romaframework.aspect.i18n.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.romaframework.core.Roma"%>
<%@page import="org.romaframework.web.view.HttpUtils"%><html
	xmlns="http://www.w3.org/1999/xhtml">
<%
	HttpUtils.noCache(response);
    Roma.session().invalidateSession(session);
    response.sendRedirect(request.getContextPath()+"/app");
%>

