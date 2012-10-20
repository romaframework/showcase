package org.romaframework.showcase.view.domain.component;

import java.util.Date;

import org.romaframework.aspect.core.annotation.AnnotationConstants;
import org.romaframework.aspect.core.annotation.CoreClass;
import org.romaframework.aspect.validation.CustomValidation;
import org.romaframework.aspect.validation.ValidationException;
import org.romaframework.aspect.validation.annotation.ValidationAction;
import org.romaframework.aspect.validation.annotation.ValidationField;
import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;
import org.romaframework.core.Roma;
import org.romaframework.frontend.domain.message.MessageOk;

@CoreClass(orderFields = "name surname description email")
public class Form implements CustomValidation {

	@ValidationField(required = AnnotationConstants.TRUE)
	private String	name;
	@ValidationField(required = AnnotationConstants.TRUE)
	private String	surname;
	@ValidationField(required = AnnotationConstants.TRUE)
	private String	email;

	private Date		date;

	@ViewField(render = ViewConstants.RENDER_TEXTAREA)
	private String	description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@ValidationAction(validate = AnnotationConstants.TRUE)
	public void save() {
		Roma.flow().popup(new MessageOk("dica", "Messaggio", null, "Oggetto salvato correttamente"));
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void discard() {
		setEmail(null);
		setName(null);
		setSurname(null);
		setDescription(null);
		Roma.fieldChanged(this, "name", "surname", "email", "description");
	}

	public void validate() throws ValidationException {

	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
