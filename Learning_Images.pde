PImage helicopter;
PImage StickManWithGun;
PImage StickManWithGun2;
float heliY = 0;
float heliX = 0;
float enemySpawn = 0;
float fallSpeed = 1;
float angle = 0;

//
//set the enemy spawn off of the screen
//
float enemyX = -100;
int enemyY = -1000;

void setup()
{
  //
  // set the size of the canvas
  //
  size(500, 300);

  //
  //saying that helicopter is the name of the file
  //
  helicopter = loadImage("helicopter left to right.gif");

  //
  //name the enemy image "StickManWithGun"
  //
  StickManWithGun = loadImage("StickManWithGun.gif");
  StickManWithGun2 = loadImage("StickManWithGun2.gif");

  //
  //run newHeli
  //
  newHeli();
}

void draw()
{
  //
  //make the background
  //
  background(233);

  //
  //make the helicopter image appear
  //
  image(helicopter, heliX, heliY);

  //
  //the enemy will be a box for testing purposes
  //
  //fill(0);
  //rect(enemyX, enemyY, 25, 25);

  //
  //Make the enemy that picture of a guy with a gun
  //
  if (enemyX >  width/2) 
  { 
    //image(StickManWithGun, enemyX, enemyY, 20, 30);
    image(StickManWithGun2, enemyX, enemyY, 20, 30);
  } else
  {
    image(StickManWithGun, enemyX, enemyY, 20, 30);
  }


  //
  //update x position
  //
  heliX += 1;

  //
  //the enemy will "fall" (increase in the y) from the origin
  //
  enemyY += fallSpeed;
  //enemyY = enemyY*fallSpeed;

  if (enemyY == 220)
  {
    fallSpeed = 0;
  }

  //
  //when the heli reaches the end of the screen (plus a little) make another
  //
  if (heliX == 600)
  {
    newHeli();
  }

  //
  //when the helicopter reaches where the enemy will spawn run newEnemy
  //
  //println("x is: " + heliX);
  //println("enemySpawn is: " + enemySpawn);
  //println("enemyY is: " + enemyY);
  if ( heliX == enemySpawn)
  {
    newEnemy();
  }

  //
  //Make the ground, just a rectangle
  //
  noStroke();
  fill(139);
  rect(0, 250, 500, 50);

  //
  //Create the circle on top of the turret base which the barrel will turn around
  //
  ellipse(250, 225, 35, 35);

  pushMatrix();
  translate(250, 225);
  rotate(angle);
  rect(-5, -15, 10, -17);
  popMatrix();

  //
  //left and right key presses increase or decrease the angle
  //
  if (keyPressed) 
  {
    if (keyCode == LEFT) 
    {
      angle -= 0.03;
    }
    if (keyCode == RIGHT) 
    {
      angle += 0.03;
    }
  }
  if (angle < -1.2)
  {
   angle = -1.2;
  }
  if (angle > 1.2)
  {
   angle = 1.2;
  }
println("angle is " +angle);
  //
  //Create the turret base with rounded edges
  //
  fill(175);
  rect(215, 250, 70, -25, 7, 7, 0, 0);
}

// void keyPressed()
// {
//   newHeli();
// }

//
//this is where the helicopter spawn points are
//
void newHeli()
{
  //
  //the x is set off the screen so that you will see it "fly" on to the screen.
  //
  heliX = -100;

  //
  ///random y position in between 0 and 50
  //
  heliY = floor(random(0, 50)); 

  //
  //Pick a random enemy spawn point(that corresponds with the heli)
  //
  enemySpawn = floor(random(50, 450));
  while (enemySpawn >215 && enemySpawn <285)
  {
    enemySpawn = floor(random(50, 450));
    println("enemySpawn is: " + enemySpawn);
  }
}

//
//this is what spawns the enemy once the helicopter is in the right place
//
void newEnemy()
{
  //
  //the enemy x will be the same as the helicopters x
  //
  enemyX = heliX;
  //
  //the enemy y will be the same as the heicopter when it spawns
  //
  enemyY = floor(heliY);

  //
  //change fall speed from 0 to 1
  //
  fallSpeed = 1;
}
