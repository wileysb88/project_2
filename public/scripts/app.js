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
  $("html,body").animate({ scrollTop: 5000, scrollLeft: 5000 }, 15000);
})


$('#scroll').click(function() {
  $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  $("html,body").animate({ scrollTop: 5000, scrollLeft: 5000 }, 15000);
})

$('.notFound').click(function() {
  $(this).addClass('missing2')
  $(this).animate({ left: "-=5000", top: '-=5000', borderWidth: "1px"}, 1500);

})

$('#dance').click(function() {
  $('img').toggleClass('panda')
})


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


$('#chatToggle').click(function() {
	$('.chat').slideToggle();
})
