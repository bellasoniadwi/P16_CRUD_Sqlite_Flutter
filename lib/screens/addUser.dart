import 'package:flutter/material.dart';
import 'package:trying_sqlite/model/User.dart';
import 'package:trying_sqlite/services/userService.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _userContactController = TextEditingController();
  var _userDescriptionController = TextEditingController();
  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  var _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite CRUD"),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Masukkan Barang',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Masukkan Nama',
                  labelText: 'Nama Barang',
                  errorText:
                    _validateName ? 'Nama barang tidak boleh kosong' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Masukkan Harga',
                  labelText: 'Harga Barang',
                  errorText:
                    _validateContact ? 'Harga barang tidak boleh kosong' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _userDescriptionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Masukkan Deskripsi',
                  labelText: 'Deskripsi Barang',
                  errorText:
                    _validateDescription ? 'Deskripsi barang tidak boleh kosong' : null,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      textStyle: const TextStyle(fontSize: 15)
                    ),
                    onPressed: () async{
                      setState(() {
                        _userNameController.text.isEmpty ? _validateName = true : _validateName = false;
                        _userContactController.text.isEmpty ? _validateContact = true : _validateContact = false;
                        _userDescriptionController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                      });

                      if (_validateName == false && _validateContact == false && _validateDescription == false)
                      {
                        // print("Good Data Can Save");
                        var _user = User();
                        _user.name = _userNameController.text;
                        _user.contact = _userContactController.text;
                        _user.description = _userDescriptionController.text;
                        var result = await _userService.SaveUser(_user);
                        print(result);
                      }

                    }, child: const Text('Save Details'),),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15)
                    ),
                    onPressed: (){
                      _userNameController.text='';
                      _userContactController.text='';
                      _userDescriptionController.text='';
                    }, child: const Text('Clear Details'),),
                ],
              )
            ],
          ),
        ),)
    );
  }
}