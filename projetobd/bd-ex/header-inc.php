<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <title>Exemplo PHP&MySQL</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">PHP&MySQL</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="contatos.php">Contatos</a>
            </li>
        </ul>
    </div>
</nav>
<main>
<?php 
if (isset($_GET['msg'])) {
    $msg = $_GET['msg'];
    $msgerror = $_GET['msgerror'];
    if ($msg == 'insert success') {
		echo "<div class='alert alert-success' role='alert'>Registro inserido com sucesso!</div>";
    } else if ($msg  == 'insert error')  { 
            echo "<div class='alert alert-danger' role='alert'>Falha ao inserir o registro! {$msgerror}</div>";
    } else if ($msg  == 'update success')  { 
            echo "<div class='alert alert-success' role='alert'>Registro atualizado com sucesso!</div>";
    } else if ($msg  == 'update error')  { 
            echo "<div class='alert alert-danger' role='alert'>Falha ao atualizar o registro! {$msgerror}</div>";
    } else if ($msg  == 'delete success')  { 
            echo "<div class='alert alert-success' role='alert'>Registro excluido com sucesso!</div>";
    } else if ($msg  == 'delete error')  { 
            echo "<div class='alert alert-danger' role='alert'>Falha ao excluir o registro! {$msgerror}</div>";
    }
}
?>
<p>&nbsp;</p>