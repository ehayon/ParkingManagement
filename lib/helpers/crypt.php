<?php

function blowfish($password) {
    // generate a salt
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    $salt = '$5$rounds=100$';
    for($i=0; $i<15; $i++)
        $salt .= substr($chars, mt_rand(0,strlen($chars)-1), 1);

    $hashed_password = crypt($password, $salt);
    return array(
        'hashed_password' => $hashed_password,
        'password_salt' => $salt
    );
}

