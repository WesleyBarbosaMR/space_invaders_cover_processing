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
NaveShot t1;
NaveEnemy e1[][];

void setup() {
  size(600, 600);
  p1 = new NavePlayer(width/2);
  e1 = new NaveEnemy[5][6];
  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      e1[i][j] = new NaveEnemy((j*90)+30, i*60+10);
    }
  }
}

void draw() {
  background(0);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("HI-SCORE\n" + hiScore, width/6, height/15);
  
  //PowerUps - Superior/Direita
  
  p1.update();
  p1.naveShot(p1.xpos);

  for (int i = 0; i < e1.length; i++) {//Colunas de Inimigos
    for (int j = 0; j < e1[i].length; j++) {//Linhas de inimigos
      if (e1[i][j].enemyAlive == true) {
        e1[i][j].update(e1[i][j].enemXpos+45, e1[i][j].enemYpos+120);
      }
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






/*void keyReleased() {
 if (key == 'W' || key == 'w' || key == 'S' || key == 's' || keyCode == UP || keyCode == DOWN) {
 p1.velocityY = 0;
 }
 if (key == 'A' || key == 'a' || key == 'D' || key == 'd' || keyCode == LEFT || keyCode == RIGHT) {
 p1.velocityX = 0;
 }
 }*/
