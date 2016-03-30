window.onload = function() {

animerror();
stonemenHide();
linkHide();

setTimeout(stonemenShow(), 30000);
setTimeout(linkShow(), 10000);


};


var yaxix = Math.floor(Math.random()* 1000);
var xaxix = Math.floor(Math.random()* 1000);

// $('img').click(function() {
//   $(this).toggleClass('fast');
// })


var stonemenHide = function() {
  $('.abrasive').hide();
};

var linkHide = function() {
  $('.myst-link').hide();
};

var linkShow = function() {
  $('.myst-link').fadeIn(2000);
};

var stonemenShow = function() {
  $('.abrasive').show();
};

var animerror = function() {
  $('.notFound').animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 15000);
};

stonemenHide();

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
