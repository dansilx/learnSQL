<?php

    if(isset($_GET['id'])) {
        
        $id = $_GET['id'];

        require_once('connection.php');
        
        $mysql_query = "DELETE FROM contatos WHERE id = {$id}";

        if($conn->query($mysql_query) == TRUE) {
            $msg = "delete success";
        } else {
            $msg = "delete error";
            $msgerror = $conn->error;
        }

    } else {
        $msg = "delete error";
        $msgerror = "O ID não foi informado!";
    }