import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { male, female }

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();
  bool _passwordVisible = false; // Para controlar la visibilidad de la contraseña
  bool _repPasswordVisible = false; // Para controlar la visibilidad de la contraseña
  Genre? _genre = Genre.male;
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  bool _isActionFavorite= false;
  bool _isAdventureFavorite= false;
  bool _isComicFavorite= false;
  bool _isTerrorFavorite= false;
  bool _isRomanceFavorite= false;
  bool _isFantacyFavorite= false;
  String buttonMsg="Fecha de Nacimiento";
  DateTime _data = DateTime.now();
  void _showSelectedDate() async{
    final DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now(),
      helpText: "Fecha de Naciemiento"
    );
    if(newDate != null){
      setState(() {
        _data = newDate;
        buttonMsg =  "Fecha de Nacimiento ${_dateConverter(_data)}";
      });
    }

  }
  final _city= TextEditingController();
  final List<String> _cities=[
    'Barranquilla',
    'Bogota',
    'Cali',
    'Medellin',
    'Neiva',
    'Ibague',
    'Manizales',
    'Tunja'
  ];
  String  _dateConverter(DateTime newDate){
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }
  void _onRegisterButtonClicked(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Asociamos la clave al formulario
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite su nombre",
                        prefixIcon: Icon(Icons.person)),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite su Correo",
                        prefixIcon: Icon(Icons.email)),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      } else if (!value.isValidEmail()) {
                        return 'Ingrese un correo válido';
                      }
                      return null; // Si pasa ambas validaciones
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite su Contraseña",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        )),
                    keyboardType: TextInputType.visiblePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }else if (!value.isPasswordValid()) {
                        return 'La contraseña debe tener al menos 8 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    obscureText: !_repPasswordVisible,
                    obscuringCharacter: '•',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Digite Nuevamente su Contraseña",
                        prefixIcon: Icon(Icons.password_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _repPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _repPasswordVisible = !_repPasswordVisible;
                            });
                          },
                        )),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      // Validar que las contraseñas coincidan
                      if (value != _password.text) {
                        return 'Las contraseñas no coinciden';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  DropdownMenu<String>(
                      width: 300,
                      enableFilter: true,
                      requestFocusOnTap: true,
                      label: const Text('ciudad'),
                      onSelected: (String?city){
                        setState(() {
                          _city.text =city!;
                        });

                      },
                      dropdownMenuEntries:
                          _cities.map<DropdownMenuEntry<String>>((String city){
                            return DropdownMenuEntry<String>(value: city, label: city);
                        }).toList(),
                      ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Seleccione Su Género"),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text("Masculino"),
                          leading: Radio<Genre>(
                            value: Genre.male,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text("Femenino"),
                          leading: Radio<Genre>(
                            value: Genre.female,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                      child: Text(buttonMsg),
                      onPressed:(){
                        _showSelectedDate();
                      }
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text("Seleccione sus Generos Favoritos"),
                  CheckboxListTile(
                    title: const Text("Acción"),
                      value: _isActionFavorite,
                      selected: _isActionFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isActionFavorite= value!;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Aventura"),
                      value: _isAdventureFavorite,
                      selected: _isAdventureFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isAdventureFavorite= value!;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Comedia"),
                      value: _isComicFavorite,
                      selected: _isComicFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isComicFavorite= value!;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Fantasia"),
                      value: _isFantacyFavorite,
                      selected: _isFantacyFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isFantacyFavorite= value!;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Romance"),
                      value: _isRomanceFavorite,
                      selected: _isRomanceFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isRomanceFavorite= value!;
                        });
                      }),
                  CheckboxListTile(
                      title: const Text("Terror"),
                      value: _isTerrorFavorite,
                      selected: _isTerrorFavorite,
                      onChanged: (bool? value){
                        setState(() {
                          _isTerrorFavorite= value!;
                        });
                      }),
                  ElevatedButton(
                    onPressed: () {

                      // Validar el formulario
                      if (_formKey.currentState?.validate() ?? false) {
                        _onRegisterButtonClicked();// Si es válido, hacer algo (e.g., enviar datos)
                        print('Formulario válido');
                      } else {
                        print('Formulario no válido');
                      }
                    },
                    child: const Text('Registrar'),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
extension on String {

  bool isValidEmail() {

    return RegExp(

        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')

        .hasMatch(this);

  }

}
extension on String{
  bool isPasswordValid(){
    return this.length>=8;
  }
}