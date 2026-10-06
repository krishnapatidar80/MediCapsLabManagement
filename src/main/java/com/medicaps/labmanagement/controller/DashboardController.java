package com.medicaps.labmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.medicaps.labmanagement.service.LaboratoryService;

@Controller
public class DashboardController {

    private final LaboratoryService laboratoryService;


    public DashboardController(
            LaboratoryService laboratoryService) {

        this.laboratoryService =
                laboratoryService;
    }


    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        model.addAttribute(
                "totalLaboratories",
                laboratoryService.getLaboratoryCount()
        );


        model.addAttribute(
                "activeLaboratories",
                laboratoryService
                        .getActiveLaboratoryCount()
        );


        model.addAttribute(
                "maintenanceLaboratories",
                laboratoryService
                        .getMaintenanceLaboratoryCount()
        );


        model.addAttribute(
                "totalCapacity",
                laboratoryService
                        .getTotalCapacity()
        );


        return "dashboard/dashboard";
    }
}