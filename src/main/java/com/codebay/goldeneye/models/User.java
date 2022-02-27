package com.codebay.goldeneye.models;

public class User {
    private String name;
    private String surname;
    private String office;
    private String department;
    private String companyEmail;

    public User(String name, String surname, String office, String department) {
        // Here you can easily add the code to send user info to the API and
        // cut any undesired characters out.
        this.name = name;
        this.surname = surname;
        this.office = office;
        this.department = department;
        this.companyEmail = generateCompanyEmail();
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getOffice() {
        return office;
    }

    public String getDepartment() {
        return department;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    private String generateCompanyEmail() {
        final String lowercaseName = name.toLowerCase();
        final String lowercaseSurname = surname.toLowerCase();
        return String.format("%c%s.%s@%s.goldeneye.com", lowercaseName.charAt(0), lowercaseSurname, department, office);
    }
}
