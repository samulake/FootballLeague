package pw.dbapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import pw.dbapp.model.Person;

public interface GoalDetailsRepository extends JpaRepository<Person, Long> {
	@Query(value = "select p.id, sum(CASE WHEN p.id = g.scorer_id then 1 else 0 end) as goalsScored, sum(CASE WHEN p.id = g.assistant_id then 1 else 0 end) as assists from people p left join goals_details g ON p.id = g.scorer_id OR p.id = g.assistant_id group by p.id having sum(CASE WHEN p.id = g.scorer_id then 1 else 0 end) > 0 order by goalsScored desc, assists desc", nativeQuery=true)
	List<Person> findBestScorers();
}




