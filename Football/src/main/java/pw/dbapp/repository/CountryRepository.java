package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Country;

public interface CountryRepository extends JpaRepository<Country, String> {

}
