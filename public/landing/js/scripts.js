/*================
 Template Name: AgencyCo Digital Agency and Marketing
 Description: AgencyCo is digital agency and marketing template.
 Version: 1.0
 Author: https://themeforest.net/user/themetags
 =======================*/

// TABLE OF CONTENTS
// 1. fixed navbar
// 2. page scrolling feature
// 3. closes the responsive menu on menu item click
// 4. magnify popup video
// 5. client testimonial slider
// 6. custom counter js
// 7. client-testimonial one item carousel
// 8. our clients logo carousel
// 9. Contact form
// 10. Get a quote form

jQuery(function ($) {

    'use strict';
    // 1. fixed navbar
    $(window).on( 'scroll', function () {
        // checks if window is scrolled more than 500px, adds/removes solid class
        if ($(this).scrollTop() > 60) {
            $('.navbar').addClass('affix');
        } else {
            $('.navbar').removeClass('affix');
        }
    });


    // 2. page scrolling feature - requires jQuery Easing plugin
    $(function() {
        $(document).on('click', 'a.page-scroll', function(event) {
            var $anchor = $(this);
            $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top-60
            }, 900, 'easeInOutExpo');
            event.preventDefault();
        });
    });

    // 3. closes the responsive menu on menu item click
    $(".navbar-nav li a").on("click", function(event) {
        if (!$(this).parent().hasClass('dropdown'))
            $(".navbar-collapse").collapse('hide');
    });

    // 4. magnify popup video
    $('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
    });

    // 5. client testimonial slider
    $('.client-testimonial').owlCarousel({
      loop: true,
      margin: 30,
      nav: true,
      dots: false,
      responsiveClass: true,
      autoplay: true,
      autoplayHoverPause: true,
      lazyLoad: true,
      responsive: {
        0: {
          items: 1
        },
        500: {
          items: 1
        },
        600: {
          items: 2
        },
        800: {
          items: 2
        },
        1200: {
          items: 3
        }
      }
    })

   // 6. custom counter js with scrolling
    var isFirstTime = true;
    var interval = null;
    var countSelector = $('.single-counter > span, .single-card > h3');
    if(countSelector.length) {
        var startingTop = countSelector.offset().top - window.innerHeight;
        if(startingTop > 0) {
            $(window).on( 'scroll', function() {
                if (isFirstTime && $(window).scrollTop() > startingTop) {
                    startCounting();
                    isFirstTime = false;
                }
            });
        } else{
            startCounting();
        }
    }

    /**
     * Get the increment value
     * @param value
     * @returns {number}
     */
    function incrementValue(value) {
        var incVal = 0;
        if(Math.ceil(value / 2) <= 5){ // upto 10
            incVal = 1;
        }
        else if(Math.ceil(value / 10) <= 10) { // up to 100
            incVal = 10;
        }
        else if(Math.ceil(value / 100) <= 10) { // up to 1000
            incVal = 25;
        }
        else if(Math.ceil(value / 100) <= 100) { // up to 10000
            incVal = 50;
        }
        else if(Math.ceil(value / 1000) <= 100) { // up to 100000
            incVal = 150;
        }
        else {
            incVal = 500;
        }
        return incVal;
    }

    /**
     * To start count
     * @param counters all selectors
     * @param start int
     * @param value int
     * @param id int
     */
    function count(counters, start, value, id) {
        var localStart = start;
        var inc = incrementValue(value);
        interval = setInterval(function() {
            if (localStart < value) {
                localStart = localStart+inc;
                counters[id].innerHTML = localStart;
            }
        }, 40);
    }

    /**
     * Start the count
     */
    function startCounting() {
        var counters = $(".single-counter > span, .single-card > h3");
        var countersQuantity = counters.length;
        var counter = [];

        // get al counts from HTML count
        for (var i = 0; i < countersQuantity; i++) {
            counter[i] = parseInt(counters[i].innerHTML);
        }

        // calling all count function
        for (var j = 0; j < countersQuantity; j++) {
            count(counters, 0, counter[j], j);
        }
    }

    // 7. client-testimonial one item carousel
    $('.client-testimonial-1').owlCarousel({
        loop:true,
        margin:30,
        nav: false,
        responsiveClass:true,
        autoplay:true,
        autoplayHoverPause:true,
        lazyLoad:true,
        items:1,
    })

    // 8. our clients logo carousel
    $('.clients-carousel').owlCarousel({
        autoplay: true,
        loop: true,
        margin:15,
        dots:true,
        slideTransition:'linear',
        autoplayTimeout:4500,
        autoplayHoverPause:true,
        autoplaySpeed:4500,
        responsive:{
            0:{
                items:2
            },
            500: {
                items:3
            },
            600:{
                items:4
            },
            800:{
                items:5
            },
            1200:{
                items:6
            }

        }
    })

    // 9. contact form
    if($("#contactForm1").length) {
        $("#contactForm1").validator().on("submit", function (event) {
            if (event.isDefaultPrevented()) {
            // handle the invalid form...
                submitMSG(false, "#contact");
            } else {
            // everything looks good!
                event.preventDefault();
                submitContactForm();
            }
        });
    }


    function submitContactForm(){
        // Initiate Variables With Form Content
        var name     = $('#contactForm1 input[name="name"]').val();
        var email    = $('#contactForm1 input[name="email"]').val();
        var message  = $('#contactForm1 textarea[name="message"]').val();
        var company  = "";
        if($('#contactForm1 input[name="phone"]').length) {
            company  = $('#contactForm1 input[name="company"]').val();
        }
        var phone  = "";
        if($('#contactForm1 input[name="phone"]').length) {
            phone  = $('#contactForm1 input[name="phone"]').val();
        }

        // use cookie to save the form data and set at the next page load
        var saveInfo = false;
        if (!$('#contactForm1 #checkInfo').is(":checked")) {
            saveInfo = true;
        }

        $.ajax({
            type: "POST",
            url: "libs/contact-form-process.php",
            data: "name=" + name + "&email=" + email + "&company=" + company + "&phone=" + phone + "&message=" + message,
            success : function(text){
                if (text == "success"){
                    formSuccess();
                } else {
                    submitMSG(false, "#contact");
                }
            }
        });
    }

    function formSuccess(){
        $("#contactForm1")[0].reset();
        submitMSG(true, "#contact");
    }

    function submitMSG(valid, parentSelector){
        if(valid){
            $(parentSelector + " .message-box").removeClass('d-none').addClass('d-block ');
            $(parentSelector + " .message-box div").removeClass('alert-danger').addClass('alert-success').text('Form submitted successfully');
        } else {
            $(parentSelector + " .message-box").removeClass('d-none').addClass('d-block ');
            $(parentSelector + " .message-box div").removeClass('alert-success').addClass('alert-danger').text('Found error in the form. Please check again.');
        }
    }

    // 10. Get a Quote
    if($("#getQuoteFrm").length) {
        $("#getQuoteFrm").validator().on("submit", function (event) {
            if (event.isDefaultPrevented()) {
            // handle the invalid form...
                submitMSG(false, ".sign-up-form-wrap");
            } else {
            // everything looks good!
                event.preventDefault();
                submitGetQuoteForm();
            }
        });
    }

    function submitGetQuoteForm(){
        // Initiate Variables With Form Content
        var name = $('#getQuoteFrm input[name="name"]').val();
        var email = $('#getQuoteFrm input[name="email"]').val();
        var subject = $('#getQuoteFrm input[name="subject"]').val();
        var message = $('#getQuoteFrm textarea[name="message"]').val();
        
        if (!$('#exampleCheck1').is(":checked")) {
            submitMSG(false, ".sign-up-form-wrap");
            return;
        }

        $.ajax({
            type: "POST",
            url: "libs/quote-form-process.php",
            data: "name=" + name + "&email=" + email + "&subject=" + subject + "&message=" + message,
            success : function(text){
                if (text == "success"){
                    quoteFormSuccess();
                } else {
                    submitMSG(false, ".sign-up-form-wrap");
                }
            }
        });
    }

    function quoteFormSuccess(){
        $("#getQuoteFrm")[0].reset();
        submitMSG(true, ".sign-up-form-wrap");
    }


}); // JQuery end