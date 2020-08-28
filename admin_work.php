<html>
    <head>
        <title>Admin_workings</title>
      
      <link rel="stylesheet" href="http://maxcd.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://kit.fontawesome.com/7de9c8aa22.js" crossorigin="anonymous"></script>

       
       
        
    </head>
    <body>
        
        
        
        
        
        <!--this part will provide you the information regarding the navigation bar
in navigation bar you will get the information regarding the name of the employee
and welcome and hi to the employee and also logout at the end
-->
        <div style="background-color:black;color:white ;height: 30px;width: 100%">

    <span>Hi,</span><span style="color:transparent">hh</span>
    <span>Welcome </span>
    <span style="color:transparent">hhh</span>
<span>
<?php
 $host="localhost";
 $dbusername="root";
 $dbpassword="";
 $dbname="dbmsproject";
 $conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);

 $user=$_GET['u'];
    
 

 echo $user;


?>


</span>

<span><a href="index.php" style="text-decoration:none;margin-left:65%;color:white">Logout<span style="color: transparent;">ii</span><i class="fas fa-sign-out-alt"></i></a></span>


</div>




<form method="POST">




<section style="margin-top: 24px">
  <div style="width: 100%;height: 100%">
    
     <h3>Insert</h3><hr style="border-color: #02FAB8">


   <!--inserting New Student-->
   <div style="width: 100%;margin-top: 10%">
  <input type="submit" value="Insert Student Record"   name="is"><br>
</div>
  <!--Inserting New Teacher-->
  <div style="width: 100%;margin-top: 10%">
  <input type="submit" value="Insert Teacher Record"   name="it"><br>
</div>
  <!--Inserting question-->
  <div style="width: 100%;margin-top: 10%">
  <input type="submit" value="Insert Question"   name="iq"><br>
</div>
</div>
<br><br><br>
</div>
</section>
 





<section style="width: 32%">
  <div style="width: 100%;height: 100%">
     <h3>Delete</h3><hr style="border-color: #FA020A">
<!--Delete Teacher from database completely-->
  <div style="margin-top: 9.7%">
 <input type="text" placeholder=" Enter The EMPID"  name="empid" ><br>
 <input type="submit" name="df" value="Delete Teacher Record"><br>

</div><br>
<!--Delete Student from database completley-->

<div>
  <div>
 <input type="text" placeholder=" Enter The USN"  name="usn" ><br>
</div>
  <input type="submit" value="Delete Student Record" name="ds" >
</div>
<br>
<div>
  
<input type="submit" name="das" value="Delete every student Record"><br><br><br>
<input type="submit" name="daf" value="Delete every Faculty Record"><br>

</div>
</section>




<section>
 
  <div style="width: 100%;height: 100%">
     <h3>Overview</h3><hr style="border-color: #02FAB8">
<div style="margin-top: 9.7%">
<input type="text" name="t" div="i"  id="sq" placeholder="Enter the Sem and Sec" ><br><br>

  <input type="submit"  style="" name="s" id="sr" >

</div>
</div>
</section>


</form>
    


      </body>

      </html>
<!--Inserting the student-->

 <?php 

$host="localhost";
$dbusername="root";
$dbpassword="";
$dbname="dbmsproject";
$conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);





if (isset($_POST['is'])) {
    $user=$_GET['u'];
    header("location:insert_through_admin_student.php?u=".$user);
}
   

//<!--Inserting the teachers or Faculties-->

     
if (isset($_POST['it'])) {
    $user=$_GET['u'];
    header("location:insert_through_admin_teaching.php?u=".$user);
}
  

//<!--Inserting the question-->

 
if (isset($_POST['iq'])) {
    $user=$_GET['u'];
    header("location:insert_through_admin_question.php?u=".$user);
}

  


//<!--Admin Overview Through Sem Section-->

if(isset($_POST['s'])){
  $s=$_POST['t'];

  header("location:admin_overview.php?u=".$user."&s=".$s);
}







//Delete every Faculty content

if(isset($_POST['daf']))
{


$deleteratingofteacher="delete from rating ";
$res=mysqli_query($conn,$deleteratingofteacher);


if($res)
{

$sql = "DELETE FROM teaching  ";
$r=mysqli_query($conn,$sql);



if($r)
{
$s2="delete from employee ";
$r1=mysqli_query($conn,$s2);



if($r1)
{
  echo "<script>alert('deleted every  faculty record')</script>";
}



else
{
  echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}



}







//<!--Delete Faculty-->


if(isset($_POST['df']))
{
$value=$_POST['empid'];



$deleteratingofteacher="delete from rating where empid='$value'";
$res=mysqli_query($conn,$deleteratingofteacher);


if($res)
{

$sql = "DELETE FROM teaching WHERE empid='$value' ";
$r=mysqli_query($conn,$sql);



if($r)
{
$s2="delete from employee where empid='$value'";
$r1=mysqli_query($conn,$s2);



if($r1)
{
  echo "<script>alert('deleted the faculty with faculty id $value')</script>";
}



else
{
  echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}



}


//delete Every student

if(isset($_POST['das']))
{



$deleteratingofstudent="DELETE from rating";
$res=mysqli_query($conn,$deleteratingofstudent);


if($res)
{

$s2="DELETE from student ";
$r1=mysqli_query($conn,$s2);

if($r1)
{
  echo "<script>alert('deleted all the student record')</script>";
}



else
{
  echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}



}











//<!--Delete Student-->


if(isset($_POST['ds']))
{
$value=$_POST['usn'];



$deleteratingofstudent="DELETE from rating where usn='$value'";
$res=mysqli_query($conn,$deleteratingofstudent);


if($res)
{

$s2="DELETE from student where usn='$value'";
$r1=mysqli_query($conn,$s2);

if($r1)
{
  echo "<script>alert('deleted the student with USN:$value')</script>";
}



else
{
  echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}

}
else
{
    echo "<script>alert('Error while deleting ')</script>".mysqli_error($conn);
}



}

$conn->close();
?>






       


     <style>
          body{
            background-image: url(i.jpg);

            background-size: cover; 
          }
            
       input{
        width: 100%;
        font-size: 10px;
        border-radius: 5px;
        background-color:transparent;
        border:0px;
        font-size: 25px;
        color: white;

       }     
          
         section{
          float: left;
          width: 31%;
          height:80%;
          margin-left:1% ;
          margin-top: 2%;
         }

div{
  border-radius: 2px;
}
span{
  font-size: 20px;
}

div{
  background:rgba(0,0,0,0.5);
}



div {
  width: 380px;
  height: auto;

  font-weight: bold;
  position: relative;
 
  animation: mymove 1.5s;
}



#div1 {animation-timing-function: linear;}

@keyframes mymove {
  from {display: none;
    width: 0px;
height: 200%;}
  to {

    width:  100%;
height: 100%}
}

h3{
  color: white;
  text-align: center;
  font-size: 30px;
}
hr
{
border: 2px solid ;  
}
        </style>