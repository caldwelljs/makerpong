
  // Game scores are set to 0
    var player1score = 0;
    var player2score = 0;
    var player1set = 0;
    var player2set = 0;
    var player1name = "Player 1";
    var player2name = "Player 2";
    var player1id = "";
    var player2id = "";
    var winner = "";

    var gameStart = (function (e) {
      $('#myModal').foundation('reveal', 'open');
        $('.close-reveal-modal, .live-score-dont-log-button').click(function(){
          $('#myModal').foundation('reveal', 'close');
      });
    });
    
    $('.start_game_button').click(function(e){
      $('#myModal').foundation('reveal', 'close');
    });


// Live Scoring - Passing Player info and score to hidden form fields
    var gameResult = (function (e) {
      $('#myModal2 #game_player_score').val(player1score);
      $('#myModal2 #game_opponent_score').val(player2score);
      // Input result data into results modal displaye
      $('.results-modal-winner').text(winner)
      $('.results-modal-scores .results-modal-player-name').text(player1name)
      $('.results-modal-scores .results-modal-player-score').text(player1score)
      $('.results-modal-scores .results-modal-opponent-name').text(player2name)
      $('.results-modal-scores .results-modal-opponent-score').text(player2score)
    
      $('#myModal2').foundation('reveal', 'open');
        $('.close-reveal-modal').click(function(){
          $('#myModal').foundation('reveal', 'close');
        });
    });


  $('#game_player_id').change(function() {
    player1name = $(this).find("option:selected").text();
    player1id = $(this).find("option:selected").val();
    $('#player1').text(player1name);
    $('#myModal2 #game_player_id').val(player1id);
  })

  $('#game_opponent_id').change(function() {
    player2name = $(this).find("option:selected").text();
    player2id = $(this).find("option:selected").val();
    $('#player2').text(player2name); 
    $('#myModal2 #game_opponent_id').val(player2id);
  })

  // Player clicks 'New Game' and set usernames
  $('.newGame').click(function (e) {
    e.preventDefault();  
    gameStart(); 

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
        winner = player1name
        gameResult();
        // player1set += 1;
        // $('#restartGame').trigger('click');
        console.log(player1score, player2score); 
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
        winner = player2name
        gameResult();
        // alert(player2name + ' Wins! ' + player2score + " - " + player1score);
        // player2set += 1;
        $('#restartGame').trigger('click');
        console.log(player1score, player2score);
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
