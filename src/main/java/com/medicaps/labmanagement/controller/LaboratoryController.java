package com.medicaps.labmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.medicaps.labmanagement.entity.Laboratory;
import com.medicaps.labmanagement.service.LaboratoryService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/laboratories")
public class LaboratoryController {

    private final LaboratoryService laboratoryService;


    public LaboratoryController(
            LaboratoryService laboratoryService) {

        this.laboratoryService =
                laboratoryService;
    }


    @GetMapping
    public String laboratories(Model model) {

        model.addAttribute(
                "laboratories",
                laboratoryService.getAllLaboratories()
        );

        model.addAttribute(
                "laboratory",
                new Laboratory()
        );

        return "laboratories/laboratories";
    }


    @PostMapping("/save")
    public String saveLaboratory(
            @Valid
            @ModelAttribute("laboratory")
            Laboratory laboratory,

            BindingResult bindingResult,

            Model model,

            RedirectAttributes redirectAttributes) {


        /*
         * Validation errors
         */

        if (bindingResult.hasErrors()) {

            model.addAttribute(
                    "laboratories",
                    laboratoryService
                            .getAllLaboratories()
            );

            model.addAttribute(
                    "validationError",
                    "Please correct the highlighted fields."
            );

            return "laboratories/laboratories";
        }


        /*
         * Duplicate Laboratory Code
         */

        if (laboratoryService.isLabCodeExists(
                laboratory.getLabCode())) {

            model.addAttribute(
                    "laboratories",
                    laboratoryService
                            .getAllLaboratories()
            );

            model.addAttribute(
                    "duplicateCodeError",
                    "Laboratory code already exists."
            );

            return "laboratories/laboratories";
        }


        laboratoryService.saveLaboratory(
                laboratory
        );


        redirectAttributes.addFlashAttribute(
                "successMessage",
                "Laboratory added successfully."
        );


        return "redirect:/laboratories";
    }


    @GetMapping("/edit/{id}")
    public String editLaboratory(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttributes) {


        return laboratoryService
                .getLaboratoryById(id)

                .map(laboratory -> {

                    model.addAttribute(
                            "laboratory",
                            laboratory
                    );

                    return "laboratories/edit-laboratory";
                })

                .orElseGet(() -> {

                    redirectAttributes.addFlashAttribute(
                            "errorMessage",
                            "Laboratory not found."
                    );

                    return "redirect:/laboratories";
                });
    }


    @PostMapping("/update")
    public String updateLaboratory(
            @Valid
            @ModelAttribute("laboratory")
            Laboratory laboratory,

            BindingResult bindingResult,

            Model model,

            RedirectAttributes redirectAttributes) {


        /*
         * Validation errors
         */

        if (bindingResult.hasErrors()) {

            return "laboratories/edit-laboratory";
        }


        /*
         * Duplicate Laboratory Code
         */

        if (laboratoryService
                .isLabCodeExistsForAnotherLaboratory(
                        laboratory.getLabCode(),
                        laboratory.getId()
                )) {

            model.addAttribute(
                    "duplicateCodeError",
                    "Laboratory code already exists."
            );

            return "laboratories/edit-laboratory";
        }


        laboratoryService.updateLaboratory(
                laboratory
        );


        redirectAttributes.addFlashAttribute(
                "successMessage",
                "Laboratory updated successfully."
        );


        return "redirect:/laboratories";
    }


    @PostMapping("/delete/{id}")
    public String deleteLaboratory(
            @PathVariable Long id,
            RedirectAttributes redirectAttributes) {


        try {

            laboratoryService.deleteLaboratory(id);

            redirectAttributes.addFlashAttribute(
                    "successMessage",
                    "Laboratory deleted successfully."
            );

        } catch (Exception e) {

            redirectAttributes.addFlashAttribute(
                    "errorMessage",
                    "Laboratory could not be deleted."
            );
        }


        return "redirect:/laboratories";
    }


    @GetMapping("/{id}")
    public String laboratoryDetails(
            @PathVariable Long id,
            Model model,
            RedirectAttributes redirectAttributes) {


        return laboratoryService
                .getLaboratoryById(id)

                .map(laboratory -> {

                    model.addAttribute(
                            "laboratory",
                            laboratory
                    );

                    return "laboratories/laboratory-details";
                })

                .orElseGet(() -> {

                    redirectAttributes.addFlashAttribute(
                            "errorMessage",
                            "Laboratory not found."
                    );

                    return "redirect:/laboratories";
                });
    }
}

