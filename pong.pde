Ball ball = new Ball();
Paddles paddles = new Paddles();
Score score = new Score();
Net net = new Net();
Time time = new Time();
Wall wall = new Wall();
Skill1p skill1p;
Skill2p skill2p;
int p1color = 255;
int p2color = 255;
boolean player2 = false;
boolean player1 = false;


final int MENU_STATE    = 1;
final int GAME_STATE    = 2;
final int PAUSE_STATE   = 3;
final int WIN_STATE = 4;

int state = MENU_STATE;
int i = 0;


void setup() {
  background(0);
  fullScreen();

  skill1p = new Skill1p(10, 10, 150, 20);
  skill2p = new Skill2p(width - 160, 10, 150, 20);
}

void draw() {
  switch(state) {
  case MENU_STATE:
    drawMenu();
    keyPressedd();
    break;
  case GAME_STATE:
    drawGame();
    keyPressedd();
    break;
  case WIN_STATE:
    drawWin();
    keyPressedd();
    break;
  }
}

void drawMenu() {
  background(0);
  noStroke();

  fill(255);
  textSize(200);
  textAlign(CENTER, CENTER);
  text("PONG", width / 2, height / 2 - 200); 

  fill(p1color);
  textSize(70);
  text("1 player", width / 2, height / 2 + 140);
  fill(p2color);
  textSize(70);
  text("2 player", width / 2, height / 2 + 200);
}
void drawGame() {
    noStroke();
    background(0xFFFF0000);   
    // time
    time.draw();
    time.timeMove();

    // ball
    ball.draw();
    ball.move();

    // paddles
    paddles.draw();
    paddles.contactWithBall();

    // wall
    wall.draw();

    // net
    net.draw();

    // score
    score.draw();

    // time
    time.draw();
    time.timeMove();
    if (player1 == true) {
      skill1p.draw();
      skill1p.lineMove();    
      paddles.bot();
    } else if (player2 == true) {
      skill1p.draw();         
      skill2p.draw(); 
      skill2p.lineMove();
      skill1p.lineMove();
    }
}

void drawWin() {
  if(ball.score1 == 11) {
    background(0);
    fill(0xFFE3B417);
    textSize(100);
    text("Left player WIN", width / 2, height / 2);    
    textSize(50);
    text("Press space to go the menu", width / 2, height / 2 + 150);
  } else if(ball.score2 == 11) {
    background(0);
    textSize(100);
    fill(0xFFE3B417);
    text("Right player WIN", width / 2, height / 2);
    textSize(50);
    text("Press space to go the menu", width / 2, height / 2 + 150);
  }
}

void keyPressedd() {
  switch(state) {
  case MENU_STATE:
    keyPressedMenu();
    break;
  case GAME_STATE:
    paddles.move();
    break;
  case WIN_STATE:
    keyPressedWin();
    break;
  }
}

void keyPressedMenu() {
  if (keyCode == UP) {
    p2color = 255;
    p1color = 0xFFE32525;
  } else if (keyCode == DOWN) {
    p2color = 0xFFE32525;
    p1color = 255;
  } else if (keyCode == ENTER) {
    if (p1color == 0xFFE32525) {
      state = GAME_STATE;
      player1 = true;
    } else if (p2color == 0xFFE32525) {
      state = GAME_STATE;
      player2 = true;
    }
  }
}

void keyPressedWin() {
  if (key == ' ') {
    state = MENU_STATE;
    ball.score1 = 0;
    ball.score2 = 0;
    time.time = 60;
  }
}
