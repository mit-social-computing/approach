<?php 
    print_r( $_SERVER );
    echo strpos( $_SERVER['PHP_SELF'], 'task');
    echo isset( $_SERVER['argc'] );
?>
