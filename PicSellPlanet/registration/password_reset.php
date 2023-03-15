<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
      <title>Reset Password | Pic-Sell Planet</title>
       <!-- CSS -->
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
       <link rel="shortcut icon" href="../css/images/shortcut-icon.png">
       <style>
        .buts{
          text-align: center;

        }

        .btn{
          background: #fed136;
          color: #114481;
        }

        .btn:hover{
          background: #114481;
          color: #fed136;
        }

        .card-header{
          background: #114481;
          color: #fed136;
        }
       </style>
   </head>
   <body>
      <div class="container" style="width:30%;margin-top: 250px;">
          <div class="card">
            <div class="card-header text-center">
              <h3>Forgot Password</h3>
            </div>
            <div class="card-body">
              <form action="password_reset_code.php" method="post">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Your Email Address">
                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="buts">
                <input type="submit" name="password_reset_link" class="btn btn-primary" value="Send Reset Password">
                </div>
              </form>
              </br>
              <p style="text-align:center;"><a style="text-decoration:none; color:#114481; font-weight:bold;" href="../login.php">Go Back to Login Page</a></p>
            </div>
          </div>
      </div>
 
   </body>
</html>