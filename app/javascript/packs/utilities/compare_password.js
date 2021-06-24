document.addEventListener('turbolinks:load', () => {
    const control = document.getElementById('user_password_confirmation')

    if (control) { control.addEventListener('input', checkPass) }
});

function checkPass() {
    let pass1 = document.getElementById("user_password");
    let pass2 = document.getElementById("user_password_confirmation");
    let mismatchNotification = document.querySelector(".mismatch-notification");

    const goodColor = "#66cc66";
    const badColor = "#ff6666";

    function inputsStyles(color) {
        pass1.style.backgroundColor = color;
        pass2.style.backgroundColor = color;
    }

    if (pass1.value === pass2.value) {
        inputsStyles(goodColor)
        mismatchNotification.classList.add('hide')
    } else {
        inputsStyles(badColor);
        mismatchNotification.classList.remove('hide')
    }

    if (pass2.value === 0 || pass1.value === 0) {
        inputsStyles('transparent')
        mismatchNotification.classList.remove('hide')
    }
}
