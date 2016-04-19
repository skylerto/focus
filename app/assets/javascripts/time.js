//= require pomodoro/build/pomodoro.js
//= require pomodoro/build/timer.js

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
  return number > 9 ? "" + number :  "0" + number;
}



/**
 *  Bind a timer to a task
 *
 */
function Clock() {
  this.task = $('#task').data('task');
  this.url = $('#task').data('url');
  if(!this.timer){
    this.pom = new Pomodoro();
    this.timer = this.pom.taskTimer;
  }
  $('.timer-title').html('<h3>Task</h3>');
}


/**
 *
 */
Clock.prototype.updateProgress = function(){
    this.task.progress++;
    var payload;
    if (this.task.task_id){
     payload = { "sub_task": this.task };
    } else {
     payload = { "task": this.task };
    }
    $.ajax({
      method: "PUT",
      url: this.url + '/' + this.task.id,
      dataType: "JSON",
      data: payload
    }).done(function(msg, err) {
      console.log(document.URL +  ' .task_progress');
      $('.progression').load(document.URL +  ' .progression');
      //location.reload();
    });
  };


Clock.prototype.complete = function(){
    this.task.complete = true;
    var payload;
    if (this.task.task_id){
     payload = { "sub_task": this.task };
    } else {
     payload = { "task": this.task };
    }
    $.ajax({
      method:  "PUT",
      url: this.url + '/' + this.task.id,
      dataType: "JSON",
      data:  payload
    }).done(function(msg, err) {
      location.reload();
    });
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
      $('.timer-title').html('<h3>Task</h3>');
        updatePomodoro(this.timer);
      this.timer.reset();
     } else {
        this.timer.reset();
     }
  } else {
    this.updateProgress();
    if (confirm('Have you completed the task?')) {
      // Set the task to completed
      this.complete();
      this.timer.reset();
    } else {
      if (confirm('Read for a break?')) {
        this.timer = this.pom.breakTimer;
        $('.timer-title').html('<h3>Break</h3>');
        updatePomodoro(this.timer);
      } else {
        this.timer.reset();
        updatePomodoro(this.timer);
      }
    }
  }
  };



Clock.prototype.start = function(){   
  var that = this;
  if(this.timer){
    this.timer.start(function(timer) {
      if (timer.duration <= 1){
        that.done();
      }
      updatePomodoro(timer);
    });
  } else {
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
