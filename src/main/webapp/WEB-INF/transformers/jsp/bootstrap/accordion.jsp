<%@page
	import="org.romaframework.aspect.view.html.component.HtmlViewInvisibleContentComponent"%>
<%@page
	import="org.romaframework.aspect.view.html.constants.TransformerConstants"%>
<%@page
	import="org.romaframework.aspect.view.html.component.HtmlViewConfigurableEntityForm"%>
<%@page
	import="org.romaframework.aspect.view.html.transformer.jsp.directive.JspTransformerHelper"%>
<%@page
	import="org.romaframework.aspect.view.html.area.HtmlViewRenderable"%>
<%@page
	import="org.romaframework.aspect.view.html.transformer.helper.JaniculumWrapper"%>
<%@page
	import="org.romaframework.aspect.view.html.transformer.jsp.JspTransformer"%>
<%@page
	import="org.romaframework.aspect.view.html.constants.RequestConstants"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="org.romaframework.aspect.view.html.area.HtmlViewRenderable"%>
<%@page
	import="org.romaframework.aspect.view.html.constants.RequestConstants"%>
<%
	HtmlViewRenderable component = (HtmlViewRenderable) request
			.getAttribute(RequestConstants.CURRENT_COMPONENT_IN_TRANSFORMER);

	String part = (String) request
			.getAttribute(RequestConstants.CURRENT_COMPONENT_PART_IN_TRANSFORMER);
%>
<div id="<%=JaniculumWrapper.id(component, null)%>"
	class="<%=JaniculumWrapper.cssClass(component, "accordion", null)%>"
	style="<%=JaniculumWrapper.inlineStyle(component, null)%>">
	<div id="<%=JaniculumWrapper.id(component, "accordions")%>"
		class="accordion <%=JaniculumWrapper.cssClass(component, "accordion",
					"accordions")%> ">
		<%
			String selected_id = "";
			boolean empty = true;
			int childIndex = 0;
			String currentClass = "";
			for (Object c : JaniculumWrapper.getChildren(component)) {
				HtmlViewRenderable child = (HtmlViewRenderable) c;
				empty = false;
				if (JaniculumWrapper.isSelected(component, childIndex)) {
					currentClass = "ui-tabs-selected active";
					selected_id = "" + childIndex;
				}
				String childLabel = "";
				if (child instanceof HtmlViewConfigurableEntityForm) {
					childLabel = ((HtmlViewConfigurableEntityForm) child)
							.getLabel();
				} else if (child instanceof HtmlViewInvisibleContentComponent) {
					childLabel = ((HtmlViewInvisibleContentComponent) child)
							.getLabel();
				}
				String currId = JaniculumWrapper.id(component, null) + "_"
						+ childIndex + "header";
		%>
		<div class="<%=currentClass%> accordion-group" onclick="">
			<div class="accordion-heading">
				<a class="accordion-toggle" data-toggle="collapse"
					data-parent="<%=JaniculumWrapper.id(component, "accordions")%>"
					href="#<%=currId%>"><%=childLabel%></a>
			</div>
			<div id="<%=currId%>" class="accordion-body collapse in">
				<div class="accordion-inner">
					<%
						JspTransformerHelper
									.delegate(child, null, pageContext.getOut());
					%>
				</div>
			</div>
			<%
				currentClass = "";
					childIndex++;
				}
			%>
		</div>
	</div>
</div>