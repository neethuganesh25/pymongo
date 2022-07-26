from flask import Flask,render_template
import pymongo
connection=pymongo.MongoClient("mongodb://localhost:27017")
mydb=connection["empDb"]
myemployee=mydb["employees"]

app = Flask(__name__)
@app.route("/display")
def display():
    result=myemployee.find({},{"_id":0}).sort("Name",-1)
    datalist=[]
    for i in result:
        datalist.append(i)
           
    return render_template("display.html",data=datalist)

@app.route("/")
def hello_world():
    return render_template("index.html")
app.run()
