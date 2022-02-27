package com.codebay.goldeneye.enums;

import java.util.Arrays;
import java.util.List;

public enum Offices {
    MILAN("milan", "Milan", Arrays.asList(Departments.DESIGN, Departments.BUSINESS, Departments.ADVERTISING)),
    SPAIN("spain", "Spain", Arrays.asList(Departments.RESEARCH_AND_DEVELOPMENT, Departments.BUSINESS)),
    NEW_YORK("new-york", "New York", Arrays.asList(Departments.BUSINESS, Departments.ADVERTISING));

    private String keyword;
    private String text;
    private List<Departments> departments;

    Offices(String keyword, String text, List<Departments> departments) {
        this.keyword = keyword;
        this.text = text;
        this.departments = departments;
    }

    public String getKeyword() {
        return keyword;
    }

    public String getText() {
        return text;
    }

    public List<Departments> getDepartments() {
        return departments;
    }
}
