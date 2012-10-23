package org.romaframework.showcase.view.domain;

import java.util.HashMap;
import java.util.Map;

import org.romaframework.aspect.core.annotation.AnnotationConstants;
import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;
import org.romaframework.showcase.view.domain.component.Accordion;
import org.romaframework.showcase.view.domain.component.Form;
import org.romaframework.showcase.view.domain.component.RenderRowSet;
import org.romaframework.showcase.view.domain.component.Table;
import org.romaframework.showcase.view.domain.menu.BackOfficeMenu;

public class ShowCaseHome {

	@ViewField(render = ViewConstants.RENDER_TAB, selectionField = "selected", label = "")
	private Map<String, Object> tabs = new HashMap<String, Object>();
	@ViewField(visible = AnnotationConstants.FALSE)
	private Object selected;

	public ShowCaseHome() {
		tabs.put("Form", new Form());
		tabs.put("Table", new Table());
		tabs.put("Menu", new BackOfficeMenu());
		tabs.put("Accordion", new Accordion());
		tabs.put("Rowset", new RenderRowSet(ViewConstants.RENDER_ROWSET));
		tabs.put("Colset", new RenderRowSet(ViewConstants.RENDER_COLSET));
	}

	public Map<String, Object> getTabs() {
		return tabs;
	}

	public void setTabs(Map<String, Object> tabs) {
		this.tabs = tabs;
	}

	public void setSelected(Object selected) {
		this.selected = selected;
	}

	public Object getSelected() {
		return selected;
	}
}
