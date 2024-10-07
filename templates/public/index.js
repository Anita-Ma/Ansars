const images = document.querySelectorAll('.carousel-slide img');
const dots = document.querySelectorAll('.dot');
let currentIndex = 0;
const totalImages = images.length;

// Mostrar la imagen actual y ocultar las demás
function updateCarousel() {
    images.forEach((img, index) => {
        img.classList.remove('active');
        dots[index].classList.remove('active');
    });
    images[currentIndex].classList.add('active');
    dots[currentIndex].classList.add('active');
}

// Controles de las flechas
document.querySelector('.prev').addEventListener('click', () => {
    currentIndex = (currentIndex > 0) ? currentIndex - 1 : totalImages - 1;
    updateCarousel();
});

document.querySelector('.next').addEventListener('click', () => {
    currentIndex = (currentIndex < totalImages - 1) ? currentIndex + 1 : 0;
    updateCarousel();
});

// Cambiar de imagen al hacer clic en un punto
dots.forEach((dot, index) => {
    dot.addEventListener('click', () => {
        currentIndex = index;
        updateCarousel();
    });
});

// Cambio automático de imagen cada 3 segundos
setInterval(() => {
    currentIndex = (currentIndex < totalImages - 1) ? currentIndex + 1 : 0;
    updateCarousel();
}, 3000);

// Inicializar el carrusel
updateCarousel();