package org.romaframework.showcase.view.domain;

import org.romaframework.aspect.view.annotation.ViewClass;
import org.romaframework.core.Roma;

public class HomePage {

	public HomePage() {
		Roma.flow().forward(new Header(),"header");
	}

}
