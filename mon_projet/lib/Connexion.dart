import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() =>  _ConnexionState();
}

class  _ConnexionState extends State <Connexion> {
  final _formkey = GlobalKey<FormState>();  //validation de formulaire
  final _emailController = TextEditingController(); //controller pour le champ email
  final _passwordController = TextEditingController();  //controller pour le champ mot de passe

  void _connecter(){ //méthode de connexion
    if (_formkey.currentState!.validate()) {  //validation du formulaire
      // Récupération des valeurs des champs
      String email = _emailController.text;
      String password = _passwordController.text; 

      if (email == "Admin" && password == "password"){ //vérification des identifiants
        // Affichage d'une boîte de dialogue de succès
        showDialog(context: context, 
         builder: (_) => AlertDialog(
          title: Text("Connexion réussie"),
          content: Text("Bienvenue $email"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),  //fermeture de la boîte de dialogue
              child: Text("OK"),  
            ),
          ]
         )
         );
      } else {  //si les identifiants sont incorrects
        // Affichage d'une boîte de dialogue d'erreur
        showDialog(context: context,  
         builder: (_) => AlertDialog( 
          title: Text("Erreur de connexion"), 
          content: Text("Identifiants incorrects"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),  //fermeture de la boîte de dialogue
              child: Text("OK"),
            ),
          ]
         )
         );
      }
  }
  }
  @override // méthode de construction de l'interface utilisateur
  // Cette méthode est appelée pour construire l'interface utilisateur de l'application
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
        centerTitle: true, // Centrer le titre de la barre d'application
        backgroundColor: Colors.blue, // Couleur de fond de la barre d'application
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form( // Formulaire pour la connexion
          // Utilisation de la clé de formulaire pour la validation
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController, //controller pour le champ email
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'),  
                validator: (value) {  //validation du champ email
                  // Vérification si le champ est vide
                  if (value == null || value.isEmpty) { // Vérification si le champ est vide
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20), // Espace entre les champs
              TextFormField(
                controller: _passwordController,  //controller pour le champ mot de passe
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mot de passe'),
                obscureText: true,  // Masquer le mot de passe
                // Validation du champ mot de passe
                validator: (value) {  
                  if (value == null || value.isEmpty) { // Vérification si le champ est vide
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50), // Espace entre les champs et le bouton
              // Bouton de connexion
              ElevatedButton(
                onPressed: _connecter,  // Appel de la méthode de connexion
                // Affichage du texte sur le bouton
                child: Text('Se connecter'),  
              ),
            ],),
        ),
      ),
      );
  }
}