package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.DatabaseErrorLog;

public interface DatabaseErrorLogRepository extends JpaRepository<DatabaseErrorLog, Long> {

}
