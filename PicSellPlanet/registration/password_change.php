<!doctype html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
      <title>Password Change | Pic-Sell Planet</title>
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
              <h3>Change Password</h3>
            </div>
            <div class="card-body">
              <form action="password_reset_code.php" method="post">
                <input type="hidden" name="password_token" value="<?php if(isset($_GET['token'])){echo $_GET['token'];} ?>">
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" name="email" class="form-control" id="email" placeholder="Enter Your Email Address" value="<?php if(isset($_GET['email'])){echo $_GET['email'];} ?>">
                  <label>New Password</label>
                  <input type="password" name="new_password" class="form-control" placeholder="Enter Your New Password">
                  <label>Confirm Password</label>
                  <input type="password" name="confirm_password" class="form-control" placeholder="Confirm New Password">
                </div>
                <div class="buts">
                <input type="submit" name="password_update" class="btn btn-primary" value="Change Password">
                </div>
              </form>
            </div>
          </div>
      </div>
 
   </body>
</html>