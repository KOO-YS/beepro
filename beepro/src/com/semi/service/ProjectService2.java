package com.semi.service;


import java.util.ArrayList;
import java.util.List;

import com.semi.dao.ProjectDao;
import com.semi.dao.ProjectDaoImple;

public class ProjectService2 {
	ProjectDao projectDao = new ProjectDaoImple();
	public List<String> getMember(int projectSeq) {
		String memStr = projectDao.selectAllMember(projectSeq);
		String[] mem = memStr.split(",");
		List<String> member = new ArrayList<String>();
		for(int i=0; i<mem.length; i++) {
			member.add(mem[i]);
		}
		return member;
	}

}
