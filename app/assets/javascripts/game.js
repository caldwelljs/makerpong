
  // Game scores are set to 0
    var player1score = 0;
    var player2score = 0;
    var player1set = 0;
    var player2set = 0;

    var gameResult = (function (e) {
      $('#myModal').foundation('reveal', 'open');
        $('.close-reveal-modal').click(function(){
          $('#myModal').foundation('reveal', 'close');
      });
    });


  // Player clicks 'New Game' and set usernames
  $('.newGame').click(function (e) {
    e.preventDefault();    
    var player1name = prompt("What is Player 1's name")
    $('#player1').text(player1name);
    var player2name = prompt("What is Player 2's name")
    $('#player2').text(player2name); 
    

// Log Game Modal
    // $('#myModal').foundation('reveal', 'open');
    // $('.close-reveal-modal').click(function (e) {    
    //   e.preventDefault();
    //   $('#myModal').foundation('reveal', 'close');
    // });


  // Click restart game - player scores set to 0
    $('#restartGame').click(function (e){
      e.preventDefault();
      player1score = 0;
      player2score = 0;
      $('#player_1_score span').text(player1score);
      $('#player_2_score span').text(player2score);
    });


  // Record Player 1 point with click event handler
  // If Player 1 wins by 2 record set point and restart game score
  // Else record point for Player 2
    $("#player1").on('click', function (e) {
      player1score += 1;
      if (player1score >= 21 && player1score - player2score >= 2) 
      {
        $('#player_1_score span').text(player1score);
        alert(player1name + ' Wins! ' + player1score + " - " + player2score);
        gameResult();
        // player1set += 1;
        // $('#restartGame').trigger('click');
        $('#player1set').text(player1set);
        console.log(player1set, player2set, player1score, player2score); 
      } else {
        $('#player_1_score span').text(player1score);
        console.log(player1score);
      }
    });

  // Triggers to increase Player 1 score
    $("#player_1_score span").on('click', function (e) {
      $('#player1').trigger('click');
    });

    $("#increasePlayer1").on('click', function (e) {
      $('#player1').trigger('click');
    });

  // Decrease Player 1 Score
    $("#decreasePlayer1").on('click', function (e) {
      if (player1score > 0) {
      player1score -= 1;
      $('#player_1_score span').text(player1score);
      console.log(player1score);
    } else {
      player1score = 0;
      $('#player_1_score span').text(player1score);
    }
    });


    // Record Player 2 point with click event handler
    // If Player 2 wins by 2 record set point and restart game score
    // Else record point for Player 2
    $("#player2").on('click', function (e) {
      player2score += 1;
      if (player2score >= 21 && player2score - player1score >= 2) 
      {
        $('#player_2_score span').text(player2score);
        gameResult();
        // alert(player2name + ' Wins! ' + player2score + " - " + player1score);
        // player2set += 1;
        $('#restartGame').trigger('click');
        $('#player2set').text(player2set);
        console.log(player1set, player2set, player1score, player2score);
      } else {
        $('#player_2_score span').text(player2score);
        console.log(player2score);
      }
    });          

    
  // Triggers to increase Player 2 score
    $("#player_2_score span").on('click', function (e) {
      $('#player2').trigger('click');
    });

    $("#increasePlayer2").on('click', function (e) {
      $('#player2').trigger('click')
    });

    // Decrease Player 2 Score
      $("#decreasePlayer2").on('click', function (e) {
        if (player2score > 0) {
        player2score -= 1;
        $('#player_2_score span').text(player2score);
        console.log(player2score);
      } else {
        player2score = 0;
        $('#player_2_score span').text(player2score);
      }
      });
  });





  // // Add a point to the player who scores
  // var gamePointFunc = function (){
  //   this.gamePointCount += 1;
  // };

  // var setPointFunc = function (){
  //   this.setPointCount += 1;
  // };

  // var player1 = {
  //   gameScore: gamePointFunc,
  //   setScore: setPointFunc,
  //   gamePointCount: 0,
  //   setPointCount: 0
  // };

  // var player2 = {
  //   gameScore: gamePointFunc,
  //   setScore: setPointFunc,
  //   gamePointCount: 0,
  //   setPointCount: 0
  // };
