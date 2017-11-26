package pw.dbapp.service.implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.Match;
import pw.dbapp.repository.MatchRepository;
import pw.dbapp.service.logic.MatchServiceLogic;

@Service
public class MatchService implements MatchServiceLogic {
	@Autowired
	private MatchRepository matchDAO;
	
	@Override
	public Match addMatch(Match match) {
		return matchDAO.save(match);
	}

}
