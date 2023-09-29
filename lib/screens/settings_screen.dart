import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  Settings settings;
  final Function() onSettingsChanged;

  SettingsScreen({super.key, required this.settings, required this.onSettingsChanged});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem glúten',
                'Só exibe refeições sem glúten',
                widget.settings.isGlutenFree,
                (value) => setState(() => widget.settings.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem lactose',
                'Só exibe refeições sem lactose',
                widget.settings.isLactoseFree,
                (value) => setState(() => widget.settings.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'Só exibe refeições veganas',
                widget.settings.isVegan,
                (value) => setState(() => widget.settings.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'Só exibe refeições vegetarianas',
                widget.settings.isVegetarian,
                (value) => setState(() => widget.settings.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged();
      },
    );
  }
}
