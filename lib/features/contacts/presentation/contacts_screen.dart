import 'package:flutter/material.dart';
import '../../../core/constants.dart';

class Contact {
  final String name;
  final String phone;
  Contact({required this.name, required this.phone});
}

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Contact> _contacts = [];

  void _showAddDialog() {
    final _nameController = TextEditingController();
    final _phoneController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Adicionar contato'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: _contacts.length >= 5 ? null : () {
              final name = _nameController.text.trim();
              final phone = _phoneController.text.trim();
              if (name.isNotEmpty && phone.isNotEmpty) {
                setState(() {
                  _contacts.add(Contact(name: name, phone: phone));
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contatos de confiança')),
      body: _contacts.isEmpty
          ? const Center(child: Text('Nenhum contato adicionado'))
          : ListView.builder(
              itemCount: _contacts.length,
              itemBuilder: (_, i) {
                final c = _contacts[i];
                return ListTile(
                  leading: CircleAvatar(child: Text(c.name[0])),
                  title: Text(c.name),
                  subtitle: Text(c.phone),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() => _contacts.removeAt(i));
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _contacts.length >= 5 ? null : _showAddDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
        tooltip: _contacts.length >= 5 ? 'Máximo de 5 contatos' : 'Adicionar contato',
      ),
    );
  }
}
