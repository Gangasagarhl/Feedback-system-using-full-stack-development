<html>
    <head>
   <link rel="stylesheet" href="http://maxcd.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://kit.fontawesome.com/7de9c8aa22.js" crossorigin="anonymous"></script>
   
  
    </head>

    <script>
    
    </script>
    <body>
    
        
        
      <!--
          
      ****************************************************
      It is the navigation bar with the background color black and with the white color
      ,which gives you complete information regarding the name of the guy(student)
      ***************************************************


    -->  
        
        <div style="background-color:black;color:white">

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
    
 $sql="select fname,lname,semsec,admin from student where usn='$usn'";

$res=mysqli_query($conn,$sql);

if($res->num_rows>0){
    while($rows=$res->fetch_assoc()){
        echo $rows['fname']." ".$rows['lname']."<span style='margin-left:8px'> ".$rows['semsec']."</span> <span style='margin-left:8px'>  ".$rows['admin']."</span>";
    }
}



$conn->close();
?>


</span>

<span><a href="student.php" style="text-decoration:none
;margin-left:40%;color:white">Logout<span style="color: transparent;">ii</span><i class="fas fa-sign-out-alt"></i></a></span>


</div>
        
        
        
        
        
  <!--
  
  ************************************************************************    
  this is used inorder to place the values the table ,by using the tables student,
  teachers and the teaching values
  ************************************************************************

   -->      
       


<!--this part is used inoreder to display the questions the stu_work-->




<?php

 $host="localhost";
 $dbusername="root";
 $dbpassword="";
 $dbname="dbmsproject";
 $conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);



//getting the count from rating

 $cnt=-1;
$sql="select count('$usn') as cnt from rating where usn='$usn'";
$res=mysqli_query($conn,$sql);
if($res->num_rows>0){
  while ($rw=$res->fetch_assoc()) {
    
$cnt=$rw['cnt'];

  }
}

$cnt=(int)$cnt;

if($cnt==0){


 $adm="";
 $usn=$_GET['u'];

 $sql="select admin as a from student where usn='$usn'";
 $res=mysqli_query($conn,$sql);

if($res->num_rows>0){

  while ($rows=$res->fetch_assoc()) {
    $adm=$rows['a'];
  }
}



$sql="select q1,q2,q3,q4,q5 from question where admin='$adm'";
$res=mysqli_query($conn,$sql);

$q1="";$q2="";$q3="";$q4="";$q5="";


if($res->num_rows>0){

  while ($rows=$res->fetch_assoc()) {
  $q1=$rows['q1'];
  $q2=$rows['q2'];
  $q3=$rows['q3'];
  $q4=$rows['q4'];
  $q5=$rows['q5'];
  }


echo "

    <table>
      
<tr><th colspan=2 style='font-size:30px'>Question Table </th></tr>

      <tr style='background-color:#84E184;color:white'>
        <th>Sl.No</th>
        <th>Questions</th>
      </tr>
      
<tr>
        <td>
         1
        </td>

        <td>
         $q1
        </td>
</tr>
     <tr>
        <td>
        2
        </td>

        <td>
         $q2
        </td>
</tr>


<tr>
        <td>
         3
        </td>

        <td>
         $q3
        </td>
</tr>



<tr>
        <td>
        4
        </td>

        <td>
         $q4
        </td>
</tr>


<tr>
        <td>
         5
        </td>

        <td>
         $q5
        </td>
</tr>


    </table>

";







}
else{
  echo "<script>alert('Admin has not Provided Any of the Questions')</script>";
}
}
?>

</tr>
</table>



<div id="dis">
<!--
*************
this is required to ,disappear the table if there exist some records for the guy
*************
-->


    <form method="post">
        
        <table class="me">
            <tr style="background-color: ">
                <th>FACULTY NAME</th>
                <th>Employee id</th>
                <th>QUESTION 1</th>
                <th>QUESTION 2</th>
                <th>QUESTION 3</th>
                <th>QUESTION 4</th>
                <th>QUESTION 5</th>
            </tr>
            <tr>
              <td colspan="7"><br></td>

            </tr>
            <?php

            //connection in php
            $host="localhost";
            $dbusername="root";
            $dbpassword="";
            $dbname="dbmsproject";
            $conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);
      



            /*
            
            
            **********************************************************************
           //this snipet will fetch you the semsec of the student corresponding usn
            ***********************************************************************
           

           */



           $semsec="" ;
           $u=$_GET['u'];
            $sql="select semsec from student where usn='$u'";
            $res=mysqli_query($conn,$sql);
            
            if($res->num_rows>0){
                while ($rows=$res->fetch_assoc()) {
                    //fetches the value semsec from studen table

                    $semsec=$rows['semsec'];
                }
            }
            else{
                die("<script>alert('There Were no students available')</script>");
            }

            



           
           
           
           
           
            /*

            ****************************this fetches the resultant value in the faculty table ,that is fname 
            lname ,empid  from the semsec correspondance values and places the value in the table format
            ****************************
           
            */



        $sql="select fname,lname,empid from employee where empid IN 
            ( select empid from teaching WHERE semsec='$semsec' )";
            
            $i=0;
            $j=11;
            $res=mysqli_query($conn,$sql);

            if($res->num_rows>0){
            while ($rows=$res->fetch_assoc()) {

                echo "<tr><td >".$rows['fname']." ".$rows['lname'].'</td>'.
                '<td ><input type="text" name='.$i.' value='.$rows['empid'].'  readonly style="border:0"></td>'.
                //for the first question
                '<td><select  name='.($j++).' >
                   <option >1</option>
                   <option >2</option>
                   <option >3</option>
                   <option >4</option>
                   <option >5</option>
                   <option >6</option>
                   <option >7</option>
                   <option >8</option>
                   <option >9</option>
                   <option selected>10</option>
                 

                 </select>
                </td>'.
                //for the second question
               '<td><select  name='.($j++).' >
                   <option >1</option>
                   <option >2</option>
                   <option >3</option>
                   <option >4</option>
                   <option >5</option>
                   <option >6</option>
                   <option >7</option>
                   <option >8</option>
                   <option >9</option>
                   <option selected>10</option>
                 

                 </select>
                </td>'.
                //for the third question
                '<td><select  name='.($j++).' >
                   <option >1</option>
                   <option >2</option>
                   <option >3</option>
                   <option >4</option>
                   <option >5</option>
                   <option >6</option>
                   <option >7</option>
                   <option >8</option>
                   <option >9</option>
                   <option selected>10</option>
                 

                 </select>
                </td>'.
                //for the fourth qestion
               '<td><select  name='.($j++).' >
                   <option >1</option>
                   <option >2</option>
                   <option >3</option>
                   <option >4</option>
                   <option >5</option>
                   <option >6</option>
                   <option >7</option>
                   <option >8</option>
                   <option >9</option>
                   <option selected>10</option>
                 

                 </select>
                </td>'.
                //for the fifth question
                '<td><select  name='.($j++).' >
                   <option >1</option>
                   <option >2</option>
                   <option >3</option>
                   <option >4</option>
                   <option >5</option>
                   <option >6</option>
                   <option >7</option>
                   <option >8</option>
                   <option >9</option>
                   <option selected>10</option>
                 

                 </select>
                </td>';
              
                $j="$j"+6;
                $i="$i"+1;
            }
        }
        
        else{
            echo '<script>alert("no records")</script>';
        }
        $conn->close();
             ?> 
<tr>
    <td colspan="3" style="font-size:30px; ">
      <br>
    <input type="submit" name="s" value="Submit" style="border-radius: 5px;color: white;font-size: 20px;
    background-color: #6254e8;border: 0"></td>
<td></td>
    <td colspan="3"><br><br><a href="index.php"><input type="button" value="Home"
    style="border-radius: 5px;color: white;font-size: 20px;
    background-color: #4ABEB2;border: 0"
      ></a></td>
</tr>


<!--
******************
ending of dispalying table inside the table
******************
-->

</table>
</form><!--form uses post -->

<br><br><br>
<center><span><b>Note:</b></span><span>  0 indicates Minimum &nbsp;&nbsp; &nbsp;   10 indicates Maximum</span>
</center>

</div>





    </body>
</html>

<?php

/*

******************************************************
//if the submit is button is clicked then only this part will be executed
******************************************************

*/

$host="localhost";
$dbusername="root";
$dbpassword="";
$dbname="dbmsproject";
$conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);
$usn=$_GET['u'];
$sql="select count(*) as c from rating where usn='$usn'";
$res=mysqli_query($conn,$sql);
$cnt=-1;
if($res->num_rows>0){

while($rows=$res->fetch_assoc()){

  $cnt=$rows['c'];
}
}

$cnt=(int)$cnt;


if($cnt==0)
{
  

if(isset($_POST['s']))
{


$host="localhost";
$dbusername="root";
$dbpassword="";
$dbname="dbmsproject";
$conn=mysqli_connect($host,$dbusername,$dbpassword,$dbname);


/*

***********************
this fetches the count from the rating that, if the values are exited the that guy is nota allowed to
Give the feedback  ,else then only the guy is allowed to give the feedback 
included in starting
***********************

*/ 




/*

*********
this is used to get the count 0 ,only if there are no existing values present in the rating table
for the particular value of usn
*********

*/



/*

*************
this fetches the admon and semsec from student table in database
*************

*/

$usn=$_GET['u'];
$sql="select admin,semsec from student WHERE usn='$usn'";
$res=mysqli_query($conn,$sql);
$admin="";$sem="";
if($res->num_rows>0){
while ($rows=$res->fetch_assoc()) {

    $admin=$rows['admin'];
    $sem=$rows['semsec'];
}
}
else{
    echo("<script>alert('there is no record for this usn in student')</script>");
}



$query = "SELECT count(*) as c FROM teaching where semsec='$sem'"; 
     $row=0; 
    // Execute the query and store the result set 
    $result = mysqli_query($conn, $query); 
      if($result->num_rows>0){
     
        while ($r=$result->fetch_assoc()) {
            $row=$r['c'];
        }


      }
    


$counting=0;

$j=11;
/*
*********
this get the value in each and every row and the cell of the table for the particular 
empid and also the marks associated with that empid and that student 
*********
*/
$row=(int)$row;
for($i=0;$i<$row;$i++){

//getting the values forcontents in table 
$em=$_POST[$i];
$q1=$_POST[$j++];
$q2=$_POST[$j++];
$q3=$_POST[$j++];
$q4=$_POST[$j++];
$q5=$_POST[$j++];
    

//inserting the values fetched to the rating tables 
$sql="insert into rating(empid,usn,q1,q2,q3,q4,q5,admin,semsec)
 values('$em','$usn','$q1','$q2','$q3','$q4','$q5','$admin','$sem')";
$res=mysqli_query($conn,$sql);


if(!$res )
{
   
    echo "<script>alert('Not Successfull')</script>";
    die();
}
$counting++;


  $j="$j"+6;

}//ending for loop


if($row==$counting){
    echo "<script>alert('Successfully recorded $row record for feedback,Thank you')</script>";
}
else{
  echo "<script>alert('Error in recording feedback')</script>";
}




// checking whether number of rows are equl to the $i 
//if $i and the $rows values are same then every values were inserted successfully
//else there was something error in inserrting

$conn->close();
//checks whether every values were inserted to the rating table successfully or not
}
}
//ending if,for if(number of records in rating for that particular usn == zero)

//if already 
else{

echo "<script>


document.getElementById('dis').style.display='none';

  </script>";


echo "
<div style='text-align:center'>

<h1 style='margin-botttom:5px'>you have already submited the feedback</h1>

<h1 style='margin-botttom:5px'>Your feedback are valueable</h1>
<h1 style='margin-botttom:5px'> Thank you, You may Logout</h1>

</div>
"

  ;
$conn->close();
}





?>


 <style>
      table,tr,th,td{
          border: 1px solid transparent;
          border-collapse: collapse;
      }
        
        input{
            width: 100%;
            height: 100%;
        }
        
    select{
      width: 100%;
      height: 100%;
      border: 0;
    }

table{
  margin-left: 10%;
  width: 80%;
  margin-right: 10%;
  margin-top: 2%;
}
td,input{
  text-align: center;
}

.me tr:nth-child(1)
    {
        background:  #84E184;
    }
    
span{
  font-size: 20px;
}


    </style>