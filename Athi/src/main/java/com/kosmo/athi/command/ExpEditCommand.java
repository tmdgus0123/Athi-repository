package com.kosmo.athi.command;

import java.util.Map;

import org.springframework.ui.Model;

public class ExpEditCommand implements ICommand{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
	}
}
