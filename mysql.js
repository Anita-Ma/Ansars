const mysql = require('mysql')

const conection = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'',
    database:'ansars'
})

conection.connect( (err) => {
    if(err) throw err
    console.log('La conexion funciona')
})

conection.query('SELECT * from Usuario', (err, rows) => {
    if(err) throw err
    console.log('Los datos de la tabla son estos:')
    console.log(rows)
    console.log('La cantidad de resultados es:')
    console.log(rows.length)
    const usuarioUno = rows[0]
    console.log(usuarioUno)
})

conection.end()