$(document).ready(function() {
    // Función para conectar a la base de datos y mostrar los resultados
    function mostrarResultados() {
        const mysql = require('mysql');

        const connection = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: '',
            database: 'ansars'
        });

        connection.connect((err) => {
            if (err) throw err;

            connection.query('SELECT * FROM Cliente', (err, rows) => {
                if (err) throw err;

                // Limpiar la tabla antes de agregar nuevos datos
                $('#resultados tbody').empty();

                // Iterar sobre los resultados y agregar filas a la tabla
                rows.forEach(row => {
                    $('#resultados tbody').append(`
                        <tr>
                            <td>${row.IdCliente}</td>
                            <td>${row.Nombre}</td>
                            <td>${row.Apellido}</td>
                            <td>${row.TipoIden}</td>
                            <td>${row.Identificacion}</td>
                            <td>${row.Correo}</td>
                            <td>${row.Contraseña}</td>
                            <td>${row.Telefono}</td>
                            <td>${row.Ciudad}</td>
                        </tr>
                    `);
                });

                connection.end();
            });
        });
    }

    // Llamar a la función para mostrar los resultados al cargar la página
    mostrarResultados();
});