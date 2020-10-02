int score = 0;                           //Global Variables
float speedMult = 1;
boolean play = false;   //Button activation will be tied to a boolean

Bubble b1;
Bubble b2;
Bubble b3;
Bubble b4;
Bubble b5;

void setup() 
{
  size(400, 600);                      //Window size and variables relative to width & height
  float playX = 3*width/8;
  float exitX = 5*width/8;
  float buttonY = 2*height/3;
  float buttonW = 3*width/16;
  float buttonH = height/12;
  float buttonR = width/80;
  
  background(255);                     //Menu Page Setup
  textSize(width/16);
  fill(0);
  text("The Bubble Game", width/4, 7*height/24);
  textSize(width/25);
  text("Click on each bubble to earn a point.", 3*width/20, 9*height/24);
  text("You will lose a point if the bubble leaves", width/10, 10*height/24);
  text("the screen.", 2*width/5, 11*height/24);
  text("Are you ready?", 7*width/20, 13*height/24);
  
  rectMode(CENTER);                   //Play and Exit Button Setup
  stroke(0);
  strokeWeight(3);
  fill(0, 250, 0);
  rect(playX, buttonY, buttonW, buttonH, buttonR);
  fill(250, 0, 0);
  rect(exitX, buttonY, buttonW, buttonH, buttonR);
  
  fill(0);
  textSize(13);
  text(" Let's Start!", playX-buttonW/2, buttonY);
  textSize(12);
  text(" Maybe Later", exitX-buttonW/2, buttonY);
   
  b1 = new Bubble();                  //Creating bubbles in preparation for the game
  b2 = new Bubble();
  b3 = new Bubble();
  b4 = new Bubble();
  b5 = new Bubble();
}

void mouseClicked()
{
  float playX = 3*width/8;           //Redeclare button variables
  float exitX = 5*width/8;
  float buttonY = 2*height/3;
  float buttonW = 75; //x
  float buttonH = 50; //y
  
  if(mouseX<exitX + buttonW/2 && mouseX>exitX - buttonW/2 && mouseY<buttonY + buttonH/2 && mouseY>buttonY - buttonH/2)  //Conditions for the exit button
   {
     exit();
   }
  
  if(mouseX<playX + buttonW/2 && mouseX>playX - buttonW/2 && mouseY<buttonY + buttonH/2 && mouseY>buttonY - buttonH/2)  //Conditions for the play button
   {
     play=true;
     exitX=width*2;    //Move the exit button offscreen to prevent gameplay interruption
     buttonY=height*2;
   }
}

void draw()
{
  speedMult = constrain(speedMult, 1, 100);      //Variables for gameplay
  strokeWeight(1);
  int red = 0;

  if(play == true)                              //Conditional setup for game initiation
  {
    while(red<240)
    {
      red++;
      background(red, 200, 100);
    }
    
    fill(0);
    textSize(20);
    text("Score: " + score, width/40, height/12);
    
    b1.runAll();                                //Run the game!
    b2.runAll();
    b3.runAll();
    b4.runAll();
    b5.runAll();
  }
}



  
