package com.medicaps.labmanagement.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.medicaps.labmanagement.entity.Laboratory;
import com.medicaps.labmanagement.repository.LaboratoryRepository;

@Service
public class LaboratoryService {

    private final LaboratoryRepository laboratoryRepository;


    public LaboratoryService(
            LaboratoryRepository laboratoryRepository) {

        this.laboratoryRepository =
                laboratoryRepository;
    }


    public List<Laboratory> getAllLaboratories() {

        return laboratoryRepository.findAll();
    }


    public Optional<Laboratory> getLaboratoryById(Long id) {

        return laboratoryRepository.findById(id);
    }


    public boolean isLabCodeExists(String labCode) {

        return laboratoryRepository
                .existsByLabCode(labCode);
    }


    public boolean isLabCodeExistsForAnotherLaboratory(
            String labCode,
            Long id) {

        return laboratoryRepository
                .existsByLabCodeAndIdNot(
                        labCode,
                        id
                );
    }


    public Laboratory saveLaboratory(
            Laboratory laboratory) {

        return laboratoryRepository
                .save(laboratory);
    }


    public Laboratory updateLaboratory(
            Laboratory laboratory) {

        return laboratoryRepository
                .save(laboratory);
    }


    public void deleteLaboratory(Long id) {

        laboratoryRepository
                .deleteById(id);
    }


    public long getLaboratoryCount() {

        return laboratoryRepository.count();
    }


    public long getActiveLaboratoryCount() {

        return laboratoryRepository
                .findAll()
                .stream()
                .filter(lab ->
                        "Active".equalsIgnoreCase(
                                lab.getStatus()
                        )
                )
                .count();
    }


    public long getMaintenanceLaboratoryCount() {

        return laboratoryRepository
                .findAll()
                .stream()
                .filter(lab ->
                        "Maintenance".equalsIgnoreCase(
                                lab.getStatus()
                        )
                )
                .count();
    }


    public int getTotalCapacity() {

        return laboratoryRepository
                .findAll()
                .stream()
                .filter(lab ->
                        lab.getCapacity() != null
                )
                .mapToInt(
                        Laboratory::getCapacity
                )
                .sum();
    }
}

