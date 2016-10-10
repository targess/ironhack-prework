var myRover = {
  position: [0,0], 
  direction: 'N',
  name: "Rover One"
};

var roverRescuer = {
  position: [0,0], 
  direction: 'N',
  name: "Rover rescuer"
};

var myPlanet = [
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,"mountain",0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0,0]
]

function goForward(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]++
      break;
    case 'E':
      rover.position[1]++
      break;
    case 'S':
      rover.position[0]--
      break;
    case 'W':
      rover.position[1]--
      break;
  };

  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]")

  // detect obstacle and go back to previous position 
  var obstacle = obstacle_detection(rover.position[0],rover.position[1]);
  if (obstacle) { goBack(rover);};
}

function goBack (rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]--
      break;
    case 'E':
      rover.position[1]--
      break;
    case 'S':
      rover.position[0]++
      break;
    case 'W':
      rover.position[1]++
      break;
  };

  console.log("New Rover Position: [" + rover.position[0] + ", " + rover.position[1] + "]")

  // detect obstacle and go back to previous position 
  var obstacle = obstacle_detection(rover.position[0],rover.position[1]);
  if (obstacle) { goForward(rover);};
}

function  turnLeft (rover) {
  switch(rover.direction) {
    case 'N':
      rover.direction = 'W'; 
      break;
    case 'E':
      rover.direction = 'N';
      break;
    case 'S':
      rover.direction = 'E';
      break;
    case 'W':
      rover.direction = 'S';
      break;
  };

  console.log("New Rover Direction: "+ rover.direction);
}

function turnRight (rover) {
  switch (rover.direction) {
    case 'N':
      rover.direction = 'E';
      break;
    case 'E':
      rover.direction = 'S';
      break;
    case 'S':
      rover.direction = 'W';
      break;
    case 'W':
      rover.direction = 'N';
      break;
  };

  console.log("New Rover Direction: "+ rover.direction);
}

function sendCommands(rover, commands) {

  if (typeof(commands) === "string") { commands = commands.split("") }
  for (i = 0; i < commands.length; i++) {
    switch (commands[i].toLowerCase()) {
      case 'f':
        goForward(rover);
        break;
      case 'b':
        goBack(rover);
        break;
      case 'l':
        turnLeft(rover);
        break;
      case 'r':
        turnRight(rover);
        break;
    }
  }

  // marks on myPlanet map the rover position
  myPlanet[rover.position[0]][rover.position[1]] = rover.name;
}

// In case this detect and obstacle, returns 1, else 0
function obstacle_detection (x,y) {
  if (myPlanet[x][y] != 0) {
    console.log("WARNING! An obstacle was detected at: (" + x + "," + y + ") position. It was a " + myPlanet[x][y]);
    return true;
  }
  else { return false}
}


// goForward(myRover);
// turnLeft(myRover);
// goBack(myRover);
// turnRight(myRover);
// goForward(myRover);

sendCommands(myRover,"fffrfflfffbb");
sendCommands(roverRescuer,"fffrfflfffbb");

