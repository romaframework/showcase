package org.romaframework.showcase.view.domain;

import org.romaframework.aspect.view.ViewConstants;
import org.romaframework.aspect.view.annotation.ViewField;
import org.romaframework.core.Roma;
import org.romaframework.frontend.domain.page.HomePageBasic;

public class HomePageAdmin extends HomePageBasic {

	@ViewField(render = ViewConstants.RENDER_OBJECTEMBEDDED, label = "")
	private ShowCaseHome home;

	public HomePageAdmin() {
		Roma.flow().forward(new Header(), "header");
		home = new ShowCaseHome();
	}

	@Override
	protected void fillPages() {
		super.fillPages();
	}

	public ShowCaseHome getHome() {
		return home;
	}

	public void setHome(ShowCaseHome home) {
		this.home = home;
	}
}