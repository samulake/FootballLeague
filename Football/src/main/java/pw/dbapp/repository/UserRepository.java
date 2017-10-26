package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
