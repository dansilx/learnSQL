<?php
require("header-inc.php");
	
?>
<div class="container">
	<h2>Contatos</h2>
  	<p>Atualização do cadastro de contatos.</p>
  	<hr>  	
	<div class="wrapper">
		<form method="post">
			<input type="hidden" name="id" value="<?= $row['id']; ?>">
			<label for="name">&nbsp;Nome</label>
			<input type="text" name="nome" id="nome" class="form-control" required value="<?= $row['nome']; ?>"><br>
			<label for="email">&nbsp;E-Mail</label>
			<input type="text" name="email" id="email" class="form-control"required value="<?= $row['email']; ?>"><br>
			<label for="datanasc">&nbsp;Data de Nascimento</label>
			<input type="date" name="datanasc" id="datanasc" class="form-control" 
												style="width: 200px;" value="<?= $row['datanasc']; ?>"><br>
			<input type="submit" name="enviar" value="Atualizar" class="btn btn-primary w100">
		</form>
	</div>
</div>

<?php require("footer-inc.php"); ?>