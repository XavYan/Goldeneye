const name = document.querySelector('form [name="name"]')
const surname = document.querySelector('form [name="surname"]')
const departmentSelector = document.querySelector('form [name="department"]')
const officeSelector = document.querySelector('form [name="office"]')

document.querySelector('form [name="office"]').addEventListener("change", event => {
    departmentSelector.value = departmentSelector.children[0].value

    document.querySelectorAll('form [name="department"] option').forEach(department => { department.setAttribute("hidden", true) })
    departmentsPerOffice[event.target.value].forEach (department => {
        document.querySelector('form [name="department"] option[value="' + department + '"]').removeAttribute("hidden")
    })
})

document.querySelector('form button[type="submit"]').addEventListener("click", event => {
    if (!name.value || !surname.value || !departmentSelector.value || !officeSelector.value) {
        document.querySelector('form #error-message').removeAttribute("hidden")
        event.preventDefault()
    }
})

function copyToClipboard () {
    const textToBeCopied = document.querySelector("#companyEmail").textContent
    navigator.clipboard.writeText(textToBeCopied)

    // Show clipboard-check icon only during 1 second
    toggleClipboardSuccess()
    setTimeout(() => {
        toggleClipboardSuccess()
    }, 1000)
}

function toggleClipboardSuccess () {
    const clipboard = document.querySelector('#clipboard-icon')
    const clipboardSuccess = document.querySelector('#clipboard-icon-success')

    if (clipboard.hasAttribute('hidden')) {
        clipboard.removeAttribute('hidden')
        clipboardSuccess.setAttribute('hidden', true)
    } else {
        clipboard.setAttribute('hidden', true)
        clipboardSuccess.removeAttribute('hidden')
    }
}