//   function updateCartBadge() {
//        // Fetch the number of items in the cart from the server
//        fetch('get_cart_count.jsp')
//            .then(response => response.text())
//            .then(count => {
//                const badge = document.getElementById('cart-badge');
//                badge.textContent = count;
//                badge.style.display = count > 0 ? 'inline-block' : 'none';
//            })
//            .catch(error => {
//                console.error('Error fetching cart count:', error);
//            });
//    }
//
//    // Call updateCartBadge function on page load
//    window.addEventListener('DOMContentLoaded', updateCartBadge);
//    






// Function to update cart badge
function updateCartBadge() {
    fetch('get_cart_count.jsp')
        .then(response => response.text())
        .then(count => {
            const badge = document.getElementById('cart-badge');
            badge.textContent = count;
            badge.style.display = count > 0 ? 'inline-block' : 'none';
        })
        .catch(error => {
            console.error('Error fetching cart count:', error);
        });
}

// Function to automatically update cart badge
function autoUpdateCartBadge() {
    updateCartBadge(); // Update immediately
    setInterval(updateCartBadge, 1000); // Update every 10 seconds
}

// Call autoUpdateCartBadge function on page load
window.addEventListener('DOMContentLoaded', autoUpdateCartBadge);




































       
       
       
       
       // --------------slider Start-------------------

  
   // script.js
   document.addEventListener('DOMContentLoaded', function() {
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.style.opacity = i === index ? '1' : '0';
        });
    }

    // Show the first slide initially
    showSlide(currentSlide);

    // Event listeners for arrow keys
    document.addEventListener('keydown', function(event) {
        if (event.key === 'ArrowLeft') {
            currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Loop back to the last slide
            showSlide(currentSlide);
        } else if (event.key === 'ArrowRight') {
            currentSlide = (currentSlide + 1) % slides.length; // Loop to the first slide
            showSlide(currentSlide);
        }
    });

    // Event listeners for arrow icons
    document.getElementById('prev').addEventListener('click', function() {
        currentSlide = (currentSlide - 1 + slides.length) % slides.length; // Loop back to the last slide
        showSlide(currentSlide);
    });

    document.getElementById('next').addEventListener('click', function() {
        currentSlide = (currentSlide + 1) % slides.length; // Loop to the first slide
        showSlide(currentSlide);
    });
});

// --------------slider End-------------------





// --------------menu bar-------------------

document.addEventListener('DOMContentLoaded', function() {
    const hamburgerMenu = document.querySelector('.hamburger-menu');
    const navLinks = document.querySelector('.nav-links');

    hamburgerMenu.addEventListener('click', function() {
        navLinks.classList.toggle('show');
    });
});







// =========== ye hmko nhi patta============

// document.addEventListener('DOMContentLoaded', function () {
//     var mySwiper = new Swiper('.swiper-container', {
//       // Optional parameters
//       loop: true,
  
//       // If you need pagination
//       pagination: {
//         el: '.swiper-pagination',
//       },
  
//       // Navigation arrows
//       navigation: {
//         nextEl: '.swiper-button-next',
//         prevEl: '.swiper-button-prev',
//       },
//     });
//   });
  
  
// =========== ye hmko nhi patta============

  
  
  
// document.addEventListener('DOMContentLoaded', function() {
//   const container = document.querySelector('.category-container');
//   const leftArrow = document.querySelector('.arrow-button.left');
//   const rightArrow = document.querySelector('.arrow-button.right');
//   const categoryItems = document.querySelectorAll('.category-item');
//   const itemWidth = categoryItems[0].offsetWidth; // Width of one item
//   const scrollAmount = itemWidth * 4; // Width of four items

//   // Smooth scrolling function
//   function smoothScroll(target, duration) {
//       const start = container.scrollLeft;
//       const change = target - start;
//       let startTime = null;

//       function animateScroll(currentTime) {
//           if (!startTime) startTime = currentTime;
//           const elapsed = currentTime - startTime;
//           const progress = Math.min(elapsed / duration, 1);
//           container.scrollLeft = start + change * progress;
//           if (progress < 1) {
//               window.requestAnimationFrame(animateScroll);
//           }
//       }

//       window.requestAnimationFrame(animateScroll);
//   }

//   leftArrow.addEventListener('click', function() {
//       smoothScroll(container.scrollLeft - scrollAmount, 500); // 500ms duration
//   });

//   rightArrow.addEventListener('click', function() {
//       smoothScroll(container.scrollLeft + scrollAmount, 500); // 500ms duration
//   });
// });









// ===========Religious Category==============



document.addEventListener('DOMContentLoaded', function() {
    const container = document.querySelector('.category-container');
    const leftArrow = document.querySelector('.arrow-button.left');
    const rightArrow = document.querySelector('.arrow-button.right');
    const categoryItems = document.querySelectorAll('.category-item');
    const itemWidth = categoryItems[0].offsetWidth + 20; // Width of one item with margin

    let currentIndex = 0;

    leftArrow.addEventListener('click', function() {
        if (currentIndex > 0) {
            currentIndex--;
            smoothScroll(currentIndex * itemWidth, 500); // 500ms duration
        }
    });

    rightArrow.addEventListener('click', function() {
        if (currentIndex < categoryItems.length - 1) {
            currentIndex++;
            smoothScroll(currentIndex * itemWidth, 500); // 500ms duration
        }
    });

    // Smooth scrolling function
    function smoothScroll(target, duration) {
        const start = container.scrollLeft;
        const change = target - start;
        let startTime = null;

        function animateScroll(currentTime) {
            if (!startTime) startTime = currentTime;
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            container.scrollLeft = start + change * progress;
            if (progress < 1) {
                window.requestAnimationFrame(animateScroll);
            }
        }

        window.requestAnimationFrame(animateScroll);
    }
});

// ===========Religious Category==============
 
       