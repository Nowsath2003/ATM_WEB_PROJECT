<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FBN-Fast Cash</title>
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
    .display{
        position: absolute;
        color: #333d79ff;
        font-weight: bold;
        margin: 120px 300px;
        font-size: x-large;
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
                <div class="button1"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=100"><button>100</button></a></div>
                <div class="button2"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=2000"><button>2000</button></a></div>
                <div class="button3"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=500"><button>500</button></a></div>
                <div class="button4"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=5000"><button>5000</button></a></div>
                <div class="button5"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=1000"><button>1000</button></a></div>
                <div class="button6"><a href="fastcash?name=<%= name %>&number=<%= number %>&amount=10000"><button>10000</button></a></div>
                <div class="display"> Select the amount <br> to withdraw</div>
            </div>
            <div class="logout">
                <a href="transaction?name=<%= name %>&number=<%= number %>"><button>BACK</button></a>
                <a href="loginpage.jsp"><button>EXIT</button></a>
			</div>
        </div>
    </div>
</body>

</html>