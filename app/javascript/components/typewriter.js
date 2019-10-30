var typewriter = function(txt) {
    var container = document.getElementById('typewriter'),
      speed = 14,
      i = 0,
      wordsObj = txt.split(" ")
    container.textContent = "";
    console.log(txt)
    runAllWords();
    function runAllWords() {

      if (i < wordsObj.length) {
        var a = (i == 0) ? i : i - 1;
        setTimeout(function() {
          showWord(wordsObj[i], 0)
        }, wordsObj[a].length * speed);
      }
    }

    function showWord(word, countWord) {
      if (countWord < word.length) {
        setTimeout(function() {
          showLetter(word, countWord)
        }, speed);
      } else {
        container.textContent = container.textContent + " ";
        i += 1;
        runAllWords();
      }
      if (i === wordsObj.length) {
        console.log('complete')
      }
    }

    function showLetter(word, countWord) {
      container.textContent = container.textContent + word[countWord];
      showWord(word, countWord + 1);
    }
  }
  // window.onload = typewriter();
// var container = document.getElementById('typewriter'),
//   dataText = container.dataset.typewriter,
//   splitTxt = dataText.split(",")
// for (var x = 0, ln = splitTxt.length; x < ln; x++) {
//   setTimeout(typewriter(splitTxt[x]), x * 9000, x);
// }


var i = 0;
function myLoop () {  
//  create a loop function
	
   var dataType = document.getElementById('typewriter')
   if (dataType) {
     var w = dataType.dataset.typewriter.split(',')
     setTimeout(function () {    //  call a 3s setTimeout when the loop is called
        typewriter(w[i]);          //  your code here
        i++;                     //  increment the counter
        if (i < w.length) {            //  if the counter < 10, call the loop function
           myLoop();             //  ..  again which will trigger another 
        }                        //  ..  setTimeout()
     }, 3000)

   }
   // var dataType = document.getElementById('typewriter').dataset.typewriter,
}

myLoop()

export { typewriter };
