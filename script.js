document.addEventListener("DOMContentLoaded", function() {
    window.addEventListener("scroll", function() {
        const header = document.querySelector("header");
        if (window.scrollY > 50) {
            header.classList.add("scrolled");
        } else {
            header.classList.remove("scrolled");
        }
    });
});

window.addEventListener("scroll", function() {
    const logoImg = document.getElementById("logo-img");

    if (window.scrollY > 0) {
        logoImg.src = "LOGO3rbg.png"; // New image on scroll
    } else {
        logoImg.src = "LOGO2rbg.png"; // Original image at the top
    }
});


let currentSlide = 0; // Start at the first slide
const slides = document.querySelectorAll('.slide'); // Select all slides
const totalSlides = slides.length; // Get the total number of slides

// Function to update the slide position
function updateSlidePosition() {
    // Calculate the new position of the slider
    const sliderWidth = 100; // Each slide takes 100% of the width
    const offset = -currentSlide * sliderWidth; // Calculate offset for current slide
    document.querySelector('.slider').style.transform = `translateX(${offset}%)`; // Move the slider
}

// Event listeners for navigation buttons
document.querySelector('.prev').addEventListener('click', () => {
    currentSlide = (currentSlide === 0) ? totalSlides - 1 : currentSlide - 1; // Go to the previous slide
    updateSlidePosition(); // Update the slide position
});

document.querySelector('.next').addEventListener('click', () => {
    currentSlide = (currentSlide === totalSlides - 1) ? 0 : currentSlide + 1; // Go to the next slide
    updateSlidePosition(); // Update the slide position
});

// Optional: Automatic slide change every 5 seconds
setInterval(() => {
    currentSlide = (currentSlide === totalSlides - 1) ? 0 : currentSlide + 1; // Move to the next slide
    updateSlidePosition(); // Update the slide position
}, 5000);

// JavaScript to toggle header background on scroll
window.addEventListener('scroll', function () {
    const header = document.querySelector('header');
    if (window.scrollY > 50) { // Adjust scroll position as needed
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

// Get the header element
const header = document.getElementById('header');

// Listen for the scroll event
window.addEventListener('scroll', () => {
    // Check if the page has been scrolled down 50 pixels or more
    if (window.scrollY > 50) {
        header.classList.add('scrolled'); // Add the 'scrolled' class
    } else {
        header.classList.remove('scrolled'); // Remove the 'scrolled' class
    }
});

// Select the sidebar and toggle button
const sidebar = document.querySelector('.sidebar');
const toggle = document.querySelector('.toggle');

// Add event listener to the toggle button
toggle.addEventListener('click', () => {
    // Toggle the 'active' class on the sidebar
    sidebar.classList.toggle('active');
    
    // Toggle the 'open' class on the toggle button for animation
    toggle.classList.toggle('open');
});


document.addEventListener('DOMContentLoaded', function () {
    const swiper = new Swiper('.swiper', {
        slidesPerView: 3,          // Default number of slides per view
        spaceBetween: 20,          // Space between slides
        loop: true,                // Enable looping of slides
        autoplay: {
            delay: 3000,           // Autoplay delay in milliseconds
            disableOnInteraction: false, // Autoplay continues after interaction
        },
        navigation: {
            nextEl: '.swiper-button-next', // Next button selector
            prevEl: '.swiper-button-prev', // Previous button selector
        },
        // Removed pagination to only allow swipe navigation
        simulateTouch: true,       // Allow mouse dragging
        grabCursor: true,          // Show grab cursor for interactive feel

        breakpoints: {
            1024: {
                slidesPerView: 2, // Adjust slides per view for larger screens
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 1, // One slide per view for medium screens
                spaceBetween: 15,
            },
            480: {
                slidesPerView: 1, // One slide per view for mobile
                spaceBetween: 10,
            },
        },
    });

    // Pause autoplay on hover
    document.querySelector('.swiper').addEventListener('mouseenter', () => {
        swiper.autoplay.stop();
    });

    // Resume autoplay on mouse leave
    document.querySelector('.swiper').addEventListener('mouseleave', () => {
        swiper.autoplay.start();
    });
});






