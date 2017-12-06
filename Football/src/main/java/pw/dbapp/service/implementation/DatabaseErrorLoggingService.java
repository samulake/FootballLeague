package pw.dbapp.service.implementation;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pw.dbapp.model.DatabaseErrorLog;
import pw.dbapp.repository.DatabaseErrorLogRepository;

@Service
public class DatabaseErrorLoggingService {
	@Autowired
	private DatabaseErrorLogRepository errorLoggingDAO;
	
	public void logError(String errorMessage) {
		DatabaseErrorLog log = new DatabaseErrorLog();
		log.setDescription(errorMessage);
		log.setErrorOccurred(new Date());
		errorLoggingDAO.save(log);
	}
}
