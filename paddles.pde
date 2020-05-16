class Paddles {
  // State
  float paddle1X, paddle1Y;
  float paddle2X, paddle2Y;
  float paddleW, paddleH1, paddleH2;
  float paddleDY;
  float width = 1920;
  float height = 1080;
  
  // Behaviour
  Paddles() {    
    paddleW = 13;
    paddleH1 = 90;
    paddleH2 = 90;
    paddle1X = 0;
    paddle1Y = height / 2 - 50;
    paddle2X = width - paddleW;
    paddle2Y = height / 2;    
    paddleDY = 9.7;
  }
  
  void draw() {
    textSize(30);
    textAlign(CENTER, CENTER); 
    fill(255);
    rect(paddle1X, paddle1Y, paddleW, paddleH1);
    fill(255);
    rect(paddle2X, paddle2Y, paddleW, paddleH2);
    
    if (skill2p.skill2p == false) {
      paddleH2 = 90;
      if (time.timeOver == true) {
        paddles.paddleH2 = 40;
        paddles.paddleW = 7;
      }
    } else if (skill2p.skill2p == true) {
      paddles.paddleH2 = 800;
    }    
    if (skill1p.skill1p == false) {
      paddleH1 = 90;
      if (time.timeOver == true) {
        paddles.paddleH1 = 40;
        paddles.paddleW = 7;
      }
    } else if (skill1p.skill1p == true) {
      paddles.paddleH1 = 800; 
    }
  }
  
  void move() {
    if(keyPressed) {
      if (key == 'w' || key == 'W') {
        paddle1Y = paddle1Y - paddleDY;
      }
      if (key == 's' || key == 'S') {
        paddle1Y = paddle1Y + paddleDY;
      }
      if(player2 == true) {
        if (keyCode == UP) {
          paddle2Y = paddle2Y - paddleDY;
        }
        if (keyCode == DOWN) {
          paddle2Y = paddle2Y + paddleDY;
        }
      }
    }
    if (paddle1Y <= wall.y + wall.h) {
      paddle1Y = paddle1Y + paddleDY;
    }
    if (paddle1Y + paddleH1 >= height) {
      paddle1Y = paddle1Y - paddleDY;
    }
    if (paddle2Y <= wall.y + wall.h) {
      paddle2Y = paddle2Y + paddleDY;
    }
    if (paddle2Y + paddleH2 >= height) {
      paddle2Y = paddle2Y - paddleDY;
    }
  }
  void bot() {
  if (ball.ballDY > 0 || ball.ballDX > 0) {
      if(ball.ballX > width / 2 - 100) {
        if(paddle2Y + 35 != ball.ballY) {
          if(paddle2Y + 35 < ball.ballY) {
            paddle2Y += 9.75;
          }
          if(paddle2Y + 35 > ball.ballY) {   
            paddle2Y -= 9.78;
          }
        }
      }
    }
  }
  void contactWithBall() {
    if(ball.ballX - ball.ballH / 2 < paddle1X + paddleW
    && ball.ballY - ball.ballH / 2 < paddle1Y + paddleH1
    && ball.ballY + ball.ballH / 2 > paddle1Y) {
      if(ball.ballDX < 0) {
        ball.ballDX *= -1;
      }
    } else if(ball.ballX + ball.ballH / 2 > paddle2X
      && ball.ballY - ball.ballH / 2 < paddle2Y + paddleH2
      && ball.ballY + ball.ballH / 2 > paddle2Y) {
        if(ball.ballDX > 0) {
          ball.ballDX *= -1;
        }
    }
  }
}
