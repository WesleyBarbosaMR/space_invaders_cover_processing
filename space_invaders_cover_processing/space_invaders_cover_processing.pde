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


int hiScore=0;
boolean collisionDetected = false;
NavePlayer p1;
NaveShot t1, t2, t3;
NaveEnemy e1[][];
PowerUp powerUps[];

void setup() {
  size(600, 600);
  p1 = new NavePlayer(width/2);

  e1 = new NaveEnemy[5][6];
  for (int i = 0; i < e1.length; i++) {
    for (int j = 0; j < e1[i].length; j++) {
      e1[i][j] = new NaveEnemy((j*90)+25, i*60+10);
    }
  }

  powerUps = new PowerUp[4];
  for (int i = 0; i < 4; i++) {
    powerUps[i] = new PowerUp(i*60+(width-width/2.5));
  }
}

void draw() {
  background(0);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("HI-SCORE\n" + hiScore, width/6, height/15);

  //PowerUps - Superior/Direita


  p1.update();

  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      if (e1[i][j].enemyAlive == true) {
        e1[i][j].update(e1[i][j].enemXpos+45, e1[i][j].enemYpos+120);
      }
    }
  }

  for (int i = 0; i < powerUps.length; i++) {
    powerUps[i].update(powerUps[i].xpos, powerUps[i].ypos);


    // Quando o PowerUp for ativado é preciso substituir no vetor(lista de power ups)
    if (powerUps[i].status == true && powerUps[i].type == 1) {
      powerUps[i] = new PowerUpTrishot(powerUps[i].xpos);
      p1.naveTriShot(p1.xpos);
    } else if (powerUps[i].status == true && powerUps[i].type == 2) {
      powerUps[i] = new PowerUpSpeedestShot(powerUps[i].xpos);
      p1.t1.speed = 5;
      p1.t2.speed = 5;
      p1.t3.speed = 5;
    } else if (powerUps[i].status == true && powerUps[i].type == 3) {
      powerUps[i] = new PowerUpLargeEnemies(powerUps[i].xpos);
      for (int j = 0; j < e1.length; j++) {//Colunas de Inimigos
        for (int k = 0; k < e1[j].length; k++) {//Linhas de inimigos
          if (e1[j][k].enemyAlive == true) {
            e1[j][k].enemyR = 40;
          }
        }
      }
    } else if (powerUps[i].status == true && powerUps[i].type == 4) {
      powerUps[i] = new PowerUpDoublePoints(powerUps[i].xpos);
      for (int j = 0; j < e1.length; j++) {//Colunas de Inimigos
        for (int k = 0; k < e1[j].length; k++) {//Linhas de inimigos
          if (e1[j][k].enemyAlive == true) {
            e1[j][k].scoreMultiplier+=1;
          }
        }
      }
    } else {
      p1.naveShot(p1.xpos);
    }
  }

  if (keyPressed) {
    if (key == '1') {
      powerUps[0].status = true;
      powerUps[0].type = 1;
    } else if (key == '2') {
      powerUps[1].status = true;
      powerUps[1].type = 2;
    } else if (key == '3') {
      powerUps[2].status = true;
      powerUps[2].type = 3;
    } else if (key == '4') {
      powerUps[3].status = true;
      powerUps[3].type = 4;
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
