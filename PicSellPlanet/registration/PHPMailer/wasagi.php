<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'vendor/autoload.php';

$mail = new PHPMailer(true);
try{
    $mail->SMTPDebug = 1;
    $mail->isSMTP();
    $mail->Host = 'smtp.hostinger.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'admin@picsellplanet.com';
    $mail->Password = 'Picsellplanet123@';
    $mail->SMTPSecure = 'tls';
    $mail->Port = 587;

    $mail->setFrom('admin@picsellplanet.com', 'PicSellPlanet');

    $mail->addAddress('admin@picsellplanet.com');

    $body = '<p><strong> This is my first email with PHPMailer</p>';


    $mail->isHTML(true);
    $mail->Subject = 'Test Email';

    $mail->Body = $body;
    $mail->AltBody = strip_tags($body);

    $mail->send();
    echo 'Message has been sent';


}catch(Exception $e){
    echo 'Message has not been sent';
    echo 'Mailer error: ' . $mail->ErrorInfo;
}
