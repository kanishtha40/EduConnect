// Show Login form
function showLogin() {
    document.getElementById('modal-container').style.display = 'flex';
    document.querySelector('.main-div').classList.add('blur-background'); // Add blur to background content
    document.getElementById('login-form').style.display = 'block';
    document.getElementById('register-form').style.display = 'none';
    
}

// Show Register form
function showRegister() {
    document.getElementById('modal-container').style.display = 'flex';
    document.querySelector('.main-div').classList.add('blur-background'); // Add blur to background content
    document.getElementById('register-form').style.display = 'block';
    document.getElementById('login-form').style.display = 'none';
}

// Close Modal
function closeModal() {
    document.getElementById('modal-container').style.display = 'none';
    document.querySelector('.main-div').classList.remove('blur-background'); // Remove blur from background content
}
const images = ["firstimg.jpg", "secondimg.jpg", "thirdimg.jpg"];
  let currentImageIndex = 0;

  const slideshowImage = document.getElementById("slideshow-image");

  setInterval(() => {
    currentImageIndex = (currentImageIndex + 1) % images.length;
    slideshowImage.src = images[currentImageIndex];
  }, 2000); // Change image every 2 seconds



  document.querySelector('form[action="register"]').addEventListener('submit', function (e) {
    const nameInput = document.getElementById('register-name').value.trim();
  
    if (/[^A-Za-z\s]/.test(nameInput)) {
      e.preventDefault();
      alert('Name must contain only letters and spaces.');
    }
  });
  
  document.getElementById('register-name').addEventListener('input', function () {
    this.value = this.value.replace(/[^A-Za-z\s]/g, '');
  });
  