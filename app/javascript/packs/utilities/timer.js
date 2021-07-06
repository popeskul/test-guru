document.addEventListener('turbolinks:load', function(){
    let timerElement = document.querySelector('.timer')

    if (!timerElement) return null

    const timeRemaining = timerElement.dataset.remainingTime;
    startTimer(timerElement, timeRemaining);
})

function startTimer(control, timeRemaining) {
    if (timeRemaining > 0) {
        let timerLabel = document.querySelector('.timer_label');
        timerLabel.textContent = formatTime(timeRemaining);
        timeRemaining--;
        setTimeout(startTimer, 1000, control, timeRemaining);
    } else {
        document.getElementById('test_passages').submit();
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
