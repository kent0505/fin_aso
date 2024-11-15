import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/button/button_bloc.dart';
import '../blocs/model/model_bloc.dart';
import '../models/model.dart';
import '../core/utils.dart';
import '../widgets/main_button.dart';
import '../widgets/my_field.dart';
import '../widgets/cat_card.dart';
import '../widgets/field_title.dart';
import '../widgets/title_text.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
    required this.expense,
  });

  final bool expense;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  void _onCheck() {
    context.read<ButtonBloc>().add(CheckButton(
          controllers: [
            _controller1.text,
            _controller2.text,
            _controller3.text,
          ],
        ));
  }

  void _onCategory(String value) {
    if (identical(value, _controller3.text)) return;
    _controller3.text = value;
    _onCheck();
  }

  void _onSave() {
    context.read<ModelBloc>().add(AddModel(
          model: Model(
            id: currentTimestamp(), // - 86400
            title: _controller1.text,
            amount: int.tryParse(_controller2.text) ?? 0,
            category: _controller3.text,
            expense: widget.expense,
          ),
        ));
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _onCheck();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 14),
        TitleText(widget.expense ? 'Add Expense' : 'Add Income'),
        const SizedBox(height: 18),
        const FieldTitle('Title'),
        const SizedBox(height: 2),
        MyField(
          controller: _controller1,
          hintText: 'Name title',
          onChanged: _onCheck,
        ),
        const SizedBox(height: 8),
        const FieldTitle('Amount'),
        const SizedBox(height: 2),
        MyField(
          controller: _controller2,
          hintText: '\$0.00',
          isNumber: true,
          onChanged: _onCheck,
        ),
        const SizedBox(height: 8),
        const FieldTitle('Category'),
        const SizedBox(height: 20),
        BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Column(
              children: [
                ...getCat(widget.expense).map(
                  (title) {
                    return CatCard(
                      title: title,
                      current: _controller3.text,
                      onPressed: _onCategory,
                    );
                  },
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 40),
        MainButton(
          title: 'Next',
          onPressed: _onSave,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
