




<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Formulaire d'inscription</title>
  <link rel="stylesheet" href="connexinstyle.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
</head>
<body>
  <form>
     
    <h1>MODERN STUDENT LOGE</h1>
    <!--
    <div class="social-media">
      <p><i class="fab fa-google"></i></p>
      <p><i class="fab fa-youtube"></i></p>
      <p><i class="fab fa-facebook-f"></i></p>
      <p><i class="fab fa-twitter"></i></p>
    </div>-->
    <p class="choose-email">ou utiliser mon adresse e-mail :</p>
    
    <div class="inputs">
      <input type="email" name="mail" id="mail" placeholder="Email" required/>
      <input type="text" name="nom" id="nom" placeholder="Nom" required/>
      <input type="text" name="prenom" id="prenom" placeholder="Prenom" required/>
      Date de naissance
      <input type="date" name="naissance" id="naissance" placeholder="Date de naissance"/><br>
      <input type="numeric" name="code" id="code" placeholder="Code Etudiant"/><br>
      <input type="password" name="mdp" id="mdp" placeholder="Mot de passe" required/>
      <input type="password" name="cmdp" id="cmdp" placeholder="Confirmation du Mot de passe" required/>
    </div>
    
    <p class="inscription">Je n'ai pas de <span>compte</span>. Je m'en <span>crée</span> un.</p>
    <div align="center">
      <button type="submit" name="submit" id="submit" value="ok">S'inscrire</button>
    </div>
  </form>
</body>
</html>


<?php
  if(isset($_POST['submit'])){
    extract($_POST);

    if(!empty($mdp) && !empty($cmdp) && !empty($mail) && !empty($nom) && !empty($prenom) && !empty($naissance) && !empty($code)){
      if($mdp == $cmdp){
          $option = [
            'cost' => 12,
          ];
      $hashpass = password_hash($mdp,PASSWORD_BCRYPT,$option);
      include 'Projet Gestion de chambre\IAM CAMPUS SITE\database.php';
      global $db;
      $q = $db->prepare("INSERT INTO student(NOM_STDT,PRENOM_STDT,NAISSANCE_STDT,	MAIL_STDT,MDP_STDT,CODE_STDT) VALUES(:nom,:prenom,:naissance,:mail,:mdp,:code)");

      $q->execute([
          'nom'=> $mail,
          'prenom'=> $prenom,
          'naissance'=> $naissance,
          'mail'=> $mail,
          'code'=> $hashpass
      ]);
      }
      // if(password_verify('vinaigrette22',$hashpass)){
      //   echo "Le mot de passe est le meme";
      // }else{
      //   echo "Le mot de passe est incorrect";
      // }
    }else{
      echo "Les champs ne sont pas tous remplis";
    }
  }
?>