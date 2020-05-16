class Ball {
  // State
  float ballX, ballY;
  int ballW, ballH;
  int ballDX, ballDY;
  int width = 1920;
  int height = 1080;
  int score1, score2;
  
  // Behaviour
  Ball() {
    ballX = width / 2;
    ballY = height / 2;
    ballW = ballH = 17;
    ballDX = 12;
    ballDY = 11;
  }
  void move() { 
    ballX += ballDX;
    ballY += ballDY;    
    if ( ballX > width - ballW / 2) {
      ballX = width / 2;
      ballY = wall.y + ((height - wall.y) / 2);
      ballDX *= -1;
      score1 += 1;
    } else if ( ballX < 0 + ballW / 2) {
      ballX = width / 2 - 100;
      if (wall.y < 400) {
        ballY = height / 2;
      } else if (wall.y > 400) {
        ballY = wall.y + ((height - wall.y) / 2);
      }
      ballDX *= -1;
      score2 += 1;
    }
    if (ballY > height - ballH) {
      ballDY *= -1;
    } else if ( ballY <= (wall.y + wall.h + ballH / 2)) {
      ballDY *= -1;
    }
  }
  void draw() {
    if (time.timeOver == true) {
      ballW = ballH = 8;
    }
    
    fill(255);
    ellipse(ballX, ballY, ballW, ballH);
  }
}
