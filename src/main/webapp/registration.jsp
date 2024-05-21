<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FBN-REGISTRATION</title>
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
        width: 50%;
        text-align: center;
    }
    .right{
        width: 50%;
    }
    .title{
        margin-top: 19%;
        color: #faebefff;
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-weight: bolder;
        line-height: 75px;
        font-size:50px;
    }
    .registration{
        border: 1px solid;
        margin: 10px 10px 10px 10px;
        height: 96%;
        border-radius: 20px;
        background-color: #faebefff;
        color: #333d79ff;
        text-align: center;
        box-shadow: -3px -3px black,3px 3px black;
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-weight: bolder;

    }
    .registration h1{
        text-align: center;
        margin-left: 5px;
    }
    tr{
        border-color: #faebefff;
        border-radius: 5px;
        height: 33px;
        text-align: end;
        color: #333d79ff;
        font-weight: bolder;
    }
    .box{
        color: red;
        font-weight: bold;
        height: 20px;
        font-size: medium;
        width: 98%;
    }
    form button{
        background-color: #333d79ff;
        color: #faebefff;
        border-radius: 10px;
        width: 35%;
        height: 30px;
       
    }
    
    .exit{
    	margin-top:5px;
    	width: 20%;
    	height: 25px;
    	background-color: #333d79ff;
        color: #faebefff;
        border-radius: 10px;
    	}
    button:hover{
    	cursor: pointer;
    }
    .error{
    	color: red;
    	size: x-small;
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
                <div class="registration">
                    <h2>REGISTRATION</h2>
                    <form class="form1" action="registration">
                        <table>
                            <tr>
                                <td>ID :</td>
                                <td><input class="box" type="text" name="id"required></td>
                            </tr>
                            <tr>
                                <td>NAME :</td>
                                <td><input class="box" type="text" name="name"required></td>
                            </tr>
                            <tr>
                                <td>AGE :</td>
                                <td><input class="box" type="number" name="age"required></td>
                            </tr>
                            <tr>
                                <td>PHONE NO :</td>
                                <td><input class="box" type="number" name="ph_num"required></td>
                            </tr>
                            <tr>
                                <td>EDUCATION :</td>
                                <td><select class="box" type="text" name="education" required>
                                    <option value=""></option>
                                    <option value="10th">10th</option>
                                    <option value="12th">12th</option>
                                    <option value="UG">UG</option>
                                    <option value="PG">PG</option></select>
                                </td>
                            </tr>
                            <tr>
                                <td>OCCUPATION :</td>
                                <td><input class="box" type="text" name="occupation"required></td>
                            </tr>
                            <tr>
                                <td>DOB :</td>
                                <td><input class="box" type="date" name="dob"required></td>
                            </tr>
                            <tr>
                                <td>CITY :</td>
                                <td><input class="box" type="text" name="city"required></td>
                            </tr>
                            <tr>
                                <td>PINCODE :</td>
                                <td><input class="box" type="number" name="pincode"required></td>
                            </tr>
                            <tr>
                                <td>SET PIN :</td>
                                <td><input class="box" type="number" name="pin" required></td>
                            </tr>
                        </table>
                        <div id="error-message" class="error">
           					 <% 
                				String errorMessage = (String) request.getAttribute("error");
                				if (errorMessage != null) {
                    				out.println(errorMessage);
               					}
            				%>
        				</div>
                        <button>REGISTER</button>
                        
                       
                    </form>
                    <a href="loginpage.jsp"><button class="exit">EXIT</button></a>
                </div>
            </div>

        </div>
    </div>
</body>
</html>