package org.project.properties;

import java.beans.PropertyEditorSupport;

public class TeamNameEditor extends PropertyEditorSupport {

	@Override
	public void setAsText(String teamName) throws IllegalArgumentException {
		if(teamName.contains("FC")) {
			setValue(teamName);
		} else setValue("FC " + teamName);
	}
	
}
