const botonesCarrito = document.querySelectorAll('.add-to-cart-btn');
							
botonesCarrito.forEach(boton => {
    boton.addEventListener('click', () => {
        alert('Producto añadido al carrito');
    });
});

// Mostrar/ocultar el menú desplegable del carrito
document.getElementById("cart-icon").addEventListener("click", function() {
    var dropdown = document.getElementById("cart-dropdown");
    if (dropdown.style.display === "none" || dropdown.style.display === "") {
        dropdown.style.display = "block";
    } else {
        dropdown.style.display = "none";
    }
});

// Función para actualizar el contador de artículos
function updateCartCount() {
    var cartItems = document.getElementById("cart-items");
    var itemCount = cartItems.getElementsByTagName("tr").length;
    document.getElementById("cart-count").textContent = itemCount;
}

// Vaciar el carrito
document.getElementById("clear-cart").addEventListener("click", function() {
    document.getElementById("cart-items").innerHTML = "";
    updateCartCount();
});

// Añadir productos al carrito
var addToCartButtons = document.querySelectorAll(".add-to-cart");
addToCartButtons.forEach(function(button) {
    button.addEventListener("click", function() {
        var productName = this.getAttribute("data-name");
        var productPrice = this.getAttribute("data-price");
        var productImage = this.getAttribute("data-image");

        var cartItems = document.getElementById("cart-items");

        // Crear una nueva fila para el producto
        var newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td><img src="${productImage}" class="cart-image"></td>
            <td>${productName}</td>
            <td>$${productPrice}</td>
            <td>1</td>
        `;

        cartItems.appendChild(newRow);
        updateCartCount();

        // Añadir funcionalidad de eliminación
        newRow.querySelector('.remove-item').addEventListener('click', function() {
            newRow.remove();
            updateCartCount();
        });
    });
});