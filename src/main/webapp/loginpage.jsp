<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FBN-LOGIN</title>
</head>
<style>
    body{
        width: 100%;
        height: 100%;
        overflow: hidden;
    }
    .atm{
        width: 100%;
        height: 100%;
        margin: 100px 25%;
    }
    .interface{
        height: 500px;
        width: 50%;
        overflow: hidden;
        display: flex;
        border-radius: 30px;
        box-shadow: 5px 5px black;
        /* background-image: linear-gradient(130deg,blue,blue,rgb(104, 104, 222),blue,blue,blue,blue,blue,blue,rgb(104, 104, 222),blue,blue); */
        background-color: #333d79ff;
    }
    .left{
        width: 75%;
        text-align: center;
    }
    .right{
        width: 50%;
    }
    .title{
        margin-top: 19%;
        /* color: white; */
        color: #faebefff;
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-weight: bolder;
        line-height: 75px;
        font-size:50px;
    }
    .login{
        border: 1px solid;
        margin: 110px 50px 0px 20px;
        height: 250px;
        border-radius: 20px;
        background-color: #faebefff;
        text-align: center;
        color: #333d79ff;
        box-shadow: 3px 3px black;
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-weight: bolder;

    }
    #textbox{
        margin-bottom: 20px;
        border-color: blue;
        border-radius: 5px;
        height: 20px;
        text-align: center;
        color: #333d79ff;
        font-weight: bolder;
    }
    .error{
        /* display: none; */
        color: red;
        font-size: small;
        
    }
    button{
        background-color: #333d79ff;
        color: #faebefff;
        border-radius: 10px;
        width: 50%;
        height: 30px;
    }
    button:hover{
    	cursor: pointer;
    }
    
</style>
<body>
    <div class="atm">
        <div class="interface">
            <div class="left">
                <h1 class="title">FIRST BANK <br> OF <br> NOWSA</h1>
                <h2 style="color: rgb(255, 251, 0);">(ATM WEB PROJECT)</h2>
            </div>
            <div class="right">
                <div class="login">
                    <h1>LOGIN</h1>
                    <form action="loginpage">
                        <input type="text" id="textbox" name="username" placeholder="USER ID" required>
                        <input type="password" id="textbox" name="pass" placeholder="PIN" required>
                         <div id="error-message" class="error">
           					 <% 
                				String errorMessage = (String) request.getAttribute("error");
                				if (errorMessage != null) {
                    				out.println(errorMessage);
               					}
            				%>
        				</div>
                        <button >LOG IN</button>
                        <p>New User? <a href="registration.jsp">Register here</a></p>
                    </form>
                </div>
            </div>

        </div>
    </div>
</body>
</html>