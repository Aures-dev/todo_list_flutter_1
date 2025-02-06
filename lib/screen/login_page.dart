import 'package:flutter/material.dart';
import '../model/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //  Icône stylisée
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 20),

                //  Titre
                const Text(
                  "Welcome !",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 10),

                //  Champ Nom d'utilisateur
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //  Champ Mot de passe
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                //  Message d'erreur
                if (message.isNotEmpty)
                  Text(
                    message,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),

                const SizedBox(height: 20),

                //  Bouton Connexion
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Text("Pas de compte ?"),
                SizedBox(height: 10),

                //  Bouton D'inscription
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: ()=>{
                      Navigator.pushNamed(context, "/register")
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                      ),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //  Fonction de connexion
  void login() {
    final userName = _nameController.text;
    final userPassword = _passwordController.text;

    // Vérifie si un utilisateur existe
    User? user = users.firstWhere(
      (el) => el.name == userName && el.password == userPassword,
      orElse: () => User(id: -1, name: "", email: "", avatarUrl: "", password: ""),
    );

    //  Affiche un message d'erreur si l'utilisateur est inconnu
    if (user.id == -1) {
      setState(() {
        message = "Nom d'utilisateur ou mot de passe incorrect";
      });
      return;
    }

    //  Redirection si l'utilisateur est valide
    Navigator.pushNamed(context, "/home");
  }
}
