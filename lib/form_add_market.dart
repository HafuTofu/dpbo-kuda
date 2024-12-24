import 'package:flutter/material.dart';
import 'materials.dart';
import '../controller/sqlite.dart';
import '../controller/market.dart';


enum MarketType { offline, online }

class AddMarketForm extends StatefulWidget {
  const AddMarketForm({super.key});

  @override
  _AddMarketFormState createState() => _AddMarketFormState();
}

class _AddMarketFormState extends State<AddMarketForm> {
  final _formKey = GlobalKey<FormState>();
  final marketname = TextEditingController();
  final marketdesc = TextEditingController();
  final marketmail = TextEditingController();
  final marketphone = TextEditingController();
  final marketype = TextEditingController();
  final marketloc = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Materials().header(const Color(0xFF808080), 'CIG APP REGISTER'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: marketname,
                decoration: const InputDecoration(
                  labelText: 'market name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your market name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: marketype,
                decoration: const InputDecoration(
                  labelText: 'market type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your market type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                controller: marketdesc,
                decoration: const InputDecoration(
                  labelText: 'market desc',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a market desc';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: marketmail,
                decoration: const InputDecoration(
                  labelText: 'market email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a market email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: marketphone,
                decoration: const InputDecoration(
                  labelText: 'market phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a market phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                maxLines: 5,
                controller: marketloc,
                decoration: const InputDecoration(
                  labelText: 'marketlocation',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a market location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final market = Market(
                      marketname.text,
                      marketype.text,
                      marketdesc.text,
                      marketmail.text,
                      marketphone.text,
                      marketloc.text,
                    );
                    int result = await _databaseHelper.registerMarket(market);
                    if (result > 0) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to add new market card')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF808080),
                    foregroundColor: Colors.white),
                child: const Text('Add new Market Card'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF575757)),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
