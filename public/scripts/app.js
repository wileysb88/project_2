window.onload = function() {


getMessage();
animerror();
stonemenHide();
linkHide();

$('.chat').toggle();

setTimeout(stonemenShow(), 30000);
setTimeout(linkShow(), 10000);


};

// setInterval(getMessage(), 100);
var yaxix = Math.floor(Math.random()* 1000);
var xaxix = Math.floor(Math.random()* 1000);

// $('img').click(function() {
//   $(this).toggleClass('fast');
// })
// $('.rest-list').on('click', function() {
//   var $copy = $(this).clone();
//   $('header').append($copy);
//   $copy.append(description);
// });

var stonemenHide = function() {
  $('.abrasive').hide();
};

var linkHide = function() {
  $('.myst-link').hide();
};

var linkShow = function() {
  $('.myst-link').fadeIn(7000);
};

var stonemenShow = function() {
  $('.abrasive').show();
};

var animerror = function() {
  $('.notFound').animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 15000);
};


$('.notFound').click(function() {
  $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  // $(this).toggleClass('hover');
  $("html,body").animate({ scrollTop: 5000, scrollLeft: 5000 }, 15000);
})









// var stonemen = function() {
//   var stones = $('
//     <img src="http://fi.somethingawful.com/safs/titles/a3/4c/00188664.0006.gif" alt="Cat says 404 not found" class="preposterous2 block"/>');
//   $('header').append(stones);
// };


// var makeMiddleEarth = function () {
//    // create a section tag with an id of `middle-earth`
//   var middleEarth = $('<section id="middle-earth"></section>');
//     for (var i = 0; i < lands.length; i++) {
//       $(middleEarth).append('<article><h1>' + lands[i] + '</h1></article>');
//     }
//   $('body').append(middleEarth);
//    // add each land as an `article` tag
//    // inside each `article` tag include an `h1` with the name of the land
//    // append `middle-earth` to your document `body`
// };
//
// makeMiddleEarth();
// localStorage.setItem('lastMessageId', messageID);
// localStorage.getItem('lastMessageId', messageID);


$('#scroll').click(function() {
  $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  // $(this).toggleClass('hover');
  $("html,body").animate({ scrollTop: 5000, scrollLeft: 5000 }, 15000);
})

$('.notFound').click(function() {
  // $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  // $(this).removeClass('missing');
  $(this).addClass('missing2')
  $(this).animate({ left: "-=5000", top: '-=5000', borderWidth: "1px"}, 1500);

  // $("html,body").animate({ scrollTop: -5000, scrollLeft: -5000 }, 15000);
})

$('#dance').click(function() {
  // $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  // $(this).removeClass('missing');
  $('img').toggleClass('panda')
  // $("html,body").animate({ scrollTop: -5000, scrollLeft: -5000 }, 15000);
})

// var getMessage = $.ajax({
//   type: 'get',
//   dataType: 'json',
//   url: '/chat/last',
//   success: function(message) {
//       console.log(message);
//       // var latestMessage = $('<aside></aside>');
//       // var chatName = $('<div style="inline-block"></div>');
//       // chatName.html(message.chat_name + ": ");
//       // console.log(message.name);
//       // latestMessage.append(chatName);
//       // var theMessage = $('<div style="inline-block"></div>');
//       // theMessage.html(message.data);
//       // latestMessage.append(theMessage);
//       // $('#chatbox').append(latestMessage);
//       $('#chatbox').append('<p>' + message.chat_name + ":  " + message.data + '</p>');
//       // setTimeout(getMessage(), 500);
//
//     },
//     error: function(error) {
//       console.log(error);
//   }
// });

$.ajax({
type: 'get',
dataType: 'json',
url: '/chat/last',
success: function(message) {
    console.log(localStorage.getItem('lastMessageId'));

    if (message.id !== localStorage.getItem('lastMessageId')) {
      console.log(localStorage.getItem('lastMessageId'))
      $('#chatbox').append('<p>' + message.chat_name + ":  " + message.data + '</p>');
      localStorage.setItem('lastMessageId', message.id);
    }
    console.log('we ran it')
  },
  error: function(error) {
    console.log(error);
  }
});

var messageCheckInterval = setInterval(getMessage, 500);

function getMessage() {
  $.ajax({
    type: 'get',
    dataType: 'json',
    url: '/chat/last',
    success: function(response) {
      console.log(response.id);
      console.log('response id  -----------------------')
      console.log(typeof response.id)
      console.log(response)
      console.log('response data ---------------------')
      console.log(localStorage.getItem('lastMessageId'));
      console.log(typeof localStorage.getItem('lastMessageId'))
      console.log('--------------------')
      if (response.id.toString() !== localStorage.getItem('lastMessageId')) {
          // do your work in here
          console.log(response.id)
          console.log(localStorage.getItem('lastMessageId'))
          $('#chatbox').append('<p>' + '<span style="color: rgb(49, 176, 213)">' + response.chat_name + '</span>' + ":  " + response.data + '</p>');
          localStorage.setItem('lastMessageId', response.id);
        }
        console.log('getMessage callback ran');
    },
    error: function(err) {
      console.log(err);
    }
  });
}

// var  formData = "name=ravi&age=31";  //Name value Pair
//     or
//     var bla = $('#txt-msg').val();
// var formData = {name:"ravi",age:"31"}; //Array

// function sendChat() {
  $('#snd-btn').click(function() {
    var sendMessage = $('#txt-msg').val();
    console.log(sendMessage);
    $.ajax({
      url : "/chat/last",
      type: "post",
      data : {message: sendMessage},
      dataType : 'json',
      success: function(data)
      {
        console.log('post dataaaa------------------------')
        console.log(data.n)
      },
      error: function (error)
      {
        console.log(error)
      }
    });
  });
// };



// '<div class="chatName" style="inline">'

$('#chatToggle').click(function() {
	$('.chat').slideToggle();
})
