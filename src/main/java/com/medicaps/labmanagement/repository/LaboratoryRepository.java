package com.medicaps.labmanagement.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.medicaps.labmanagement.entity.Laboratory;

public interface LaboratoryRepository
        extends JpaRepository<Laboratory, Long> {

    Optional<Laboratory> findByLabCode(String labCode);

    boolean existsByLabCode(String labCode);

    boolean existsByLabCodeAndIdNot(String labCode, Long id);
}

