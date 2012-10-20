<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/roma.tld" prefix="roma"%>
<%@ page buffer="none"%>
<%@page import="org.romaframework.core.*"%>
<%@page import="org.romaframework.core.schema.SchemaHelper"%>
<%@page import="org.romaframework.aspect.session.*"%>
<%@page import="org.romaframework.aspect.i18n.*"%>
<%@page import="org.romaframework.core.config.ApplicationConfiguration"%>
<%@page
	import="org.romaframework.aspect.authentication.AuthenticationAspect"%>
<%
	String appName = Utility.getCapitalizedString(Roma.component(ApplicationConfiguration.class).getApplicationName());
	SessionInfo sess = Roma.session().getActiveSessionInfo();
%>
<div class="navbar navbar-fixed-top navbar-inverse">

	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="brand" href="javascript:void(0)"><%=appName%></a>

			<ul class="nav pull-right">
				<li class="dropdown"><a href="#" data-toggle="dropdown"
					class="dropdown-toggle"><i class="icon-user"></i><%=sess.getAccount()%>
						<b class="caret"></b></a>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownMenu">
						<li><roma:action name="home" /></li>
						<li><roma:action name="changePassword" /></li>
						<li><roma:action name="controlPanel" /></li>
						<li><a
							href="<%=request.getContextPath()%>/dynamic/logout.jsp"
							title="logout">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
