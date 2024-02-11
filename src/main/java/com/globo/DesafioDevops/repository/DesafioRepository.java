package com.globo.DesafioDevops.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.globo.DesafioDevops.model.Desafio;

@Repository

public interface DesafioRepository extends JpaRepository<Desafio, Long> {

}