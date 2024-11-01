import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController imgLinkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isEditing = false; // Флаг для отслеживания режима редактирования

  @override
  void initState() {
    super.initState();
    // Инициализация контроллеров с существими данными
    imgLinkController.text =
        'https://sun9-65.userapi.com/impg/egCJptfMeMf0grS3qUwZZ_8Kjd6A4np6fAb8Yw/GlOZc4LIG7s.jpg?size=1200x1600&quality=95&sign=97d582da74708703e426d3a4aaa47469&type=album';
    nameController.text = 'Багаутдинов Айрат Эдуардович';
    emailController.text = 'airat3552@gmail.com';
  }

  @override
  void dispose() {
    imgLinkController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing; // Переключение режима редактирования
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мой профиль'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // Добавлено для центрирования
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imgLinkController.text),
              ),
              const SizedBox(height: 20),
              if (isEditing) ...[
                TextField(
                  controller: imgLinkController,
                  decoration:
                      const InputDecoration(labelText: 'Ссылка на изображение'),
                  textAlign: TextAlign.center, // Выравнивание текста по центру
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Имя'),
                  textAlign: TextAlign.center, // Выравнивание текста по центру
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: 'Электронная почта'),
                  textAlign: TextAlign.center, // Выравнивание текста по центру
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleEdit,
                  child: const Text('Сохранить изменения'),
                ),
              ] else ...[
                Text(
                  nameController.text,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Выравнивание текста по центру
                ),
                const SizedBox(height: 10),
                Text(
                  emailController.text,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center, // Выравнивание текста по центру
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleEdit,
                  child: const Text('Редактировать'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
