<!DOCTYPE html>  
<html lang="en">  
    <head>
        <meta charset="UTF-8">
        <title>Goldeneye</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script defer src="/js/main.js"></script>
    </head>
    <body class="container">
        <h1>Goldeneye</h1>
        <div class="alert alert-primary" role="alert">
          Welcome to Goldeneye administration panel! This tool will help you to create a valid company email address.
          <br>
          Simply write down the user data, the office and department and click the 'Go' button.
        </div>
        <hr>
        <#if model["user"]?? >
            <div>
                <p class="d-inline-block">The company email address for ${model["user"].name} ${model["user"].surname} is: <b><span id="companyEmail">${model["user"].companyEmail}</span></b>.</p>
                <button onclick="copyToClipboard()" class="btn btn-outline-secondary btn-sm">
                    <i id="clipboard-icon" class="fa-regular fa-clipboard"></i>
                    <i id="clipboard-icon-success" hidden class="fa-solid fa-clipboard-check"></i>
                </button>
            </div>
            <p>Do you want to fulfill for another user?</p>
            <a href="/" class="btn btn-outline-success">Go again!</a>
        <#else>
            <form action="/" method="POST">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-control" name="name">
                </div>
                <div class="mb-3">
                    <label class="form-label">Surname</label>
                    <input type="text" class="form-control" name="surname">
                </div>
                <div class="mb-3">
                    <label class="form-label">Office</label>
                    <#list model["offices"]>
                        <select name="office" class="form-select">
                            <option selected hidden value="">Select an office</option>
                            <#items as office>
                                <option value="${office.getKeyword()}">${office.getText()}</option>
                            </#items>
                        </select>
                    </#list>
                </div>
                <div class="mb-3">
                    <label class="form-label">Department</label>
                    <#list model["departments"]>
                        <select name="department" class="form-select">
                            <option selected hidden value="">Select a department</option>
                            <option disabled>You need to select an office first</option>
                            <#items as department>
                                <option hidden value="${department.getKeyword()}">${department.getText()}</option>
                            </#items>
                        </select>
                    </#list>
                </div>
                <div id="error-message" hidden class="alert alert-danger" role="alert">
                  You need to <b>fill all fields</b> in order to generate the company email properly.
                </div>
                <button type="submit" class="btn btn-primary">Go!</button>
            </form>
        </#if>
    </body>
    <script>
        let departmentsPerOffice = {}
        <#list model["offices"] as office>
            departmentsPerOffice["${office.getKeyword()}"] = []
            <#list office.getDepartments() as department>
                departmentsPerOffice["${office.getKeyword()}"].push("${department.getKeyword()}")
            </#list>
        </#list>
    </script>
</html>