document.addEventListener('turbolinks:load', () => {
    let elements = document.querySelectorAll('.form-inline-link')

    elements.forEach(i => i.addEventListener('click', formInlineLinkHandler))

    let errors = document.querySelector('.resource-errors')
    const editInline = document.querySelector('.edit-inline')

    if (errors && editInline) {
        formLinkHandler(errors.dataset.resourceId)
    }

    function formInlineLinkHandler(event) {
        event.preventDefault();

        const { testId } = this.dataset
        formLinkHandler(testId)
    }

    function formLinkHandler(id) {
        const dataSelector = `[data-test-id="${id}"]`
        let link = document.querySelector(`.form-inline-link${dataSelector}`)
        let form = document.querySelector(`.form-inline${dataSelector}`)
        let title = document.querySelector(`.test-title${dataSelector}`)

        if (link) {
            if (form.classList.contains('d-none')) {
                title.classList.add('d-none');
                form.classList.remove('d-none');
                link.textContent = "Cancel";
            } else {
                title.classList.remove('d-none');
                form.classList.add('d-none');
                link.textContent = "Edit"
            }
        }
    }
});
