document.addEventListener('turbolinks:load', () => {
    let control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    let table = document.querySelector('table tbody')
    const rows = table.querySelectorAll('tr')
    let arrowUp = document.querySelector('.octicon-arrow-up')
    let arrowDown = document.querySelector('.octicon-arrow-down')

    let sortedRows = Object.values(rows)

    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        arrowUp.classList.remove('hide')
        arrowDown.classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        arrowDown.classList.remove('hide')
        arrowUp.classList.add('hide')
    }

    let sortedTable = document.createElement('tbody')

    sortedRows.map(i => sortedTable.appendChild(i))

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}
