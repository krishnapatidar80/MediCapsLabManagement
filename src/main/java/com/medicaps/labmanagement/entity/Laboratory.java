package com.medicaps.labmanagement.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "laboratories")
public class Laboratory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Laboratory code is required.")
    @Size(max = 50, message = "Laboratory code cannot exceed 50 characters.")
    @Column(nullable = false, unique = true, length = 50)
    private String labCode;

    @NotBlank(message = "Laboratory name is required.")
    @Size(max = 150, message = "Laboratory name cannot exceed 150 characters.")
    @Column(nullable = false, length = 150)
    private String labName;

    @NotBlank(message = "Building is required.")
    @Size(max = 100, message = "Building cannot exceed 100 characters.")
    @Column(nullable = false, length = 100)
    private String building;

    @NotBlank(message = "Room number is required.")
    @Size(max = 50, message = "Room number cannot exceed 50 characters.")
    @Column(nullable = false, length = 50)
    private String roomNumber;

    @Min(value = 0, message = "Floor number cannot be negative.")
    private Integer floorNumber;

    @NotNull(message = "Capacity is required.")
    @Min(value = 1, message = "Capacity must be at least 1.")
    @Column(nullable = false)
    private Integer capacity;

    @Size(max = 150, message = "Lab in-charge name cannot exceed 150 characters.")
    @Column(length = 150)
    private String labInCharge;

    @NotBlank(message = "Status is required.")
    @Column(nullable = false, length = 30)
    private String status;

    @Size(max = 1000, message = "Description cannot exceed 1000 characters.")
    @Column(length = 1000)
    private String description;

    @Size(max = 500, message = "Video URL cannot exceed 500 characters.")
    @Column(length = 500)
    private String videoUrl;

    @Size(max = 500, message = "Image URL cannot exceed 500 characters.")
    @Column(length = 500)
    private String imageUrl;

    @Column(nullable = false)
    private Boolean active = true;


    public Laboratory() {
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getLabCode() {
        return labCode;
    }

    public void setLabCode(String labCode) {
        this.labCode = labCode;
    }


    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName;
    }


    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }


    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }


    public Integer getFloorNumber() {
        return floorNumber;
    }

    public void setFloorNumber(Integer floorNumber) {
        this.floorNumber = floorNumber;
    }


    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }


    public String getLabInCharge() {
        return labInCharge;
    }

    public void setLabInCharge(String labInCharge) {
        this.labInCharge = labInCharge;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }


    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }


    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}

