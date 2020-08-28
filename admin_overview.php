<html>
    <head>
      

    </head>
    <body>



       <div style="width: 80%;margin-left: 10%;margin-right: 10%">

        <table class="me">
            <tr style="
        background:  #84E184">
    <th style="color: white;font-size: 20px">SL. NO</th>
            <th style="color: white;font-size: 20px">Faculty Name</th>
            <th style="color: white;font-size: 20px">Percent</th> 
            </tr>
   <?php

 $host="localhost";
 $dbusername="root";
 $dbpassword="";
 $dbname="dbmsproject";
 $conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);

$user=$_GET['u'];
$s=$_GET['s'];



 $sql="select e.fname as n1 ,e.lname as n2 , e.empid as emp from employee e where admin='$user' and e.empid in (SELECT DISTINCT(empid) from rating WHERE semsec='$s')
        ";

        $i=1;
        $res=mysqli_query($conn,$sql);

        if($res->num_rows>0){
            while($row=$res->fetch_assoc()){

echo "<tr>
<td>$i</td><td>$row[n1]"."  "."$row[n2]</td>";

$sql1="SELECT ((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 as per from rating WHERE semsec='$s' and 
 empid='$row[emp]'";

$res1=mysqli_query($conn,$sql1);

if($res1->num_rows>0){
    while($row1=$res1->fetch_assoc()){
        echo"<td>$row1[per]</td></tr>";
    }
}
else{

    echo "<script>alert('error occured due to')</script>".mysqli_error($conn);
}
$i++;
            }
        }

        else{
            echo "<script>alert('No records')</script>".mysqli_error($conn);
            
        }
        
        ?>




  
        </table>
        <br><br><br>
       <form method="POST">
       <button type =" submit" style="width: 30% ;float: left;
        background-color: #8DFC2C;
        color: white;border: 0;
        margin-top: 16px;
        padding-top:5px;padding-bottom:5px;
        border-radius: 10px;
        font-size: 18px;
        margin-left: 20%;
          "
name="ac" 
        >Previous Page</button>
</form>
        <?php
if(isset($_POST['ac'])){
    $u=$_GET['u'];
header("location:admin_work.php?u=".$u);
}

        ?>
<a href="index.php" ><button style="width: 30% ;float: right;
background-color: #FF4949;
border:0;
 padding-top:5px;padding-bottom:5px;
        border-radius: 10px;
         font-size: 18px;
         color: white;
margin-right: 20%;
">Logout</button></a>



    </div>

    </body>
</html>

  <style type="text/css">
            
            table{
                width: 80%;
                margin-right: 10%;
                margin-left: 10%;
            }

table,tr,th{
    text-align: center;
}


button{
    border: 0px;
    border-radius: 10px;
    padding-top:10px;
     padding-bottom:10px; 
}

  .me tr:nth-child(1)
    {
        background:  #84E184;
    }
    .me tr:nth-child(2)
    {
        background: #;
    }

.me tr:nth-child(3)
    {
        background: #F5F5F5;
    }


    .me tr:nth-child(4)
    {
        background: ;
    }
     .me tr:nth-child(5)
    {
        background:#F5F5F5;
    }
     .me tr:nth-child(6)
    {
        background: ;
    }
     .me tr:nth-child(7)
    {
        background: #F5F5F5;
    }
     .me tr:nth-child(8)
    {
        background: ;
    }
    
     .me tr:nth-child(9)
    {
        background: #F5F5F5;
    }
    .me tr:nth-child(12)
    {
        background: #919bd7;
    }

        </style>