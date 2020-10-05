<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//Http 1.1
            response.setHeader("Pragma", "no-cache");//Http 1.0
            response.setHeader("Expires", "0");//Proxies
            if (session.getAttribute("email") == null) {
                response.sendRedirect("index.jsp");
            }

String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost/hashtechai?";
String database = "test";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
  <head>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>hashtechai</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="./css/style.css">

  </head>
  <style>

div5 {
  padding-right: 50px;
}
div6 {
  padding-left: 50px;
}
div8 {
  padding-right: 425px;
}
div9 {
  padding-right: 250px;
}
body {
	padding-top: 100px;
}
.post {
	width: 30%;
	margin: 10px auto;
	border: 1px solid #cbcbcb;
	padding: 5px 10px 0px 10px;
}
.like, .unlike, .likes_count {
	color: blue;
}
.hide {
	display: none;
}
.fa-thumbs-up, .fa-thumbs-o-up {
	transform: rotateY(-180deg);
	font-size: 1.3em;
}

</style>
  <body>
  
  
    <header>
      <div class="container">
        <div id="branding">
          <h1><span class="highlight">Hashte</span>Chai</h1>
        </div>
        <nav>
          <ul>
            <li><a href="home.php">Home</a></li>
            <li><%= (String) request.getSession().getAttribute("email")%>  </li>
			<li class="current"><a href="logout">Logout</a></li>
          </ul>
        </nav>
      </div>
    </header>
	
    <section id="newsletter">
      <div class="container">

        <nav>
		 <div class="search-container">
		<form action="http://localhost/hashtechai/search.php" method="GET">
		<input type="text" placeholder="Search" name="query">
      <button type="submit" class="button_1">Search</button>
    </form>
  </div>
        </nav>
      </div>
    </section>
	
	
	
	
		<div class="row">
  <div class="side">
    <h2>Popular</h2>
	
    <a href="http://localhost/hashtechai/search.php?query=hot"><font color="#138fed">Hot</a><br>
    <a href="http://localhost/hashtechai/search.php?query=treding"><font color="#138fed">Trending</a><br>
    <a href="http://localhost/hashtechai/search.php?query=fresh"><font color="#138fed">Fresh</a><br>
	</font>
	</font>
	</font>
	<h2>Sections</h2>
	<font color="#138fed">
    <a href="http://localhost/hashtechai/search.php?query=bangla"><font color="#138fed">Bangla</a><br>
    <a href="http://localhost/hashtechai/search.php?query=animal"><font color="#138fed">Poshu Pakhi</a><br>
	<a href="http://localhost/hashtechai/search.php?query=game"><font color="#138fed">Games</a><br>
    <a href="http://localhost/hashtechai/search.php?query=politics"><font color="#138fed">Politics</a><br>
    <a href="http://localhost/hashtechai/search.php?query=science"><font color="#138fed">Science</a><br>
		</font>
	</font>
	</font>
		</font>
	</font>
	</font>
	</font>
	
  </div>  


      <div class="main">    
      <div class="dark">
		<center> 
		<head>Thank you for logging in </head>
		  <div class="container">

        <nav>
      <button type="submit" class="button_1"><a href="post.jsp">Create your own Post</a></button>
			</div>
        </nav>
                      <h1>Popular content</h1>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from memes";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
    
%>

 <form action="comment.jsp">  
<center>Shared By: <%=resultSet.getString("sharedBy") %></center>
<p><img src='<%=resultSet.getString("img_dir") %>' width='75%' height= 'auto'></p>
<p><%=resultSet.getString("description") %></p>

<div5><img src='img\haha.png' width='5%' height= 5% ></div5>


   
    



<input type="hidden" name="post" value="<%=resultSet.getString("serialNumber") %>">  
<input type="submit" class='button_1' value="Comment">
 
<div6><img src='img\angry.png' width='5%' height= 5% ></div6>
<p> </p>
</form> 
<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

	  </center>
      </div>
	  </div>
	<div class="side">
    <h2>Popular</h2>
	
    <a href="http://localhost/hashtechai/search.php?query=hot"><font color="#138fed">Hot</a><br>
    <a href="http://localhost/hashtechai/search.php?query=treding"><font color="#138fed">Trending</a><br>
    <a href="http://localhost/hashtechai/search.php?query=fresh"><font color="#138fed">Fresh</a><br>
	</font>
	</font>
	</font>
	<h2>Sections</h2>
	<font color="#138fed">
    <a href="http://localhost/hashtechai/search.php?query=bangla"><font color="#138fed">Bangla</a><br>
    <a href="http://localhost/hashtechai/search.php?query=animal"><font color="#138fed">Poshu Pakhi</a><br>
	<a href="http://localhost/hashtechai/search.php?query=game"><font color="#138fed">Games</a><br>
    <a href="http://localhost/hashtechai/search.php?query=politics"><font color="#138fed">Politics</a><br>
    <a href="http://localhost/hashtechai/search.php?query=science"><font color="#138fed">Science</a><br>
	</font>
  </div>  
	  
	  
	  </div>
	


    <footer>
      <p> HashteChai.com</p>
    </footer>
  </body>
</html>