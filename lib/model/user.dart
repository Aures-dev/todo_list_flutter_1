class User {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;
  final String password; // Ajout du mot de passe

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.password, // Ajout
  });
}

// Liste d'utilisateurs avec mot de passe
List<User> users = [
  User(
    id: 1,
    name: "Alice Doe",
    email: "alice@example.com",
    avatarUrl: "https://i.pravatar.cc/150?img=1",
    password: "alice123",
  ),
  User(
    id: 2,
    name: "Bob Smith",
    email: "bob@example.com",
    avatarUrl: "https://i.pravatar.cc/150?img=2",
    password: "bobpass",
  ),
];
