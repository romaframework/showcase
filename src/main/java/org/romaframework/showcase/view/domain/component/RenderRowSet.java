package org.romaframework.showcase.view.domain.component;

import java.util.ArrayList;
import java.util.List;

import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;
import org.romaframework.aspect.view.feature.ViewFieldFeatures;
import org.romaframework.core.Roma;

public class RenderRowSet {

	@ViewField(render = ViewConstants.RENDER_ROWSET, label = "")
	private List<RowSetObject>	objects	= new ArrayList<RowSetObject>();

	public RenderRowSet(String render) {
		initData();
		Roma.setFeature(this, "objects", ViewFieldFeatures.RENDER, render);
	}

	private void initData() {
		for (int i = 0; i < 10; i++) {
			objects.add(new RowSetObject(i, "Riga"));
		}
	}

	public List<RowSetObject> getObjects() {
		return objects;
	}

	public void setObjects(List<RowSetObject> objects) {
		this.objects = objects;
	}
}
