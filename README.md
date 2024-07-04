
# ATM Web Application

## Project Description

This ATM web application is designed to provide users with an online interface to perform typical banking transactions such as registration, login, deposit, withdrawal, balance inquiry, mini transaction statement, and PIN change. It ensures secure and efficient handling of user data and transactions.

## Technologies Used

- **Frontend:** HTML, CSS, JSP (JavaServer Pages)
- **Backend:** Java, Servlets
- **Database:** SQL (using JDBC for database connectivity)
- **Web Server:** Apache Tomcat

## Features

1. **User Registration:**
   - Register new users with personal details and create a unique PIN.
2. **User Login:**
   - Secure login using account number and PIN.
3. **Deposit Money:**
   - Deposit money into the user's account with real-time balance updates.
4. **Withdraw Money:**
   - Withdraw money with balance checks and updates.
5. **Mini Transaction Statement:**
   - View recent transaction history.
6. **Balance Inquiry:**
   - Check the current account balance.
7. **Change PIN:**
   - Securely change the account PIN.

## System Architecture

1. **Frontend:**
   - **HTML/CSS:** For structuring and styling web pages.
   - **JSP:** Dynamic web content generation.
2. **Backend:**
   - **Java Servlets:** Handle HTTP requests and responses, perform business logic.
   - **JDBC:** Connect to SQL database, execute queries, manage transactions.
3. **Database:**
   - **SQL Database:** Store user details, balances, transaction histories.

## Installation

1. **Prerequisites:**
   - Java Development Kit (JDK)
   - Apache Tomcat
   - Eclipse IDE

2. **Clone the Repository:**
   bash
   git clone https://github.com/yourusername/ATM-Web-Application.git
  
3. **Import the Project in Eclipse:**
   - Open Eclipse IDE.
   - Go to `File` > `Import`.
   - Select `Maven` > `Existing Maven Projects`.
   - Browse to the directory where you cloned the project.
   - Select the project and click `Finish`.

4. **Configure Apache Tomcat:**
   - In Eclipse, go to `Window` > `Preferences`.
   - Select `Server` > `Runtime Environments`.
   - Click `Add`, select `Apache Tomcat`, and specify the installation directory.
   - Add the project to the server.

5. **Setup Database:**
   - Create a database in your SQL server.
   - Import the provided SQL script to set up the required tables.
   - Update the JDBC connection details (URL, username, password) in your project configuration.

6. **Run the Application:**
   - Right-click the project in Eclipse.
   - Select `Run As` > `Run on Server`.
   - Choose Apache Tomcat and click `Finish`.

## Usage

1. **Access the Application:**
   - Open a web browser.
   - Navigate to `http://localhost:8080/ATM-Web-Application`.

2. **Register:**
   - Click on the `Register` link.
   - Fill in the required details and submit.

3. **Login:**
   - Enter your phone number and PIN.

4. **Perform Transactions:**
   - Use the navigation menu to deposit, withdraw, check balance, view mini statements, and change PIN.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## Contact

For any questions or suggestions, feel free to reach out to me at [your.email@example.com].

---

Thank you for using the ATM Web Application!


Feel free to customize the content according to your specific setup and requirements.
