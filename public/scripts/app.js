window.onload = function() {

animerror();

};


var yaxix = Math.floor(Math.random()* 1000);
var xaxix = Math.floor(Math.random()* 1000);

// $('img').click(function() {
//   $(this).toggleClass('fast');
// })

var animerror = function() {
  $('.notFound').animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 15000);
};

$('.notFound').click(function() {
  $(this).animate({ left: "+=5000", top: '+=5000', borderWidth: "1px"}, 1500);
  // $(this).toggleClass('hover');
  $("html,body").animate({ scrollTop: 5000, scrollLeft: 5000 }, 15000);
})


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
