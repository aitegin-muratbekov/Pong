class Time {
  // State
  int x, y;
  float time;
  boolean timeOver = false; 
  // Behaviour
  Time() {
    x = 1920 / 2;
    y = 35;
    time = 60;
  }

  void timeMove() {
    noStroke();
    if (time > 0) { 
      time -= 0.01;
    } else if ( time <= 0) {
      timeOver = true;
    }
  }

  void draw() {
    textAlign(CENTER, CENTER);
    textSize(90);
    fill(0, 0, 0); 
    text((int)time, width / 2, 35);
  }
}
