<html>
    <head>
      <link rel="stylesheet" href="http://maxcd.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://kit.fontawesome.com/7de9c8aa22.js" crossorigin="anonymous"></script>
  </head>
    <body>

<!--Creating the logout bar-->
    <div style="background-color:black">
    <div style="color:whitesmoke;margin-left:80%;padding-top: 1%">
        <a href="index.php"><span style="text-decoration:none;color:white">Logout<span style="color: transparent;">ii</span><i class="fas fa-sign-out-alt"></i></span></span></a>
        <br> <br>

    </div>
    </div>
<center>
      
           <form  method= "get">
            <br>
        
           <div class = "login-box">

            <h1> SIGNUP </h1>


            
          <div class = "text-box">
          
              <i class="fas fa-user "></i>
            <input type="text"   placeholder= "Enter unique username" name="u" required>
          </div>

                <div class = "text-box">
                  <i class="fas fa-lock "></i>
              
          <input type="password" placeholder="Enter Password" name="p" required>
         </div>

          <input class= "btn" type="submit"  value="SignUp" name="S">
    </div>
 
           

</form>
<a href="index.php"><input style="background-color: #FC3240;border:0;border-radius: 10px;margin-top: 27%;width: 14.6%;
margin-left: 1%;height: 4%;font-size: 19px;color:white"  type="submit" value="Abort SignUp "></a> 
             

               </div>
    </body>
</html>


<?php


if(isset($_GET['S']))
{

    $host="localhost";
$dbusername="root";
$dbpassword="";
$dbname="dbmsproject";
$conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);
    
    

    
$u=$_GET['u'];
    
    
$p=$_GET['p'];



 
$sql="INSERT into admin VALUES('$u','$p')";
$re=mysqli_query($conn,$sql);
if($re)
echo '<script>alert("username= '.$u.'password= '.$p.'  was inserted succsessfully")</script>';
else
echo '<script>alert("Not Successfull because the user value has been inserted already")</script>';

$conn->close();
}

?>
      <style>
        a:link {
  text-decoration: none;
}

body{
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: url(img.jpg) no-repeat;
  background-size: cover;
}


.login-box{
  width: 280px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-45%,-65%);
  color: white;
}
.login-box h1{
  float: left;
  font-size: 40px;
  border-bottom: 6px solid #ffc100;
  margin-bottom: 50px;
  padding: 13px 0;
}
.text-box{
  width: 97%;
  height: 23px;
  overflow: hidden;
  font-size: 20px;
  padding: 8px 0;
  padding-left: 8px;
  margin: 8px 0;
  border-bottom: 1px solid #ffc100;
}
.text-box i{
  width: 26px;
  height: 2px;
 float: left;
  text-align: center;
}
.text-box input{
  border: none;
  outline: none;
  background: none;
  color: white;
  font-size: 18px;
  width: 100%;
  float: left;
  margin: 0 10px;
  padding-left:30px
}


.btn{
  width: 94%;
  background: none;
  border: 2px solid #ffc100;
  color: white;
  padding: 5px;
  font-size: 18px;
  cursor: pointer;
  margin: 18px 0;
}

        </style>