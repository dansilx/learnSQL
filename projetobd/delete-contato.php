<?php

    if(isset($_GET['id'])) {
       
        $id = $_GET['id'];
        try { 
        require_once('connection.php');
        $conn->begin_transaction();

        $mysql_query = "DELETE FROM contatos WHERE id = {$id}";

        if($conn->query($mysql_query) == TRUE) {
            $msg = "delete success";
            $msgerror = "";
        } else {
            $msg = "delete error";
            $msgerror = $conn->error;
        }

        $conn->commit();

        } catch(Exception $e) {
            $msg = "delete error";
            $msgerror = "Message: " . $e->getMessage();
            $conn->rollback();
        }

    } else {
        $msg = "delete error";
        $msgerror = "O ID não foi informado!";
    }

    header("Location: contatos.php?msg={$msg}&msgerror={msgerror}");