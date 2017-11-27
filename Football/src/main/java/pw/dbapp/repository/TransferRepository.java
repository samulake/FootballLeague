package pw.dbapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pw.dbapp.model.Transfer;

public interface TransferRepository extends JpaRepository<Transfer, Long> {

}
