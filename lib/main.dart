import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 👈 esto lo quita
      title: 'Calculadora Moderna',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange[200],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Colors.orange.shade300, blurRadius: 8)
                ],
              ),
              child: Icon(
                Icons.calculate_outlined,
                size: 80,
                color: Colors.orange[800],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Calculadora Moderna',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.orange[800],
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Realiza varias operaciones matemáticas',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange[600],
              ),
            ),
            const SizedBox(height: 50),
            FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalculatorScreen()),
                );
              },
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Empezar'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                backgroundColor: Colors.orange[400],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _result = 0;
  String _operation = '';

  void _calculate(String operation) {
  final num1 = double.tryParse(_num1Controller.text) ?? 0;
  final num2 = double.tryParse(_num2Controller.text) ?? 0;
  setState(() {
    switch (operation) {
      case 'suma':
        _result = num1 + num2;
        break;
      case 'resta':
        _result = num1 - num2;
        break;
      case 'multiplicación':
        _result = num1 * num2;
        break;
      case 'división':
        _result = num2 != 0 ? num1 / num2 : double.nan;
        break;
      case 'potencia':
        _result = ((num1, num2) as double); // Casting a double
        break;
      case 'raíz':
        _result = (num1);
        break;
      default:
        _result = 0;
        break;
    }
    _operation = operation;
  });
}


  void _clear() {
    _num1Controller.clear();
    _num2Controller.clear();
    setState(() {
      _result = 0;
      _operation = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              shadowColor: Colors.orange.shade300,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.calculate_outlined,
                      size: 48,
                      color: Colors.orange[700],
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _num1Controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Primer número',
                        hintText: 'Ingresa el primer número',
                        prefixIcon: const Icon(Icons.looks_one_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.orange[50],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _num2Controller,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: 'Segundo número',
                        hintText: 'Ingresa el segundo número',
                        prefixIcon: const Icon(Icons.looks_two_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.orange[50],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('suma'),
                            icon: const Icon(Icons.add),
                            label: const Text('Suma'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('resta'),
                            icon: const Icon(Icons.remove),
                            label: const Text('Resta'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('multiplicación'),
                            icon: const Icon(Icons.clear),
                            label: const Text('Multiplicación'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('división'),
                            icon:  Icon(Icons.horizontal_rule),
                            label: Text('División'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('potencia'),
                            icon: const Icon(Icons.exposure),
                            label: const Text('Potencia'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () => _calculate('raíz'),
                            icon: const Icon(Icons.accessibility_new),
                            label: const Text('Raíz'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              backgroundColor: Colors.orange[500],
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _clear,
                            icon: const Icon(Icons.refresh_outlined),
                            label: const Text('Limpiar'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: BorderSide(color: Colors.orange[300]!),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 4,
              color: Colors.orange[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.orange[200]!),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(
                      Icons.functions_outlined,
                      size: 36,
                      color: Colors.orange[700],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Resultado ($_operation)',
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _result.isNaN
                          ? 'Error: División por 0'
                          : (_result % 1 == 0
                              ? _result.toInt().toString()
                              : _result.toStringAsFixed(2)),
                      style: TextStyle(
                        color: Colors.orange[800],
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}