package org.romaframework.showcase.view.domain.component;

import java.util.ArrayList;
import java.util.List;

import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;
import org.romaframework.aspect.view.feature.ViewFieldFeatures;
import org.romaframework.core.Roma;
import org.romaframework.showcase.domain.entity.Person;

public class Table {

	@ViewField(render = ViewConstants.RENDER_TABLE, label = "")
	private List<Person>	persons;

	public Table() {
		initData();
	}

	private void initData() {
		persons = new ArrayList<Person>();
		for (int i = 0; i < 15; i++) {
			Person p = new Person();
			p.setId(new Long(i));
			p.setName("Name " + i);
			p.setSurname("Surname " + i);
			persons.add(p);
		}
	}

	public List<Person> getPersons() {
		return persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

	public void edit() {
		Roma.setFeature(this, "persons", ViewFieldFeatures.RENDER, ViewConstants.RENDER_TABLEEDIT);
	}
}
