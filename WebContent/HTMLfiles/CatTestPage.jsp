<!--CatTrivia-->


<!DOCTYPE html>
<html>
<head>
    <title>Cat Trivia</title>
    <link rel="stylesheet" type="text/css" href="main.css">
</head>

<body>
    <main>
        <div id="question">
        <h2 >How many cats in a pride of pride?    </h2>
            
        <!-- TODO: replace hard-coded answers with code.-->
            <div class='ans'>A - What's a pride of pride?</div>
            <div class='ans'>B - Nine, of course.</div>
            <div class='ans'>A - Always one more than you expect because they are extra.</div>
            <div class='ans'>D - You can never count because their colors are so dazzling.</div>
      
        </div>
        
        <form action="tobedetermined.php" method="post">
            <h1>Puss in Boots</h1>
            <div id="cat1">
                <label>Pose:</label>
                <input type="text" name="product_description" ><br>

                <label>Accessories:</label>
                <input type="text" name="list_price"><br>

                <label>Questions Answered Correctly this Game:</label>
                <input type="text" name="discount_percent"><span>%</span><br>
            </div>

            <div id="ans1">
                <label>&nbsp;</label>
                <input type="submit" value="Answer Question"><br>
            </div>
        </form>
        
        
        <form action="tobedetermined.php" method="post">
        <h1>Mazikeen</h1>
            <div id="cat2">
                <label>Pose:</label>
                <input type="text" name="product_description" ><br>

                <label>Accessories:</label>
                <input type="text" name="list_price"><br>

                <label>Questions Answered Correctly this Game:</label>
                <input type="text" name="discount_percent"><span>%</span><br>
            </div>

            <div id="ans2">
                <label>&nbsp;</label>
                <input type="submit" value="Answer Question"><br>
            </div>
        </form>
        
        <form>
        <h1>Bluebeard</h1>
            <div id="cat3">
                <label>Pose:</label>
                <input type="text" name="product_description" ><br>

                <label>Accessories:</label>
                <input type="text" name="list_price"><br>

                <label>Questions Answered Correctly this Game:</label>
                <input type="text" name="discount_percent"><span>%</span><br>
            </div>

            <div id="ans3">
                <label>&nbsp;</label>
                <input type="submit" value="Answer Question"><br>
            </div>
        </form>
        
         <form>
        <h1>PrideCat</h1>
            <div id="cat4">
                <label>Pose:</label>
                <input type="text" name="product_description" ><br>

                <label>Accessories:</label>
                <input type="text" name="list_price"><br>

                <label>Questions Answered Correctly this Game:</label>
                <input type="text" name="discount_percent"><span>%</span><br>
            </div>

            <div id="ans4">
                <label>&nbsp;</label>
                <input type="submit" value="Answer Question"><br>
            </div>
        </form>
        
      
    </main>
</body>
</html>
       
       <!--Connect to MariaDB Server-->
      <?php
         //$dbhost = 'localhost:3036';
//         $dbuser = 'guest1';
//         $dbpass = 'guest1a';
//         $conn = mysql_connect($dbhost, $dbuser, $dbpass);
//      
//         if(! $conn ) {
//            die('Could not connect: ' . mysql_error());
//         }
//         
//         echo 'Connected successfully';
//         mysql_close($conn);
      ?>