package com.codebay.goldeneye.enums;

public enum Departments {
    DESIGN("design", "Design"),
    BUSINESS("business", "Business"),
    ADVERTISING("advertising", "Advertising"),
    RESEARCH_AND_DEVELOPMENT("research-and-development", "Research and Development");

    private String keyword;
    private String text;

    Departments(String keyword, String text) {
        this.keyword = keyword;
        this.text = text;
    }

    public String getKeyword() {
        return keyword;
    }

    public String getText() {
        return text;
    }
}
