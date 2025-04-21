import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}
class _ConnexionState extends State<Connexion> { 
  // Cette clé est utilisée pour identifier et gérer l'état d'un formulaire Flutter
  final _formKey = GlobalKey<FormState>();
  // Gère le texte saisi dans le champ de mot de passe.
  final _passwordController = TextEditingController();

  String nom = '';
  String prenom = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact'),
      centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Champ Nom
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ est obligatoire';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Champ Prenom
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Prenom',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value == null || value.isEmpty
                            ? 'Entrer votre prénom'
                            : null,
                onSaved: (value) => prenom = value!,
              ),
              const SizedBox(height: 16),

              // Champ Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrer votre email';
                  } else if (!value.contains('@')) {
                    return 'Email invalide';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),

              // Champ Mot de passe
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) =>
                    value != null && value.length < 6
                        ? 'Minimum 6 caractères'
                        : null,
                onSaved: (value) => password = value!,
              ),
              const SizedBox(height: 16),

              // Champ confirmation de mot de passe
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Confirmation de mot de passe',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                 obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),

              // Champ bouton
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Envoyer"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Message envoyé !')),
                    );

                    _formKey.currentState!.reset();
                    _passwordController.clear();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
