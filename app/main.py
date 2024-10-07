from flask import Flask, request, render_template, redirect, url_for
from confiDB import *
import bcrypt

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('public/index.html')

@app.route('/index.js')
def indexjs():
    return render_template('public/index.js')



@app.route('/registro.html')
def registro():
    return render_template('public/registro.html')

def hash_password(valor6):
    password_encoded = valor6.encode()
    
    salt = bcrypt.gensalt(10)
    
    hashed_password = bcrypt.hashpw(password_encoded, salt)
    return hashed_password.decode()

@app.route('/form', methods=['GET', 'POST'])
def registrarForm():
    msg=''
    if request.method == 'POST':
        valor1  =int(request.form['iden'])
        valor2  =request.form['nomb']
        valor3  =request.form['apel']
        valor4  =request.form['tipo']   
        valor5  =request.form['emai']
        valor6  =request.form['pass']
        valor7  =request.form['rol']
        valor8  =int(request.form['tele'])
        valor9  =request.form['ciud']
        print(valor1,valor2,valor3,valor4,valor5,valor6,valor7,valor8,valor9)
        
        hashed_password = hash_password(valor6)
        
        conexion_Mysqldb = connectionBD()
        cursor           = conexion_Mysqldb.cursor(dictionary=True)

        sql         = ("INSERT INTO Usuario (Identificacion, Nombre, Apellido, TipoIden, Correo, Contraseña, rol, Telefono, Ciudad) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)")
        valores     = (valor1, valor2, valor3, valor4, valor5, hashed_password, valor7, valor8, valor9)
        cursor.execute(sql, valores)
        conexion_Mysqldb.commit()
        cursor.close()
        conexion_Mysqldb.close()
        msg='Registro Grabado'
        print(msg)
        return render_template('public/registro.html', msg='formulario enviado')
    else:
        return render_template('public/registro.html', msg='Metodo http errado')

@app.route('/ingreso.html')
def ingreso():
    return render_template('public/ingreso.html')

@app.route('/ingreso.html', methods=['GET', 'POST'])
def ingreso1():
    msg = ''
    if request.method == 'POST':
        user = request.form['emai']  # El email ingresado
        password = request.form['pass']  # La contraseña ingresada

        # Conectar a la base de datos
        conexion_Mysqldb = connectionBD()
        cursor = conexion_Mysqldb.cursor(dictionary=True)

        # Buscar usuario por email
        sql = "SELECT * FROM Usuario WHERE Correo = %s"
        cursor.execute(sql, (user,))
        user_record = cursor.fetchone()

        cursor.close()
        conexion_Mysqldb.close()

        # Si el usuario existe, verificar la contraseña
        if user_record:
            hashed_password = user_record['Contraseña']  # Contraseña hasheada de la BD

            # Verificar la contraseña ingresada con la almacenada
            if bcrypt.checkpw(password.encode(), hashed_password.encode()):
                msg = 'Inicio de sesión exitoso'
                return redirect(url_for('catalogo'))  # Redirigir si es correcto
            else:
                msg = 'Contraseña incorrecta'
        else:
            msg = 'El usuario no existe'
    return render_template('public/ingreso.html', msg=msg)


@app.route('/catalogo.html')
def catalogo():
    return render_template('public/catalogo.html')

@app.route('/carrito.js')
def carritojs():
    return render_template('public/carrito.js')

@app.route('/detalles_pedido_usuario.html')
def detalle():
    return render_template('public/detalles_pedido_usuario.html')

@app.route('/conocenos.html')
def conocenos():
    return render_template('public/conocenos.html')

@app.route('/contactenos.html')
def contactenos():
    return render_template('public/contactenos.html')

if __name__=='__main__':
    app.run(debug=True, port=8099)