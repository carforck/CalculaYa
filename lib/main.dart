import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalculaYa!',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: colors.secondary.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  )
                ],
              ),
              child: Icon(
                Icons.calculate_outlined,
                size: 80,
                color: colors.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'CalculaYa!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: colors.primary,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Tu aliado en cálculos rápidos y sencillos',
              style: TextStyle(
                fontSize: 16,
                color: colors.onBackground.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 60),
            FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalculatorScreen()),
                );
              },
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Inicia aqui'),
              style: FilledButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('CalculaYa!'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              color: colors.surfaceVariant.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.calculate_rounded,
                        size: 48, color: colors.primary),
                    const SizedBox(height: 24),
                    _buildInputField(
                      controller: _num1Controller,
                      label: 'Primer número',
                      hint: 'Ingresa un número',
                      icon: Icons.looks_one_outlined,
                      colors: colors,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      controller: _num2Controller,
                      label: 'Segundo número',
                      hint: 'Ingresa otro número',
                      icon: Icons.looks_two_outlined,
                      colors: colors,
                    ),
                    const SizedBox(height: 30),
                    _buildOperationRow([
                      _buildOperationButton('Suma', Icons.add, 'suma', colors),
                      _buildOperationButton(
                          'Resta', Icons.remove, 'resta', colors),
                    ]),
                    const SizedBox(height: 12),
                    _buildOperationRow([
                      _buildOperationButton(
                          'Multiplicación', Icons.clear, 'multiplicación', colors),
                      _buildOperationButton(
                          'División', Icons.horizontal_rule, 'división', colors),
                    ]),
                    const SizedBox(height: 25),
                    OutlinedButton.icon(
                      onPressed: _clear,
                      icon: const Icon(Icons.refresh_outlined),
                      label: const Text('Limpiar'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(color: colors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: colors.surfaceVariant.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: colors.primary.withOpacity(0.3)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.functions_rounded,
                        size: 36, color: colors.secondary),
                    const SizedBox(height: 12),
                    Text(
                      'Resultado ($_operation)',
                      style: TextStyle(
                        color: colors.primary,
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
                        color: colors.onBackground,
                        fontSize: 34,
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

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ColorScheme colors,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: colors.primary),
        filled: true,
        fillColor: colors.surfaceVariant.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget _buildOperationRow(List<Widget> buttons) {
    return Row(
      children: [
        Expanded(child: buttons[0]),
        const SizedBox(width: 12),
        Expanded(child: buttons[1]),
      ],
    );
  }

  Widget _buildOperationButton(
      String text, IconData icon, String operation, ColorScheme colors) {
    return FilledButton.icon(
      onPressed: () => _calculate(operation),
      icon: Icon(icon),
      label: Text(text),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
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
