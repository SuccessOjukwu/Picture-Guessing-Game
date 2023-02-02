//imports processing music and video for the game
import processing.sound.*;
import processing.video.*;

//initialise variable name for movie and soundfile
Movie movie;
SoundFile startmusic;
SoundFile endsong;

//intilaisng timer variable
Timer countDownTimer;
int timeLeft;

//initialisng variables names of the different images to be displayed
PImage iontas;
PImage display;
PImage callan;
PImage eolas;

//initialisiing what variable gamestate is in
String gameState;


void setup() {
  //sispalys title on window
  surface.setTitle("Guessing Game  Student 21437332 ");//this line of code was taken from probabilty class in processing
  size(800, 600);

  //initialising the music variable name and telling the program where this is located with its format
  startmusic = new SoundFile(this, "beat.aiff");
 

  //music to continually repeat itself after its played
  startmusic.loop();

  //initialising the movie variable name and telling the program where this is located alongside its format
  movie = new Movie(this, "newtransit.mp4");

  //initialising game State to start
  gameState = "Start";
  countDownTimer = new Timer(1000);
  timeLeft=10;//setting timeleft to 10 seconds

  //load images from file into processing
  display= loadImage("display.jpg");
  iontas= loadImage("newiontas.jpeg");
  iontas.resize(width, height-100);//resizing image to fit the size of the screen
  eolas= loadImage("eolas.jpg");
  eolas.resize(width, height-100);
  callan =loadImage("newcallan.jpg");
  callan.resize(width, height-100);
}
void draw() {
  //calls the background function
  clearBackground();

  //if statement to call the function if the game state is equal to that function
  //this idea of calling different functions in draw and defining them afterwards was also taken from a youtube video,
  //the link wouldbe on the reference sheet
  if (gameState =="Start") {
    startGame();
  } else if (gameState =="Play") {
    playGame();
  } else if (gameState =="Stage1") {
    stageOne();
  } else if (gameState =="Stage2") {
    stageTwo();
  }

  //if statement to  stop the music when game State is end and also when game State is surprise
  else if (gameState =="end") {
    endGame();
    startmusic.stop();
  } else if (gameState =="Suprise") {
    startmusic.stop();
    SuprisePart();
  } else if (gameState =="movie") {
    movieSong();
  }
}

//thos part of the program was taken from one of the examples in proessing for creating a new instance in movie
void movieEvent(Movie movie) {
  movie.read();
}
//for the StartGme function,
//instrucion on how to play will be displayed before staring
//and if user clicks on the mouse, it moves to the next stage which is PlayGame


void startGame() {
  image(display, 200, 0);//image to fit on the top of the screen
  textAlign(CENTER);//aligns text at center of the screen
  textSize(23);//textsize of text
  fill(100, 0, 0);
  text(255, 0, 0);
  text("Click Anywhere to Start!", width/2, height/2);
  textSize(16);
  fill(0, 0, 0);
  text("Instructions to play the game are provided below :", width/2, height/2+30);
  text("This game contains series of pictures around maynooth university for ", width/2, height/2+60);
  text("the player to identify, there are also options you can choose from using you the ", width/2, height/2+90);
  text(" keyboard. Just select an option ,  if the answer is wrong, you are still alllowed to chose ", width/2, height/2+120);
  text("the right answer within the time duration .At the end of the game ", width/2, height/2+150);
  text("if all test cases has been passed. there is a suprise at the end . ", width/2, height/2+180);
  text(" GOODLUCK!", width/2, height/2+230);

  if (mousePressed==true) {//if statement to checkif  mouse is pressed,and if so the program starts game

    gameState="Play";//gamestate is set to play
    timeLeft=10;//time set for next stage is 10seconds
  }
}
//in this stage,
// it would display images on screen and since the timer is already set
//it just displayes the  questions alongside the images
//also if user types in the correct keypad option,
//moves to the next stage else the game ends
void playGame() {
  image(eolas, 0, 0);//image of eolas building displayed to screen
  textAlign(LEFT);
  textSize(30);
  text(255, 0, 0);
  fill(0);
  text("GUESS THE BUILDING ", 90, 540);
  fill(124, 255, 0);
  text("A.)EOLAS                  B.) IONTAS             C.)  PHEONIX ", 100, 590);//options displayed at bottom of screen

  //if statement to check if time is complete, if so end game else remove 1 second
  //from the timeleft and repeat process
  if (countDownTimer.complete()==true) {
    if (timeLeft>1) {
      timeLeft=timeLeft-1;
      countDownTimer.start();
    } else {
      gameState="end";
    }
  }
  textAlign(LEFT);
  textSize(14);
  fill(255, 0, 0);
  text("Time Left :" +timeLeft, 50, 50);//set text to display timeleft on screen
  if ((key=='A')||(key=='a')) {//if statement to check if the user types in option a
    gameState="Stage1";//and proceed to next stage if option a is typed
    timeLeft=7;//timeleft set for the next stage
  }
}
//in this stage,
// it would display images on screen and since the timer is already set
//it just displayes the  questions alongside the images
//also if user types in the correct keypad option,
//moves to the next stage else the game ends
void stageOne() {
  image(iontas, 0, 0);//display iontas building  to screen
  textAlign(LEFT);
  textSize(30);
  text(255, 0, 0);
  fill(0);
  text("GUESS THE BUILDING ", 90, 540);
  fill(124, 255, 0);
  text("A.)SCIENCE BUILDING          B.) IONTAS         C.) CARAPARK ", 100, 590);//options displayed to screen

  //timer to check if time is complete, end game else remove 1 second
  //from the timeleft and repeat process

  if (countDownTimer.complete()==true) {
    if (timeLeft>1) {
      timeLeft=timeLeft-1;
      countDownTimer.start();
    } else {
      gameState="end";//set game state to end
    }
  }
  textAlign(LEFT);//aligns text to left of the screen
  textSize(14);
  fill(255, 0, 0);
  text("Time Left :" +timeLeft, 50, 50);//displays timeleft on the screen
  if ((key=='B')||(key=='b')) {//if ststement to check if the user types in option b 
    gameState="Stage2";//changes gamestate to stage2
    timeLeft=5;//sets timer for stage 2
  }
}
//also in this stage,
// it would display images on screen and since the timer is already set
//it just displayes the  questions alongside the images
//also if user types in the correct keypad option,
//moves to the next stage else the game ends
void stageTwo() {
  image(callan, 0, 0);//display a picture of  callan building
  textAlign(LEFT);
  textSize(30);
  text(255, 0, 0);
  fill(0);
  text("GUESS THE BUILDING ", 90, 540);//text to display at bottom of the screen
  fill(124, 255, 0);
  text("A.)PHEONIX         B.) ENGINEERING        C.) CALLAN", 100, 590);//options displayed on screen
  if (countDownTimer.complete()==true) {
    if (timeLeft>1) {
      timeLeft=timeLeft-1;
      countDownTimer.start();
    } else {
      gameState="end";
    }
  }
  textAlign(LEFT);
  textSize(14);
  fill(255, 0, 0);
  text("Time Left :" +timeLeft, 50, 50);//set text to display timeleft on the screen
  if ((key=='C')||(key=='c')) {//if statement to check if user types in option c 
    gameState="Suprise";// changes gamestate to suprise
    timeLeft=3;//set time left to 3 seconds
  }
}

//here is the end game function that ends the game if the time has elapsed
void endGame() {
  fill(0);
  rect(0, 0, width, height);
  fill(0, 255, 255);
  textSize(24);
  text("Nice job! \nGame Over", width/2-60, height/2);
  fill(200);
  rect(350, 380, 100, 60);//drawing to screen a rectangular box
  fill(0, 120, 0);
  text("EXIT", width/2-25, 430);//typing into the rectangular box exit.
  if (mousePressed==true && mouseX>350&&mouseX<450&&mouseY>380&&mouseY<440) {//if function to check if user clicks inside the rectangular box on screen
    exit();//exits the program
  }
}

//here it displays the suprise song if all three stages or rounds were completed
void SuprisePart() {
  fill(25, 78, 100);
  rect(0, 0, width, height);
  textAlign(CENTER);
  textSize(23);
  fill(100, 0, 0);
  text(255, 0, 0);
  text("CONGRATULATIONS!!\nWE WILL PLAY A LOVELY  SONG FOR YOU\nYOU COULD CLICK ON THE SCREEN TO EXIT  ", width/2, height/2);
  textSize(16);

  //timer counter to check if 3seconds is complete if yes, changes the game state to movie, and if no remove 1 second from timeleft snd repeat the process
  if (countDownTimer.complete()==true) {
    if (timeLeft>1) {
      timeLeft=timeLeft-1;
      countDownTimer.start();
    } else {
      gameState="movie";//calls the movie function
    }
  }
}

//here is the movie clip displayed on the screen
void movieSong() {
  movie.play();//calls the movie to play
  fill(0);
  text("WISHING  YOU  A   MERRY  CHRISTMAS ", 400, 590);
  image(movie, 0-2, 0+50);//displays movie clip to screen
  if (mousePressed==true) {//if mouse is pressed,exit the program
    exit();
  }
}

//clear background after draw function
void clearBackground() {
  fill(255);
  rect(0, 0, width, height);
}
