$(document).ready(function () {

  $('#menu').click(function () {
    $(this).toggleClass('fa-times');
    $('.navbar').toggleClass('nav-toggle');
  });

  $(window).on('scroll load', function () {
    $('#menu').removeClass('fa-times');
    $('.navbar').removeClass('nav-toggle');
  });

  $('.portfolio .button-container .btn').click(function () {

    let filter = $(this).attr('data-filter');

    if (filter == 'all') {
      $('.portfolio .image-container .box').show('400')
    } else {
      $('.portfolio .image-container .box').not('.' + filter).hide('200');
      $('.portfolio .image-container .box').filter('.' + filter).show('400');
    }

  });

  $('#theme-toggler').click(function () {
    $(this).toggleClass('fa-sun');
    $('body').toggleClass('dark-theme');
  });

  // smooth scrolling 

  $('a[href*="#"]').on('click', function (e) {

    e.preventDefault();

    $('html, body').animate({

      scrollTop: $($(this).attr('href')).offset().top,

    },
      500,
      'linear'
    );

  });

});



// -----------------------------------------------------------------------------------------------about me nav bar-------------------------------------------------------------------------------------
var tablinks = document.getElementsByClassName("tab-links")
var tabcontents = document.getElementsByClassName("tab-contents")
function opentab(tabname) {
  for (tablink of tablinks) {
    tablink.classList.remove("active");
  }
  for (tabcontent of tabcontents) {
    tabcontent.classList.remove("active-tab");
  }
  event.currentTarget.classList.add("active");
  document.getElementById(tabname).classList.add("active-tab");
}




// -------------------------------------------------------------------------------------skill----------------------------------------------------------------------------------------------------

function isElementInViewport(element) {
  var rect = element.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
}

var skills = document.querySelectorAll(".skill-progress");

function animateBars() {
  for (var i = 0; i < skills.length; i++) {
    if (isElementInViewport(skills[i])) {
      var percentage = skills[i].getAttribute("data-percentage");
      skills[i].style.width = percentage + "%";
      skills[i].classList.add("animate");
    }
  }
}

window.addEventListener('scroll', animateBars);







// -------------------------------------------------------------------------------------------show more----------------------------------------------------------------------------------------------
function toggleProjects() {
  var hiddenProjects = document.querySelectorAll('.hidden-projects');
  var showMoreButton = document.getElementById("show-more");
  hiddenProjects.forEach(function (project) {
    project.style.display = (project.style.display === 'none') ? 'list-item' : 'none';
  });
  showMoreButton.innerHTML = (showMoreButton.innerHTML === 'See More') ? 'See Less' : 'See More';
}

function toggleText1() {
  var hiddenText = document.getElementById("hidden-text1");
  var showMoreButton = document.getElementById("show-more1");
  if (hiddenText.style.display === "none") {
    hiddenText.style.display = "block";
    showMoreButton.innerHTML = "See less";
  } else {
    hiddenText.style.display = "none";
    showMoreButton.innerHTML = "See more";
  }
}

function toggleText2() {
  var hiddenText = document.getElementById("hidden-text2");
  var showMoreButton = document.getElementById("show-more2");
  if (hiddenText.style.display === "none") {
    hiddenText.style.display = "block";
    showMoreButton.innerHTML = "See less";
  } else {
    hiddenText.style.display = "none";
    showMoreButton.innerHTML = "See more";
  }
}


// ------------------------------------------------------------------------------------Contact me-----------------------------------------------------------------------
const scriptURL = 'https://script.google.com/macros/s/AKfycbzaofJv8ksUT7ZdOZodQHa6UBcVeGfl0L4IotEa1EwiaYvedoZyTUvx50H46uKT0zTLpg/exec'
const form = document.forms['submit-to-google-sheet']
const mssg = document.getElementById("mssg")
form.addEventListener('submit', e => {
  e.preventDefault()
  fetch(scriptURL, { method: 'POST', body: new FormData(form) })
    .then(response => {
      mssg.innerHTML = "Message Sent Sucessfully"
      setTimeout(function () {
        mssg.innerHTML = ""
      }, 5000)
      form.reset()
    })
    .catch(error => console.error('Error!', error.message))
})







// ------------------------------------------------------------------------------opening----------------------------------

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    console.log(entry)
    if (entry.isIntersecting) {
      entry.target.classList.add('show');
    }

  });
});

const hiddenElements = document.querySelectorAll(".hidden");
hiddenElements.forEach((el) => observer.observe(el));

const hiddenElements1 = document.querySelectorAll(".hidden1");
hiddenElements1.forEach((el) => observer.observe(el));



// -------------------------------------------------------------------------------preloader-------------------------------

var loader = document.getElementById("preloader");

window.addEventListener("load", function () {
  loader.style.display = "none";
})




