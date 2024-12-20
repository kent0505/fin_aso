import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/button/button_bloc.dart';
import '../blocs/model/model_bloc.dart';
import '../models/model.dart';
import '../core/utils.dart';
import '../widgets/del_dialog.dart';
import '../widgets/main_button.dart';
import '../widgets/my_field.dart';
import '../widgets/cat_card.dart';
import '../widgets/field_title.dart';
import '../widgets/title_text.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    super.key,
    required this.model,
  });

  final Model model;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
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

  void _onEdit() {
    context.read<ModelBloc>().add(EditModel(
          model: Model(
            id: widget.model.id,
            title: _controller1.text,
            amount: int.tryParse(_controller2.text) ?? 0,
            category: _controller3.text,
            expense: widget.model.expense,
          ),
        ));
    context.pop();
  }

  void _onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DelDialog(
          title: 'Delete?',
          onYes: () {
            context.read<ModelBloc>().add(DeleteModel(model: widget.model));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller1.text = widget.model.title;
    _controller2.text = widget.model.amount.toString();
    _controller3.text = widget.model.category;
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
        TitleText(widget.model.expense ? 'Edit Expense' : 'Edit Income'),
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
                ...getCat(widget.model.expense).map(
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
          onPressed: _onEdit,
        ),
        const SizedBox(height: 40),
        Center(
          child: MainButton(
            title: 'Delete',
            alwaysActive: true,
            width: 100,
            onPressed: _onDelete,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
