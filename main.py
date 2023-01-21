from flask import Flask,jsonify,request
app = Flask(__name__)

# @app.route('/')
# def hello_world():
#     return 'Hello, World!'
# GET requests will be blocked
@app.route('/post', methods=['POST'])
def json_example():
    request_data = request.get_json()

    if request_data:
        li=list(request_data['input'])
        import pandas as pd
        df=pd.read_excel("d:mental_health/mental_health.xlsx")
        from sklearn.linear_model import LogisticRegression
        from sklearn.model_selection import train_test_split
        from sklearn.metrics import accuracy_score
        X=df.iloc[:,:-1].values
        y=df.iloc[:,-1].values
        X_train,X_test,y_train,y_test=train_test_split(X,y,random_state=10)
        from sklearn.preprocessing import StandardScaler
        scale=StandardScaler()
        X_train = scale.fit_transform(X_train)
        X_test = scale.transform(X_test)
        model=LogisticRegression(max_iter=513)
        model.fit(X_train,y_train)
        pred_train=model.predict(X_train)
        pred_test=model.predict([li])
        # print("Training Score : ",accuracy_score(y_train,pred_train))
        # print("Testing Score : ",accuracy_score(y_test,pred_test))
        return pred_test[0]      

    return '''
    Sorry no response !
    '''
if __name__=="__main__":
    app.run(debug=True,host="0.0.0.0")