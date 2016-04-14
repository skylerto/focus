/**
 * For javascript on the page.
 */

/**
 * Update the UI elements for the Pomodoro
 *
 * @method updatePomodoro
 */
function updatePomodoro(timer){
  document.getElementById("minutes").innerHTML = doubleDigit(timer.minutes);
  document.getElementById("seconds").innerHTML = doubleDigit(timer.seconds - 1);
}


/**
 * Convert number to double digits.
 *
 * @method doubleDigit
 */
function doubleDigit(number){
  return number > 9 ? "" + number: "0" + number;
}



/**
 *  Bind a timer to a task
 *
 */
var Clock = function(task) {
  this.task = $('.task').data('task');
  if(!this.timer){
    this.pom = new Pomodoro(0.1, 0.05);
    this.timer = this.pom.taskTimer;
  }
  $('.timer-title').html('<h3>Task</h3>');
};

/**
 * Are we on a break or not?
 */
Clock.prototype.onBreak = function(){
  return this.timer === this.pom.breakTimer;
};

/**
 * Code to be executed when the timer finishes.
 */
Clock.prototype.done = function(){
  // send update progress.
  if(this.onBreak()){
    if (confirm('Read to start?')) {
      this.timer = this.pom.taskTimer;
      $('.timer-title').html('<h3>Break</h3>');
      this.timer.reset();
     } else {
        this.timer.reset();
     }
  } else {
    if (confirm('Have you completed the task?')) {
      // Set the task to completed
      this.timer.reset();
    } else {
      if (confirm('Read for a break?')) {
        this.timer = this.pom.breakTimer;
        $('.timer-title').html('<h3>Break</h3>');
      } else {
        this.timer.reset();
      }
    }
  }
};



Clock.prototype.start = function(){    var that = this;
  if(this.timer){
    this.timer.start(function(timer) {
      if (timer.duration <= 1){
        that.done();
      }
      updatePomodoro(timer);
    });
  } else {
    this.creaeTimer();
    this.timer.start(function(timer) {
      if (timer.duration <= 1){
        that._done();
      }
      updatePomodoro(timer);
    });
  }
};

Clock.prototype.pause = function(){
    if(this.timer){
      this.timer.pause();
    }
};
