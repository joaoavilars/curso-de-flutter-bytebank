import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Criando transferência'),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical:16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 24.0,
                  ),
                  labelText: 'Número da conta',
                  hintText: '0000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 24.0,
                  ),
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            ElevatedButton(
                onPressed: onPressed,
                child: Text('Confirmar'),
            )
          ],
        ));
  }
}

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(101.00, '1000')),
          ItemTransferencia(Transferencia(250.00, '1002')),
          ItemTransferencia(Transferencia(300.00, '2200')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);
}
