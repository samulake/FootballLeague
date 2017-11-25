package pw.dbapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import pw.dbapp.model.GoalDetails;
import pw.dbapp.model.Person;

@Repository
public interface GoalDetailsRepository extends JpaRepository<GoalDetails, Long> {

}




