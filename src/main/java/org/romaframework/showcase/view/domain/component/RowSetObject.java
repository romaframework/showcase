package org.romaframework.showcase.view.domain.component;

public class RowSetObject {

	private Integer	rowSetId;
	private String	rowSetName;

	public RowSetObject(Integer rowSetId, String rowSetName) {
		super();
		this.rowSetId = rowSetId;
		this.rowSetName = rowSetName;
	}

	public Integer getRowSetId() {
		return rowSetId;
	}

	public void setRowSetId(Integer rowSetId) {
		this.rowSetId = rowSetId;
	}

	public String getRowSetName() {
		return rowSetName;
	}

	public void setRowSetName(String rowSetName) {
		this.rowSetName = rowSetName;
	}

}
