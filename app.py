from flask import Flask, jsonify
import MySQLdb

app = Flask(__name__)

def get_db_connection():
    db = MySQLdb.connect(
        host='mysql_db',  # container name, not localhost
        user='root',
        password='root',
        db='mydatabase'
    )
    return db

@app.route('/')
def index():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute('SELECT * FROM mytable')  # Replace with your table query
    results = cursor.fetchall()
    cursor.close()
    connection.close()

    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)