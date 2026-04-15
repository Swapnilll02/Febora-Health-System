package com.febora.model;

public class Doctor {

    private int id;
    private String name;
    private String specialization;
    private int experience;
    private String hospital;

    public String getName(){ return name; }
    public void setName(String name){ this.name=name; }

    public String getSpecialization(){ return specialization; }
    public void setSpecialization(String specialization){ this.specialization=specialization; }

    public int getExperience(){ return experience; }
    public void setExperience(int experience){ this.experience=experience; }

    public String getHospital(){ return hospital; }
    public void setHospital(String hospital){ this.hospital=hospital; }
}