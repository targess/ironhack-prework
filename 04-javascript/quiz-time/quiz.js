var user = {}
var responses = []

function question1() {
  var name = prompt('What is your name?')
  user.name = name
}

function question2() {

  var firstQuestion = prompt('Does null === 0 ? (Yes or No)')

// why do you need to convert the answer to lowercase?
  if ((firstQuestion.toLowerCase() === 'yes') || (firstQuestion.toLowerCase() === 'y'))  {
    firstQuestion = true
  } else if ((firstQuestion.toLowerCase() === 'no') || (firstQuestion.toLowerCase() === 'n')) {
    firstQuestion = false
  } else {
// what if the user writes something other than yes or no? 
// they will have to answer the question again
    alert("Please answer either Yes or No");
    return question2();
  }
  responses.push(firstQuestion); // add the true or false value to the responses array
}

function question3() {
  var thirdQuestion = prompt('What was the original name for JavaScript: Java, LiveScript, JavaLive, or ScriptyScript?');
  thirdQuestion = thirdQuestion.toLowerCase();
  switch (thirdQuestion) {
    case 'java':
    	thirdQuestion = false;
    	break;
    case 'livescript':
    	thirdQuestion = true;
    	break;
    case 'javalive':
    	thirdQuestion = false;
    	break;
    case 'scriptyscript':
    	thirdQuestion = false;
    	break;
    default:
    	alert("Please enter a valid answer");
    	return question3();
    	break;
  }

  responses.push(thirdQuestion);
}

function question4() {
	var fourQuestion = prompt('Ruby on Rails es un: Lenguaje, Objeto, Framework, amigo ');
	switch (fourQuestion.toLowerCase()) {
		case 'lenguaje':
		case 'objeto':
		case 'amigo':
			fourQuestion = false;
			break;
		case 'framework':
			fourQuestion = true;
			break;
		default:
    	alert("Anda chaval, introduce una respuesta válida");
    	return question4();
    	break;
	}
  responses.push(fourQuestion);
}

function evaluate(responsesArray) {

	valid_answers = 0;
	wrong_answers = 0;

	for (i=0; i < responsesArray.length; i++) {
		if (responsesArray[i] == true) {
			valid_answers += 1;
		}
		else {
			wrong_answers +=1;
		}
	}

	user.valid = valid_answers;
	user.wrong = wrong_answers;

	showResults();
}

function showResults() {

	alert("Hola " + user.name);
	alert("Has acertado " + user.valid +" respuestas");
	alert("Sin embargo, has fallado " + user.wrong);
// display the user results

}

// call the function, passing it the responses array

question1();

question2();

question3();

question4();

evaluate(responses);

