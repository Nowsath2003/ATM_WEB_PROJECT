<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FBN-DEPOSIT</title>
    <style>
        /* Add your styles here */
        body {
            margin: 0px;
        }
        .atm {
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
        .header {
            height: 23%;
            width: 100%;
            color: #faebefff;
            text-align: center;
            line-height: 0px;
            overflow: hidden;
        }
        p:nth-child(1) {
            font-size: 50px;
        }
        .content {
            background-color: #faebefff;
            height: 320px;
            text-align: center;
        }
        .content .name {
            height: 60px;
            padding-top: 20px;
        }
        .name {
            color: #333d79ff;
            font-weight: bold;
            line-height: 25px;
            font-size: large;
        }
        .deposit {
            margin-top: 10px;
            color: #333d79ff;
            font-weight: bold;
            font-size: 25px;
        }
        button:hover {
            cursor: pointer;
            color: #333d79ff;
            background-color: #faebefff;
        }
        .logout {
            width: 100%;
            margin-top: 20px;
            display: flex;
            justify-content: space-evenly;
        }
        .logout button {
            background-color: #faebefff;
            color: #333d79ff;
            font-weight: bold;
        }
        .input {
            color: red;
            text-transform: uppercase;
            
        }
        #amount {
            margin-top: 20px;
            font-size: 25px;
        }
        .box {
            width: 200px;
            height: 35px;
            color: red;
            font-size: x-large;
            font-weight: bold;
        }
        .deposit button {
            width: 150px;
            height: 40px;
            margin-top: 20px;
            background-color: #333d79ff;
            color: #faebefff;
            font-weight: bold;
            border-radius: 50px;
        }
        .message {
            color: red;
            text-transform: uppercase;
            font-size: medium;
        }
        
    </style>
</head>

<body>
    <div class="atm">
        <div class="transaction">
            <div class="header">
                <p>FIRST BANK OF NOWSA</p>
                <p style="color: yellow;">(ATM WEB PROJECT)</p>
            </div>
            <div class="content">
                <div class="name">NAME: <span class="input">
                    <% 
                        String name = request.getParameter("name");
                        if (name != null) {
                            out.println(name);
                        }
                    %></span> <br>ACCOUNT NUMBER: <span class="input">
                    <% 
                        String number = request.getParameter("number");
                        if (number != null) {
                            out.println(number);
                        }
                    %></span>
                </div>
                <div class="deposit">
                    DEPOSIT
                    <form action="deposit" method="post" id="amount">
                    <input type="hidden" name="name" value="<%= name %>">
                        <input type="hidden" name="number" value="<%= number %>">
                        Enter your amount:
                        <input type="number" class="box" name="deposit1" required><br>
                        <div id="error-message" class="message">
                            <% 
                                String errorMessage = (String) request.getAttribute("success");
                                if (errorMessage != null) {
                                    out.println(errorMessage);
                                }
                            %>
                        </div>
                        <button>DEPOSIT</button>
                    </form>
                </div>
            </div>
            <div class="logout">
                <a href="transaction?name=<%= name %>&number=<%= number %>"><button>BACK</button></a>
                <a href="loginpage.jsp"><button>EXIT</button></a>
            </div>
        </div>
    </div>
</body>

</html>
