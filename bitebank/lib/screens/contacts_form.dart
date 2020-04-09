import 'package:bitebank/database/app_database.dart';
import 'package:bitebank/database/contact_dao.dart';
import 'package:bitebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('New contact', style: TextStyle(fontSize: 24)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full name'),
                  style: TextStyle(
                    fontSize: 24,
                  )),
              TextField(
                controller: _accountController,
                decoration: InputDecoration(labelText: 'Account number'),
                style: TextStyle(
                  fontSize: 24,
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: RaisedButton(
                      child: Text('Create'),
                      onPressed: () {
                        final String name = _nameController.text;
                        final int account = int.tryParse(_accountController.text);
                        final Contact newContact = Contact(0, name, account);
                        _dao.save(newContact).then((id) => Navigator.pop(context));
                      },
                    ),
                  ))
            ],
          ),
        ));
  }
}
