<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="javafile.MTransaction" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FBN-MINI TRANSACTION</title>
</head>
<style>
    body {
        margin: 0px;
        
    }
    .atm{
        padding: 100px 25%;
        
    }
    .transaction {
        overflow: hidden;
        height: 500px;
        width: 100%;
        border-radius: 30px;
        box-shadow: 5px 5px black;
        background-color: #333d79ff;
    }

    .header{
        height: 23%;
        width: 100%;
        color: #faebefff;
        text-align: center;
        line-height: 0px;
        overflow: hidden;

    }
    p:nth-child(1){
        font-size: 50px;
    }

    .content{
        background-color: #faebefff;
        text-align: center;
        height: 320px;
    }
    .content>div{
        padding-top: 10px;
        
    }
    .name{
        grid-area: name;
        color: #333d79ff;
        font-weight: bold;
        line-height:25px;
        font-size: large;
    }
    table{
        display: flex;
        justify-content: center;
    }
    th{
        width: 140px;
        background-color: #333d79ff;
        color: #faebefff;
    }
    td{
        border: 1px solid #333d79ff;
        color: #333d79ff;
        font-weight: bold;
    }
    .input{
    	color: red;
    	text-transform: uppercase;
    }
    
    button:hover{
    	cursor: pointer;
    }

    .logout{
        width: 100%;
        margin-top: 20px;
        display: flex;
        justify-content: space-evenly;
    }
    .logout button{
        background-color: #faebefff;
        color: #333d79ff;
        font-weight: bold;
    }



</style>

<body>
    <div class="atm">
        <div class="transaction">
            <div class="header">
                <p>FIRST BANK OF NOWSA</p>
                <p style="color: yellow;">(ATM WEB PROJECT)</p>
            </div>
            <div class="content">
                <div class="name">NAME: <span class="input"> <% 
                				String name = (String) request.getAttribute("name");
                				if (name != null) {
                    				out.println(name);
               					}
            				%></span> <br>ACCOUNT NUMBER: <span class="input"> <% 
        						String number = (String) request.getAttribute("number");
            					if(number!=null){
            						out.println(number);
            					}
    						%> </span></div>
                <div>
                    <span style="color: red;font-weight: bold;">LAST 5 TRANSACTION</span>
                    <table>
                        <tr>
                            <th>TIME</th>
                            <th>ID</th>
                            <th>AMOUNT</th>
                            <th>TYPE</th>
                            <th>BALANCE</th>
                        </tr>
                         <%
            				List<MTransaction> userList = (List<MTransaction>) request.getAttribute("userList");
            				if (userList != null) {
                				for (MTransaction transaction : userList) {
       					 %>
          				<tr>
                			<td><%= transaction.getTime() %></td>
                			<td><%= transaction.getId() %></td>
                			<td><%= transaction.getAmount() %></td>
                			<td><%= transaction.getType() %></td>
                			<td><%= transaction.getBalance() %></td>
            			</tr>
        				<%
                				}
            				}
        				%>
                    </table>
                </div>
            </div>
            <div class="logout">
                <a href="transaction?name=<%=name%>&number=<%=number %>"><button>BACK</button></a>
                <a href="loginpage.jsp"><button>EXIT</button></a></div>

        </div>
    </div>
</body>

</html>