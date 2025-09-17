import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../provider/item_provider.dart';

class EditItemScreen extends StatefulWidget {
  static const String routeName = '/edit-item';
  const EditItemScreen({super.key});

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late Item _item;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // ดึงข้อมูล Item ที่ถูกส่งมาจากหน้า ListScreen
    // เราใช้ didChangeDependencies เพราะ ModalRoute.of(context) ไม่ควรถูกเรียกใน initState
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    _item = item;

    // กำหนดค่าเริ่มต้นให้กับ Controller จากข้อมูลที่ได้รับ
    _nameController = TextEditingController(text: _item.name);
    _descriptionController = TextEditingController(text: _item.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveForm() {
    // ใช้ context.read เพื่อเรียกเมธอดใน provider โดยไม่ทำให้หน้านี้ rebuild
    context.read<ItemProvider>().updateItem(
          _item.id,
          _nameController.text,
          _descriptionController.text,
        );
    Navigator.pop(context); // กลับไปยังหน้าหลัก
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไข: ${_item.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'คำอธิบาย'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('บันทึกการเปลี่ยนแปลง'),
            )
          ],
        ),
      ),
    );
  }
}