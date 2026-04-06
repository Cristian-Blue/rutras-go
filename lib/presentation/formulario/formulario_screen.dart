import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fechaController = TextEditingController();

  String nombre = '';
  String apellido = '';
  String correo = '';
  String telefono = '';

  String tipoUsuario = 'nativo';
  String? paisSeleccionado;
  DateTime? fechaVisita;

  final List<String> paises = [
    'Colombia',
    'México',
    'Argentina',
    'España',
    'Chile',
  ];

  Future<void> seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: fechaVisita ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        fechaVisita = picked;
        fechaController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // NOMBRE
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obligatorio'
                      : null,
                  onSaved: (value) => nombre = value!,
                ),

                // APELLIDO
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apellido'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obligatorio'
                      : null,
                  onSaved: (value) => apellido = value!,
                ),

                // CORREO
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Correo inválido';
                    }
                    return null;
                  },
                  onSaved: (value) => correo = value!,
                ),

                // TELEFONO
                TextFormField(
                  decoration: InputDecoration(labelText: 'Teléfono'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obligatorio';
                    }
                    if (value.length < 7) {
                      return 'Número inválido';
                    }
                    return null;
                  },
                  onSaved: (value) => telefono = value!,
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Tipo de usuario'),
                ),

                RadioGroup<String>(
                  groupValue: tipoUsuario,
                  onChanged: (value) {
                    setState(() {
                      tipoUsuario = value!;
                    });
                  },
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: Text('Nativo'),
                        value: 'nativo',
                      ),
                      RadioListTile<String>(
                        title: Text('Extranjero'),
                        value: 'extranjero',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // DROPDOWN
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'País'),
                  value: paisSeleccionado,
                  items: paises.map((pais) {
                    return DropdownMenuItem(value: pais, child: Text(pais));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      paisSeleccionado = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Seleccione un país' : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: fechaController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Fecha de visita',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: seleccionarFecha,
                  validator: (value) {
                    if (fechaVisita == null) {
                      return 'Seleccione una fecha';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // BOTON
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      print(nombre);
                      print(apellido);
                      print(correo);
                      print(telefono);
                      print(tipoUsuario);
                      print(paisSeleccionado);
                      print(fechaVisita);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario enviado')),
                      );
                    }
                  },
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
