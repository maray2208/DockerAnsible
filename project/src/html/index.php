<?php

if ($_SERVER['REQUEST_URI'] == '/api') {
  usleep(300000);
  echo "API!";
} elseif ($_SERVER['REQUEST_URI'] == '/news') {
  usleep(50000);
  echo "News!";
} else {
    echo "Hello world!";
}

?>

