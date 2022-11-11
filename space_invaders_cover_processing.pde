// AP1 - Programação 2
// Aluno: Wesley Barbosa - 536186
/*
Implemente pelo menos 1 elemento móvel controlado pelo jogador
 (mouse, teclado, etc) e a mecânica básica do jogo.
 Deve existir algum tipo de contagem (pontos, vidas, etc).
 O cenário deve restringir os movimentos de alguma maneira
 (paredes, obstáculos, etc).
 Não são necessários elemento visuais,
 use círculos e retângulos para representar os elementos do jogo.
 */

//Criar matriz móvel de inimigos - OK
//Criar mecânica de colisão acerto de tiro - Parcialmente feita (Corrigir posições da colisão)

int scoreP1=0, scoreP2=0, hiScore=0;
boolean collisionDetected = false;
NavePlayer p1;
NaveShot t1;
NaveEnemy e1[][];

void setup() {
  size(600, 600);
  p1 = new NavePlayer(width/2);
  e1 = new NaveEnemy[5][6];
  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      e1[i][j] = new NaveEnemy((j*90)+30, i*60+10);
      e1[i][j].update(e1[i][j].enemXpos, e1[i][j].enemYpos);
    }
  }
}

void draw() {
  background(0);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("SCORE < 1 >\n" + scoreP1, width/6, width/15);
  text("HI-SCORE\n" + hiScore, width/2, width/15);
  text("SCORE < 2 >\n" + scoreP2, width-(width/6), width/15);
  //rectMode(CENTER);
  //rect((height/2), height-100, 50, 20, 10,10,0,0);
  p1.update();
  p1.naveShot(p1.xpos);

  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      e1[i][j].update(e1[i][j].enemXpos+45, e1[i][j].enemYpos+120);
      collisionDetector(e1[i][j].enemXpos, e1[i][j].enemYpos, p1.t1.xposAt, p1.t1.ypos);
    }
  }


  //Rodapé
  //line(0,height-100,width,height-100);
  for (int i = 0; i <= 40; i++) {
    float x = lerp(0, width, i/30.0) + 0;
    float y = lerp(height-80, height-80, i/60.0);
    strokeWeight(0.75);
    line(x, y, x+10, y);
  }
}

class NaveEnemy {
  float enemXpos=0, enemYpos=0, speed=4.0;

  NaveEnemy(float x, float y) {
    enemXpos = x;
    enemYpos = y;
  }

  void update(float x, float y) {
    fill(255);
    ellipse(x, y, 35, 25);
  }
}

class NaveShot {
  float xposIn, xposAt, ypos, speed=5.0;
  int shotH=20, shotW=5;

  NaveShot(float x, float y) {
    xposIn = x;
    xposAt = xposIn;
    ypos = y - 25.0;
  }

  void update(float xpos) {
    xposIn = xpos;
    ypos-=speed;
    if (ypos < 0) {
      ypos = height-100;
      xposAt = xposIn;
    } else if(collisionDetected == true){
      ypos = height-100;
      xposAt = xposIn;
      collisionDetected = false;
    } //Add quando tiro acertar um inimigo
    stroke(255);
    strokeWeight(shotW);
    line(xposAt, ypos, xposAt, ypos-shotH);
  }
}
class NavePlayer {
  float xpos=width/2, ypos=height-100, speed=3.0;
  int naveH=20, naveW=50;
  NaveShot t1 = new NaveShot(xpos, ypos);

  NavePlayer(float x) {
    xpos = x;
    naveShot(xpos);
  }

  void update() {
    if (keyPressed == true) {
      if (keyCode == RIGHT) {
        xpos+=speed;
        //p1.naveShot(xpos);
      } else if (keyCode == LEFT) {
        xpos-=speed;
        //p1.naveShot(xpos);
      }
    }
    if (xpos > width-(naveW/2)) {
      xpos = width-(naveW/2);
    } else if (xpos < naveW/2) {
      xpos = naveW/2;
    }
    noStroke();
    rectMode(CENTER);
    triangle(xpos, ypos-25.0, xpos+8.0, ypos-10.0, xpos-8.0, ypos-10.0);
    rect(xpos, ypos, naveW, naveH, 10, 10, 0, 0);
  }

  void naveShot(float xpos) {
    t1.update(xpos);
  }
}

void collisionDetector(float enemXpos, float enemYpos, float shotXPos, float shotYPos) {
  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      if ((shotXPos > (enemXpos)) && (shotXPos < (enemXpos+45)) 
        && ((shotYPos > (enemYpos)) && (shotYPos < (enemYpos+12.5)))) {
        //println("Colidiu");
        rect(enemXpos+45,enemYpos,35,25);
        collisionDetected = true;
        scoreP1++;
      } else {
        //println("Não colidiu");
      }
    }
  }
} 
