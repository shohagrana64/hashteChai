<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%@page import=" java.io.PrintWriter"%>
<%@page import ="javax.servlet.ServletException;"%>
<%@page import ="javax.servlet.annotation.WebServlet;"%>
<%@page import ="javax.servlet.http.HttpServlet;"%>
<%@page import ="javax.servlet.http.HttpServletRequest;"%>
<%@page import ="javax.servlet.http.HttpServletResponse;"%>
<%@page import ="javax.servlet.http.HttpSession;"%>
<%
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
  padding-right: 450px;
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
            <li><a href="home.jsp">Home</a></li>
            <li class="current"><a href="signup.jsp">Signup</a></li>
            <li><%= (String) request.getSession().getAttribute("email")%> </li>
			<li class="current"><a href="logout.jsp">Logout</a></li>
          </ul>
        </nav>
      </div>
    </header>
	
    <section id="newsletter">
      <div class="container">

        <nav>
		 <div class="search-container">
		<form action="http://localhost/hashtechai/search.jsp" method="GET">
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
		  <div class="container">

        <nav>
      <button type="submit" class="button_1"><a href="post.jsp">Create your own Post</a></button>
			</div>
        </nav>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
 
String p= request.getParameter("post");
String sql ="select * from memes where serialNumber=";
String sqlMain=sql+p;
//out.println(sqlMain);         
resultSet = statement.executeQuery(sqlMain);
while(resultSet.next()){
%>

<form method='POST' action='comment.jsp'>
<center>Shared By: <%=resultSet.getString("sharedBy") %></center>
<p><img src='<%=resultSet.getString("img_dir") %>' width='75%' height= 'auto'></p>
<p><%=resultSet.getString("description") %></p>

<div5><img src='img\haha.png' width='5%' height= 5% ></div5>
<input type='hidden' name='val' value='<%=resultSet.getString("serialNumber") %>'><button type='submit' class='button_1' name='button}'>Comment</button>
<div6><img src='img\angry.png' width='5%' height= 5% ></div6>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	  </center>
	  <h1>Comments</h1>
          <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String p= request.getParameter("post");
String sql ="SELECT * FROM comments WHERE memeId=";
String sql2=sql+p;
//out.println(sql2);
resultSet = statement.executeQuery(sql2);
while(resultSet.next()){
    
%>

		<div class="comment">
		By: <%=resultSet.getString("user") %>
		<p>
		<%=resultSet.getString("comment") %>
		</p>
		</div>
	<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>  
		<h1>Leave a comment:</h1>
		<form action="commentinsert" method="post">
		<textarea name="message" rows="4" cols="30"></textarea>
  <br><br>
   <%String p= request.getParameter("post");
%> 
		<input type="hidden" name="postid" value="<%out.print(p);%>" />
		<div class="container">

        <nav>
      <button type="submit" class="button_1">Submit</button>
			</div>
        </nav>
		</form>

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