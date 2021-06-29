document.addEventListener('turbolinks:load', () => {
        const timerElement = document.querySelector('.timer')

        if (!timerElement) return null;

        const { remainingTime } = timerElement.dataset;
        startTimer(timerElement, remainingTime);
    }
)

function startTimer(control, remainingTime) {
    if (remainingTime > 0) {
        let timerLabel = document.querySelector('.timer_label');
        timerLabel.textContent = formatTime(remainingTime);
        remainingTime--;
        setTimeout(startTimer, 1000, control, remainingTime);
    } else {
        const resultPage = window.location.href + '/result';
        window.location.replace(resultPage);
    }
}

function formatTime(numberOfSecs) {
    let secondsToOutput = numberOfSecs % 60
    const minutesToOutput = (numberOfSecs - secondsToOutput) / 60

    if (secondsToOutput < 10) {
        secondsToOutput = '0' + secondsToOutput
    }

    return minutesToOutput + ':' + secondsToOutput
}
