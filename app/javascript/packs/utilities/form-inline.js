document.addEventListener('turbolinks:load', () => {
    $('.form-inline-link').on('click', formInlineLinkHandler);

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
        let $form = $(`.form-inline${dataSelector}`)
        let $title = $(`.test-title${dataSelector}`)

        console.log(link)
        if (!link) return null;

        $form.toggle()
        $title.toggle()
        link.textContent = $form.is(':visible') ? "Cancel" : "Edit"
    }
});
