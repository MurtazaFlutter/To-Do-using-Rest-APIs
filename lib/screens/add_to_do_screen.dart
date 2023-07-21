import '../utils/export.dart';

class AddTODOScreen extends StatelessWidget {
  const AddTODOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController desController = TextEditingController();
    final todoProvider = Provider.of<TODOProvider>(context, listen: false);
    void addToDo() {
      todoProvider.addTodo(
          context: context,
          isCompleted: false,
          title: titleController.text,
          description: desController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add TODO'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Gap(100),
            CustomTextField(
              hintText: 'Title',
              validator: (value) {
                return null;
              },
              controller: titleController,
              lines: 1,
            ),
            const Gap(20),
            CustomTextField(
              hintText: 'Description',
              validator: (value) {
                return null;
              },
              controller: desController,
              lines: 10,
            ),
            const Gap(20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: addToDo,
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
