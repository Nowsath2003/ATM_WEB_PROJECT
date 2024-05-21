<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select transaction type</title>
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
        display: grid;
        grid-template-areas: 
            'name name'
            'button1 button2'
            'button3 button4'
            'button5 button6'
            ;
        text-align: center;
    }
    .content>div{
        height: 60px;
        padding-top: 20px;
        
    }
    .name{
        grid-area: name;
        color: #333d79ff;
        font-weight: bold;
        line-height:25px;
        font-size: large;
    }
    .button1{
        grid-area: button1;
    }
    .button2{
        grid-area: button2;
    }
    .button3{
        grid-area: button3;
    }
    .button4{
        grid-area: button4;
    }
    .button5{
       
        grid-area: button5;
    }
    .button6{
        
        grid-area: button6;
    }

    .content button{
        width: 150px;
        height: 40px;
        background-color: #333d79ff;
        color: #faebefff;
        font-weight: bold;
        border-radius: 50px;
    }
    button:hover{
        cursor: pointer;
        color: #333d79ff;
        background-color: #faebefff;
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
    .input{
    	color: red;
    	text-transform: uppercase;
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
                				if (number != null) {
                    				out.println(number);
               					}
            				%> </span></div>

                <div class="button1"><a href="deposit.jsp?name=<%=name%>&number=<%=number %>"><button>DEPOSIT</button></a></div>
                <div class="button2"><a href="withdraw.jsp?name=<%=name%>&number=<%=number %>"><button>WITHDRAW</button></a></div>
                <div class="button3"><a href="fastcash.jsp?name=<%=name%>&number=<%=number %>"><button>FAST CASH</button></a></div>
               	
                <div class="button4"><a href="balance?name=<%=name%>&number=<%=number %>"><button>BALANCE</button></a></div>
               
                <div class="button5"><a href="changepin.jsp?name=<%=name%>&number=<%=number %>"><button>CHANGE PIN</button></a></div>
                <div class="button6"><a href="minitransaction?name=<%=name%>&number=<%=number %>"><button>MINI TRANSACTION</button></a></div>
            </div>
            <div class="logout">
                <a href="loginpage.jsp"><button>BACK</button></a>
                <a href="loginpage.jsp"><button>EXIT</button></a></div>

        </div>
    </div>
</body>

</html>