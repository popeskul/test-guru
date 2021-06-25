document.addEventListener('turbolinks:load', () => {
    let progressBar = document.getElementById('test-progress');

    if (progressBar) {
        const questionNumber = progressBar.dataset.questionNumber;
        const questionsCount = progressBar.dataset.questionsCount;

        const progressPercent = Math.floor(questionNumber/questionsCount * 100);

        progressBar.textContent = "Пройдено " + progressPercent + "%";
        progressBar.style.width = progressPercent + "%"
    }
});
