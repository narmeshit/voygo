import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:voygo/data/models/agency.dart';
import 'package:voygo/logic/providers/category_provider.dart';

import '../../../logic/providers/agency_provider.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  String? frontPageUrl;
  String? avatarUrl;

  final formKey = GlobalKey<FormState>();
  final rucController = TextEditingController();
  final companyNameController = TextEditingController();
  final addressController = TextEditingController();
  final referenceController = TextEditingController();
  final emailController = TextEditingController();
  final servicesController = TextEditingController();
  final descriptionController = TextEditingController();
  final cellPhoneNumberController = TextEditingController();
  final schedulesController = TextEditingController();
  final attentionTimeController = TextEditingController();
  final frontPageController = TextEditingController();
  final avatarController = TextEditingController();
  final locationController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  void dispose() {
    rucController.dispose();
    companyNameController.dispose();
    addressController.dispose();
    referenceController.dispose();
    emailController.dispose();
    servicesController.dispose();
    descriptionController.dispose();
    cellPhoneNumberController.dispose();
    schedulesController.dispose();
    attentionTimeController.dispose();
    frontPageController.dispose();
    avatarController.dispose();
    locationController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  void toggleForm() {
    if (formKey.currentState!.validate()) {
      print('Formulario válido');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Agencia agregado'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final agencyProvider = Provider.of<AgencyProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear'),
        actions: [
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final agency = Agency(
                  ruc: rucController.text.trim(),
                  companyName: companyNameController.text.trim(),
                  address: addressController.text.trim(),
                  reference: referenceController.text.trim(),
                  email: emailController.text.trim(),
                  services: servicesController.text.trim(),
                  description: descriptionController.text.trim(),
                  cellPhoneNumber: cellPhoneNumberController.text.trim(),
                  schedules: schedulesController.text.trim(),
                  attentionTime: attentionTimeController.text.trim(),
                  frontPage: frontPageController.text.trim(),
                  avatar: avatarController.text.trim(),
                  location: locationController.text.trim(),
                  categoryId: int.parse(categoryController.text.trim()),
                );
                agencyProvider.create(agency);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Agencia agregado'),
                  ),
                );
                context.pop();
              }
            },
            child: const Text('Guardar'),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              if (frontPageUrl != null)
                Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        frontPageUrl!,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              FilledButton.tonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('400x250'),
                        content: TextField(
                          controller: frontPageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'URL portada',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar'),
                          ),
                          FilledButton(
                            onPressed: () {
                              setState(() {
                                frontPageUrl = frontPageController.text;
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Validar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Subir portada'),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: rucController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.assignment_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'RUC (*)',
                ),
                maxLength: 11,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un RUC';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.account_balance_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Nombre empresa (*)',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre de empresa';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  icon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                  labelText: 'Categoria (*)',
                ),
                value: categoryController.text.isEmpty
                    ? null
                    : categoryController.text,
                items: categoryProvider.categories.map(
                  (category) {
                    return DropdownMenuItem<String>(
                      value: '${category.id}',
                      child: Text(category.name),
                    );
                  },
                ).toList(),
                onChanged: (valor) {
                  categoryController.text = valor ?? '';
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una categoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: servicesController,
                maxLines: 2,
                decoration: const InputDecoration(
                  icon: Icon(Icons.directions_bus_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Servicios (*)',
                ),
                maxLength: 75,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa los servicios';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.map_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Dirección',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: referenceController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.library_books_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Referencia',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Correo electrónico',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              
              const SizedBox(height: 24.0),
              TextFormField(
                controller: descriptionController,
                maxLines: 8,
                decoration: const InputDecoration(
                  icon: Icon(Icons.article_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Descripción',
                ),
                maxLength: 300,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: cellPhoneNumberController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Número de celular',
                ),
                maxLength: 9,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: schedulesController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.calendar_today_outlined),
                  labelText: 'Horarios',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: attentionTimeController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                  labelText: 'Atención',
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                  labelText: 'Ubicación',
                ),
              ),
              const SizedBox(height: 24.0),
              if (avatarUrl != null)
                ClipOval(
                  clipBehavior: Clip.hardEdge,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        avatarUrl!,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator(),
                                );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              FilledButton.tonal(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('200x200'),
                        content: TextField(
                          controller: avatarController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'URL avatar',
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancelar'),
                          ),
                          FilledButton(
                            onPressed: () {
                              setState(() {
                                avatarUrl = avatarController.text;
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Validar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Subir avatar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
