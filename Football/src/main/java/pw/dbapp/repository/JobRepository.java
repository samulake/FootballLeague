package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Job;

public interface JobRepository extends JpaRepository<Job, Long> {

}
