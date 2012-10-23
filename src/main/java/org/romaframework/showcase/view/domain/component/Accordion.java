package org.romaframework.showcase.view.domain.component;

import java.util.HashMap;
import java.util.Map;

import org.romaframework.aspect.core.annotation.AnnotationConstants;
import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;

public class Accordion {

	@ViewField(render = ViewConstants.RENDER_ACCORDION, selectionField = "selected", label = "")
	private Map<String, Object> tabs = new HashMap<String, Object>();

	public Accordion() {
		tabs.put("Accordion 1", new Form());
		tabs.put("Accordion 2", new Form());
	}

	@ViewField(visible = AnnotationConstants.FALSE)
	private Object selected;

	public Map<String, Object> getTabs() {
		return tabs;
	}

	public void setTabs(Map<String, Object> tabs) {
		this.tabs = tabs;
	}

	public Object getSelected() {
		return selected;
	}

	public void setSelected(Object selected) {
		this.selected = selected;
	}

}
