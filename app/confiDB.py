import mysql.connector   

def connectionBD():
    mydb=mysql.connector.connect(
    #mydb = mysql.connector.Connect(
        host = 'localhost',
        user = 'root',
        passwd = '',
        database = 'ansars'
    )
    if mydb:
        print('Si hay conexión')
    else:
        print('No hay conexión')
    return mydb