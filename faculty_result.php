<html>
    <head>
      <link rel="stylesheet" href="http://maxcd.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://kit.fontawesome.com/7de9c8aa22.js" crossorigin="anonymous"></script>
   
    </head>
<body>
   

  
        <div style="background-color:black;color:white ;height: 30px">

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

 $usn=$_GET['u'];
    
 $sql="select fname,lname from employee where empid='$usn'";

$res=mysqli_query($conn,$sql);

if($res->num_rows>0){
    while($rows=$res->fetch_assoc()){
        echo $rows['fname']." ".$rows['lname'];
    }
}



$conn->close();
?>


</span>

<span><a href="index.php" style="text-decoration:none
;margin-left:70%;color:white">Logout<span style="color: transparent;">ii</span><i class="fas fa-sign-out-alt"></i></a></span>


</div>
<br>
<br>
        
        









    <!--used inrder  to place the infromation in the form of tables
and this will inform you regarding the  employee results-->
   




<div>
    <table class="me">
        <?php
        $host="localhost";
 $dbusername="root";
 $dbpassword="";
 $dbname="dbmsproject";
 $conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);
    $user=$_GET['u'];    
        



 


//used in order to fetch the  count semsec value from teaching table

$sql="select count(semsec) as c  from teaching where empid='$user'";
$res=mysqli_query($conn,$sql);

$cn="";
if($res->num_rows>0){
  while ($ro=$res->fetch_assoc()) {
    $cn=$ro['c'];
  }
}

$cn=(int)$cn;


//used this ,inorder to fetch the admin        
        $admin="";
$sql ="select admin from employee where empid='$user'";
$res=mysqli_query($conn,$sql);

if($res->num_rows>0){
  while ($rows=$res->fetch_assoc()) {
    $admin=$rows['admin'];
  }
}else{
  echo"<script>alert('Error in fetching admin ')</script>".mysqli_error($conn);
}





//fetching the question,working fine

        $sql="select q1,q2,q3,q4,q5 from question where admin='$admin'";

        $res=mysqli_query($conn,$sql);

        $q1="";$q2="";$q3="";$q4="";$q5="";$q6="";
if($res->num_rows>0){
    while($rows=$res->fetch_assoc()){

        $q1=$rows['q1'];
        $q2=$rows['q2'];
        $q3=$rows['q3'];
        $q4=$rows['q4'];
        $q5=$rows['q5'];
       

    }
}else{
    echo "<script>alert('there were no questions prsent for this admin')</script>";
  
}


//if that employee teaching only one section then using sem and section is valid ,else 
//give for the sections 


if($cn==1){

$sql="select semsec as se from teaching where empid='$user'";
$res=mysqli_query($conn,$sql);


$s1="";


if($res->num_rows>0){
while ($row=$res->fetch_assoc()) {
  $s1=$row['se'];
}

}



$n1="";$n2="";$sub="";$sem="";$emp="";$cnt="";
$empid="$user";
$sem="$s1";
$sql1="select e.fname as n1 ,e.lname as n2,t.subject as sub,
t.semsec as sem, t.empid as emp, count(distinct(r.usn)) as cnt 
from employee e,teaching t,rating r 
where t.empid='$user' AND e.empid='$user' and t.semsec='$s1' and t.semsec=r.semsec and r.empid='$user'";
$res1=mysqli_query($conn,$sql1);

if($res1->num_rows>0){

    while($rows1=$res1->fetch_assoc()){
  
        $n1=$rows1['n1'];
        $n2=$rows1['n2'];
        $sub=$rows1['sub'];
        $sem=$rows1['sem'];
        $emp=$rows1['emp'];
        $cnt=$rows1['cnt'];
    }
}
else{ echo"<script>alert('There were no records found to the particular condition on database');
    </script>";

}




$s1="";$s2="";$s3="";$s4="";$s5="";$s6="";$total="";
$a1="";$a2="";$a3="";$a4="";$a5="";$a6="";$percent="";
$cmnt="";

//getting semsec values

$sql="select semsec as se from teaching where empid='$user'";
$res=mysqli_query($conn,$sql);


$s1="";
if($res->num_rows>0){
while ($row=$res->fetch_assoc()) {
  $s1=$row['se'];
}

}


$sql2="select sum(q1) as s1 ,avg(q1)*10 as a1, 
sum(q2) as s2,avg(q2)*10 as a2 , 
sum(q3) as s3 ,avg(q3)*10 as a3, 
sum(q4) as s4,avg(q4)*10 as a4 , 
sum(q5) as s5 ,avg(q5)*10 as a5, 
(sum(q1)+sum(q2)+sum(q3)+sum(q4)+sum(q5)) as total, 
((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 as percent, 
case 

when ((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 >=90 
     then 'You Are Doing Great! Keep It Up ' 

when (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)>80 and (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)<90 
then 'Doing Good!,Get one Step Ahead' 

else 'Improvisation is required' 
end as comments 

from rating 
where admin='$admin' and empid='$user' and usn in ( 

select distinct(usn) from rating where semsec='$s1'
)";


     $res2=mysqli_query($conn,$sql2);
     
     if($res2->num_rows>0){
         while($rows2=$res2->fetch_assoc()){
             $s1=$rows2['s1'];$a1=$rows2['a1'];
             $s2=$rows2['s2'];$a2=$rows2['a2'];

             $s3=$rows2['s3'];$a3=$rows2['a3'];
             $s4=$rows2['s4'];$a4=$rows2['a4'];
            
             $s5=$rows2['s5'];$a5=$rows2['a5'];
            

             $total=$rows2['total'];
             $percent=$rows2['percent'];

             $cmnt=$rows2['comments'];
            }
     
        }
        else{ echo"<script>alert('There  were no records found to the particular condition on
             database');
            </script>";
            
            }
     

            echo "<tr><th  colspan='2' style=' color:white' 

            >Name:$n1" ."   "." $n2</th>
            <th style=' color:white'>Subject :$sub</th></tr>"
            ."<tr><th style='color:white'>Sem & Sec :$sem</th>
            <th style='color:white'>Empid :$emp</th>
            <th style='color:white'>No.Of Students :$cnt</th>
            </tr> 
            
            <tr><td colspan=3><br><br></td></tr>
            
            <tr><th>Questions</th><th>Total</th><th>Percentage</th></tr>
            <tr>
            <th>$q1</th>  <td>$s1</td><td>$a1</td>
            
            </tr>

            <tr>
            <th>$q2</th>  <td>$s2</td><td>$a2</td>
            </tr>
            
            <tr>
            <th>$q3</th>  <td>$s3</td><td>$a3</td>
            </tr>
            
            <tr>
            <th>$q4</th>  <td>$s4</td><td>$a4</td>
            </tr>
            
            <tr>
            <th>$q5</th>  <td>$s5</td><td>$a5</td>
            </tr>
            
            <tr>
            <th>$q6</th>  <td>$s6</td><td>$a6</td>
           
            </tr>

            <tr>
            <th></th>  <td>$total</td><td>$percent<br></td>
            
            </tr>

        <tr>
        <th><br>Comments:</th><th colspan='2'><br>$cmnt</th>
        </tr>
            "
            ;

$conn->close();

}
        


//**if :the employee is working for more than a section then count will be 2

if ($cn==2) {
 
 $sql="select semsec as c from  teaching where empid='$user'";
 $res=mysqli_query($conn,$sql);

$s1="";$s2="";
$i=0;
 if($res->num_rows>0){

while ($ro=$res->fetch_assoc()) {
  if($i==0){
    $s1=$ro['c'];
  }
  if($i==1){
    $s2=$ro['c'];
  }

$i++;
}



//we are now replacing the code from  the previous  division tab
//for s1





$n1="";$n2="";$sub="";$sem="";$emp="";$cnt="";
$empid="$user";
$sem="$s1";
$sql1="select e.fname as n1 ,e.lname as n2,t.subject as sub,
t.semsec as sem, t.empid as emp, count(distinct(r.usn)) as cnt 
from employee e,teaching t,rating r 
where t.empid='$user' AND e.empid='$user' and t.semsec='$s1' and t.semsec=r.semsec and r.empid='$user'";
$res1=mysqli_query($conn,$sql1);

if($res1->num_rows>0){

    while($rows1=$res1->fetch_assoc()){
  
        $n1=$rows1['n1'];
        $n2=$rows1['n2'];
        $sub=$rows1['sub'];
        $sem=$rows1['sem'];
        $emp=$rows1['emp'];
        $cnt=$rows1['cnt'];
    }
}
else{ echo"<script>alert('There were no records found to the particular condition on database');
    </script>";

}




$s1="";$s2="";$s3="";$s4="";$s5="";$s6="";$total="";
$a1="";$a2="";$a3="";$a4="";$a5="";$a6="";$percent="";
$cmnt="";

//getting semsec values

$sql="select semsec as c from  teaching where empid='$user'";
 $res=mysqli_query($conn,$sql);

$s1="";$s2="";
$i=0;
 if($res->num_rows>0){

while ($ro=$res->fetch_assoc()) {
  if($i==0){
    $s1=$ro['c'];
  }
  if($i==1){
    $s2=$ro['c'];
  }

$i++;
}





$sql2="select sum(q1) as s1 ,avg(q1)*10 as a1, 
sum(q2) as s2,avg(q2)*10 as a2 , 
sum(q3) as s3 ,avg(q3)*10 as a3, 
sum(q4) as s4,avg(q4)*10 as a4 , 
sum(q5) as s5 ,avg(q5)*10 as a5, 
(sum(q1)+sum(q2)+sum(q3)+sum(q4)+sum(q5)) as total, 
((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 as percent, 
case 

when ((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 >=90 
     then 'You Are Doing Great! Keep It Up ' 

when (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)>80 and (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)<90 
then 'Doing Good!,Get one Step Ahead' 

else 'Improvisation is required' 
end as comments 

from rating 
where admin='$admin' and empid='$user' and usn in ( 

select distinct(usn) from rating where semsec='$s1'
)";


     $res2=mysqli_query($conn,$sql2);
     
     if($res2->num_rows>0){
         while($rows2=$res2->fetch_assoc()){
             $s1=$rows2['s1'];$a1=$rows2['a1'];
             $s2=$rows2['s2'];$a2=$rows2['a2'];

             $s3=$rows2['s3'];$a3=$rows2['a3'];
             $s4=$rows2['s4'];$a4=$rows2['a4'];
            
             $s5=$rows2['s5'];$a5=$rows2['a5'];
            

             $total=$rows2['total'];
             $percent=$rows2['percent'];

             $cmnt=$rows2['comments'];
            }
     
        }
        else{ echo"<script>alert('There  were no records found to the particular condition on
             database');
            </script>";
            
            }
     

            echo "<tr><th  colspan='2' style='color:white'>Name:$n1" ."   "." $n2</th>
            <th style='color:white'>Subject :$sub</th></tr>"
            ."<tr><th style='color:white'>Sem & Sec :$sem</th>
            <th style='color:white'>Empid :$emp</th>
            <th style='color:white'>No.Of Students :$cnt</th>
            </tr> 
            
            <tr><td colspan=3><br><br></td></tr>
            
            <tr><th>Questions</th><th>Total</th><th>Percentage</th></tr>
            <tr>
            <th>$q1</th>  <td>$s1</td><td>$a1</td>
            
            </tr>

            <tr>
            <th>$q2</th>  <td>$s2</td><td>$a2</td>
            </tr>
            
            <tr>
            <th>$q3</th>  <td>$s3</td><td>$a3</td>
            </tr>
            
            <tr>
            <th>$q4</th>  <td>$s4</td><td>$a4</td>
            </tr>
            
            <tr>
            <th>$q5</th>  <td>$s5</td><td>$a5</td>
            </tr>
            
            <tr>
            <th>$q6</th>  <td>$s6</td><td>$a6</td>
           
            </tr>

            <tr>
            <th></th>  <td>$total</td><td>$percent</td>
            
            </tr>

        <tr>
        <th><br>Comments:</th><th colspan='2'><br>$cmnt</th>

        </tr>
<tr>
<td><br><br><br><br></td>
</tr>

            "
            ;

//for s2 i am repalcing now




$s1="";$s2="";$s3="";$s4="";$s5="";$s6="";$total="";
$a1="";$a2="";$a3="";$a4="";$a5="";$a6="";$percent="";
$cmnt="";

//getting semsec values



$sql="select semsec as c from  teaching where empid='$user'";
 $res=mysqli_query($conn,$sql);

$s1="";$s2="";
$i=0;
 if($res->num_rows>0){

while ($ro=$res->fetch_assoc()) {
  if($i==0){
    $s1=$ro['c'];
  }
  if($i==1){
    $s2=$ro['c'];
  }

$i++;

}

//fetching the values of the teacher(same for differrent section)

$n1="";$n2="";$sub="";$sem="";$emp="";$cnt="";
$empid="$user";
$sem="$s1";
$sql1="select e.fname as n1 ,e.lname as n2,t.subject as sub,
t.semsec as sem, t.empid as emp, count(distinct(r.usn)) as cnt 
from employee e,teaching t,rating r 
where t.empid='$user' AND e.empid='$user' and t.semsec='$s2' and t.semsec=r.semsec and r.empid='$user'";
$res1=mysqli_query($conn,$sql1);

if($res1->num_rows>0){

    while($rows1=$res1->fetch_assoc()){
  
        $n1=$rows1['n1'];
        $n2=$rows1['n2'];
        $sub=$rows1['sub'];
        $sem=$rows1['sem'];
        $emp=$rows1['emp'];
        $cnt=$rows1['cnt'];
    }
}
else{ echo"<script>alert('There were no records found to the particular condition on database');
    </script>";

}


$sql2="select sum(q1) as s1 ,avg(q1)*10 as a1, 
sum(q2) as s2,avg(q2)*10 as a2 , 
sum(q3) as s3 ,avg(q3)*10 as a3, 
sum(q4) as s4,avg(q4)*10 as a4 , 
sum(q5) as s5 ,avg(q5)*10 as a5, 
(sum(q1)+sum(q2)+sum(q3)+sum(q4)+sum(q5)) as total, 
((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 as percent, 
case 

when ((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10 >=90 
     then 'You Are Doing Great! Keep It Up ' 

when (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)>80 and (((avg(q1)+avg(q2)+avg(q3)+avg(q4)+avg(q5))/5)*10)<90 
then 'Doing Good!,Get one Step Ahead' 

else 'Improvisation is required' 
end as comments 

from rating 
where admin='$admin' and empid='$user' and usn in ( 

select distinct(usn) from rating where semsec='$s2'
)";


     $res2=mysqli_query($conn,$sql2);
     
     if($res2->num_rows>0){
         while($rows2=$res2->fetch_assoc()){
             $s1=$rows2['s1'];$a1=$rows2['a1'];
             $s2=$rows2['s2'];$a2=$rows2['a2'];

             $s3=$rows2['s3'];$a3=$rows2['a3'];
             $s4=$rows2['s4'];$a4=$rows2['a4'];
            
             $s5=$rows2['s5'];$a5=$rows2['a5'];
            

             $total=$rows2['total'];
             $percent=$rows2['percent'];

             $cmnt=$rows2['comments'];
            }
     
        }
        else{ echo"<script>alert('There  were no records found to the particular condition on
             database');
            </script>";
            
            }
     

            echo "<tr><th  colspan='2' style='color:white'>Name:$n1" ."   "." $n2</th>
            <th style='color:white'>Subject :$sub</th></tr>"
            ."<tr><th style='color:white'>Sem & Sec :$sem</th>
            <th style='color:white'>Empid :$emp</th>
            <th style='color:white'>No.Of Students :$cnt</th>
            </tr> 
            
            <tr><td colspan=3><br><br></td></tr>
            
            <tr><th>Questions</th><th>Total</th><th>Percentage</th></tr>
            <tr>
            <th>$q1</th>  <td>$s1</td><td>$a1</td>
            
            </tr>

            <tr>
            <th>$q2</th>  <td>$s2</td><td>$a2</td>
            </tr>
            
            <tr>
            <th>$q3</th>  <td>$s3</td><td>$a3</td>
            </tr>
            
            <tr>
            <th>$q4</th>  <td>$s4</td><td>$a4</td>
            </tr>
            
            <tr>
            <th>$q5</th>  <td>$s5</td><td>$a5</td>
            </tr>
            
            <tr>
            <th>$q6</th>  <td>$s6</td><td>$a6</td>
           
            </tr>

            <tr>
            <th></th>  <td>$total</td><td>$percent</td>
            
            </tr>

        <tr>
        <th><br>Comments:</th><th colspan='2' style=''><br>$cmnt</th>
        </tr>

        <tr><td></td></tr>
            ";
            

$conn->close();

 }
}}}
 ?>
    
    </table>

  </div>

    </body>
</html>

 <style>
        table{
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
        }
        table,tr,th{
            border: 1px ;
            border-collapse: collapse;
            text-align: center;
            font-size: 20px;
        }
th,td:hover{}

  .me tr:nth-child(1)
    {
        background:  #84E184;
    }
    .me tr:nth-child(2)
    {
        background: #84E184;
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


.me tr:nth-child(14)
    {
        background:  #84E184;
    }
    .me tr:nth-child(15)
    {
        background: #84E184;
    }

.me tr:nth-child(16)
    {
        background: #F5F5F5;
    }


    .me tr:nth-child(17)
    {
        background: ;
    }
     .me tr:nth-child(18)
    {
        background:#F5F5F5;
    }
     .me tr:nth-child(19)
    {
        background: ;
    }
     .me tr:nth-child(20)
    {
        background: #F5F5F5;
    }
     .me tr:nth-child(21)
    {
        background: ;
    }
    
     .me tr:nth-child(22)
    {
        background: #F5F5F5;
    }
    .me tr:nth-child(23)
    {
        background: #919bd7;
    }
.me tr:nth-child(25)
    {
        background: #919bd7;
    }

span{
  font-size: 20px;
}




        </style>