class Score {
  // State
  int width = 1920;
  int height = 1080;

  // Behaviour
  void draw() {
    textSize(40);
    textAlign(CENTER, CENTER); 
    fill(255, 255, 255);
    text(ball.score1, width / 2 - 100, 35);
    text(ball.score2, width / 2 + 100, 35);
    
    if(ball.score1 == 11 || ball.score2 == 11) {
      state = WIN_STATE;
    }
  }
}
