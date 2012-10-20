<%@page import="org.romaframework.aspect.view.html.component.HtmlViewInvisibleContentComponent"%>
<%@page import="org.romaframework.aspect.view.html.constants.TransformerConstants"%>
<%@page import="org.romaframework.aspect.view.html.component.HtmlViewConfigurableEntityForm"%>
<%@page import="org.romaframework.aspect.view.html.transformer.jsp.directive.JspTransformerHelper"%>
<%@page import="org.romaframework.aspect.view.html.area.HtmlViewRenderable"%>
<%@page import="org.romaframework.aspect.view.html.transformer.helper.JaniculumWrapper"%>
<%@page import="org.romaframework.aspect.view.html.transformer.jsp.JspTransformer"%>
<%@page import="org.romaframework.aspect.view.html.constants.RequestConstants"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="org.romaframework.aspect.view.html.area.HtmlViewRenderable"%>
<%@page import="org.romaframework.aspect.view.html.constants.RequestConstants"%>
<%
	
	HtmlViewRenderable component = (HtmlViewRenderable)request.getAttribute(RequestConstants.CURRENT_COMPONENT_IN_TRANSFORMER);
	
	String part = (String) request.getAttribute(RequestConstants.CURRENT_COMPONENT_PART_IN_TRANSFORMER);

%>
<div id="<%=JaniculumWrapper.id(component, null)%>" class="<%=JaniculumWrapper.cssClass(component, "tab", null)%>" style="<%=JaniculumWrapper.inlineStyle(component, null)%>">
	<div id="<%=JaniculumWrapper.id(component, "tabs")%>" class="<%=JaniculumWrapper.cssClass(component, "tab", "tabs")%> ui-tabs-nav">
		<ul class="nav nav-tabs uitab">
		<%
			String selected_id ="";
			boolean empty = true;
			int childIndex = 0;
			String currentClass = "";
			for(Object c:JaniculumWrapper.getChildren(component) ){
				HtmlViewRenderable child = (HtmlViewRenderable) c;
				empty = false;
				if(JaniculumWrapper.isSelected(component, childIndex)){
					currentClass = "ui-tabs-selected active";
					selected_id =""+childIndex;
				}
				String childLabel = "";
				if(child instanceof HtmlViewConfigurableEntityForm){
					childLabel = ((HtmlViewConfigurableEntityForm)child).getLabel();
				}else if(child instanceof HtmlViewInvisibleContentComponent){
					childLabel = ((HtmlViewInvisibleContentComponent)child).getLabel();
				}
		%>
				<li class="<%=currentClass%>" onclick="changeTab(<%=JaniculumWrapper.fieldName(component)%>,<%=childIndex%>)"><a href="javascript:void(0)"><%=childLabel%></a></li>
			<%
				currentClass = "";
				childIndex++;
			} %>
		</ul>
	</div>
	<input type="hidden" id="<%=JaniculumWrapper.id(component, null)%>_selected" name="<%=JaniculumWrapper.fieldName(component)%>" value="<%=JaniculumWrapper.fieldName(component)%>_<%=selected_id%>"  />

	<div class="tab-content">
<%	
	childIndex = 0;
	for(Object c:JaniculumWrapper.getChildren(component) ){
		HtmlViewRenderable child = (HtmlViewRenderable) c;
	
		if((JaniculumWrapper.isSelected(component, childIndex))){
			currentClass = "ui-tabs-panel tab-pane active";
		}else{
			currentClass = "ui-tabs-panel ui-tabs-hide tab-pane";
		}
	 %>

		<div class="<%=currentClass%>" ><% JspTransformerHelper.delegate(child, null,pageContext.getOut()); %></div>
	<%
		childIndex++;
	} %>
	</div>
</div>
<%if(!empty && "".equals(selected_id)){

	JspTransformerHelper.addJs(JaniculumWrapper.id(component, TransformerConstants.PART_ALL), "changeTab("+JaniculumWrapper.fieldName(component)+", "+JaniculumWrapper.selectedIndexesAsString(component)+");");
}
%>