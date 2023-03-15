<?php
session_start();
include('../connection.php');


use \PHPMailer\PHPMailer\PHPMailer;
use \PHPMailer\PHPMailer\Exception;

function send_password_reset($get_name, $get_email, $token){
        require 'PHPMailer/vendor/autoload.php';

        $mail = new PHPMailer(true);

        try {
            $mail->isSMTP();                                            //Send using SMTP
            $mail->Host       = 'smtp.mail.yahoo.com';                     //Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
            $mail->Username   = 'picsellplanet@yahoo.com';                     //SMTP username
            $mail->Password   = 'nvvnqmgjotyqaiqk';                               //SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;            //Enable implicit TLS encryption
            $mail->Port       = 587;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
        
            $mail->setFrom('picsellplanet@yahoo.com', $get_name);
            $mail->addAddress($get_email);     //Add a recipient

            //Content
            $mail->isHTML(true);                                  //Set email format to HTML
            $mail->Subject = 'Reset Password Notification of your account in Pic-Sell Planet';
            $mail->Body    = "You are receiving this email because we received a password reset request for your account,
                Please click the link below to reset your password
                <a href='https://picsellplanet.com/registration/password_change.php?token=$token&email=$get_email'>Click Here</a>";
        
            $mail->send();
            return true;
        } catch (Exception $e) {
            return false;
        }
}

if(isset($_POST['password_reset_link'])){
  $email = mysqli_real_escape_string($con, $_POST['email']);
  $token = md5(rand());

  $check_email = "SELECT user_email FROM `tbl_user_account` WHERE user_email='$email' LIMIT 1";
  $check_email_run = mysqli_query($con,$check_email);

  if(mysqli_num_rows($check_email_run) > 0){
    $row = mysqli_fetch_array($check_email_run);
    $get_name = $row['user_name'];
    $get_email = $row['user_email'];

    $update_token = "UPDATE tbl_user_account SET user_verification_code='$token' WHERE user_email='$get_email' LIMIT 1";
    $update_token_run = mysqli_query($con, $update_token);

    if($update_token_run){
      send_password_reset($get_name, $get_email, $token);
      echo '<script>alert("We send a password reset link to your email, Please Check.")
              window.location.href = "../login.php"</script>';
              exit(0);
    }
    else{
      echo '<script>alert("Something went wrong!")
              window.location.href = "password_reset.php"</script>';
              exit(0);
    }
    
  }
  else{
    echo '<script>alert("No Email Found!")
              window.location.href = "password_reset.php"</script>';
              exit(0);
  }

}

  if(isset($_POST['password_update'])){
    $email = mysqli_real_escape_string($con, $_POST['email']);
    $new_password = mysqli_real_escape_string($con, $_POST['new_password']);
    $hash_new_password = password_hash($new_password, PASSWORD_DEFAULT);
    $confirm_password = mysqli_real_escape_string($con, $_POST['confirm_password']);
    $token = mysqli_real_escape_string($con, $_POST['password_token']);

    if(!empty($token)){
      if(!empty($email) && !empty($new_password) && !empty($confirm_password)){
        $check_token = "SELECT user_verification_code FROM tbl_user_account WHERE user_verification_code = '$token' LIMIT 1";
        $check_token_run = mysqli_query($con, $check_token);

        if(mysqli_num_rows($check_token_run) > 0){
          if($new_password == $confirm_password){
            $update_password = "UPDATE tbl_user_account SET user_password='$hash_new_password' WHERE user_verification_code='$token' LIMIT 1";
            $update_password_run = mysqli_query($con, $update_password);

            if($update_password_run){
              $new_token = md5(rand())."funda";
              $update_to_new_code = "UPDATE tbl_user_account SET user_verification_code='$new_token' WHERE user_verification_code='$token' LIMIT 1";
              $update_to_new_code_run = mysqli_query($con, $update_to_new_code);


              echo '<script>alert("New Password Successfully Updated")
              window.location.href = "../login.php"</script>';
              exit(0);
            }
            else{
              echo '<script>alert("Did Not Update Password, Something Went Wrong")
              window.location.href = "password_change.php?token='.$token.'&email='.$email.'"</script>';
              exit(0);
            }
          }
          else{
            echo '<script>alert("Password Doest Not Match")
              window.location.href = "password_change.php?token='.$token.'&email='.$email.'"</script>';
              exit(0);
          }
        }
        else{
          echo '<script>alert("Invalid Token, Already Expired")
              window.location.href = "password_change.php?token='.$token.'&email='.$email.'"</script>';
              exit(0);
        }
      }
      else{
        echo '<script>alert("All Fields Are Mandatory")
              window.location.href = "password_change.php?token='.$token.'&email='.$email.'"</script>';
              exit(0);
      }
    }
    else{
      header("Location: password_change.php");
      exit(0);
    }
  }
  


?>