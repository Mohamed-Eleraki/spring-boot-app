from flask import Flask
import psycopg2

app = Flask(__name__)

def connect_db():
    try:
        conn = psycopg2.connect(
            host="terraform-20241005095652655600000004.cjeqis2oi24n.us-east-1.rds.amazonaws.com",
            database="postgres",  
            user="postgres",      
            password="vIv8GrbF}WqKOk|lyAJh2e:]%YHR" 
        )
        return "Connected to the database!"
    except Exception as e:
        return f"Failed to connect: {str(e)}"

@app.route('/')
def index():
    return connect_db()

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
