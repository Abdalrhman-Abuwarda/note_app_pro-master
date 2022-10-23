import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:note_app_pro/resources/values.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/authProvider.dart';
import '../../../core/provider/noteProvider.dart';
import '../../../resources/assets.dart';
import '../../../routing/navigations.dart';
import '../../../routing/router.dart';
import '../../../utils/helper.dart';
import '../../shared/widget/toDoTile.dart';
import 'addNote/addNote.dart';

enum AppThemes { light, dark }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController addTaskController = TextEditingController();
  TextEditingController editTaskController = TextEditingController();
  var currentTheme = AppThemes.light;

  // final List data = Task.tasks;
  @override
  void initState() {
    Provider.of<NoteProvider>(context, listen: false).readNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NoteProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Consumer<NoteProvider>(builder: (context, value, child) {
          return FloatingActionButton(
            backgroundColor: const Color(0xFF252525),
            onPressed: () {
              addTaskController.clear();
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddNotePage(
                        noteController: addTaskController,
                        text: "Add Note",
                        hintText: "Type Something",
                        buttomText: "Save",
                        onPressed: () {
                          value.createNote(addTaskController.text);
                          addTaskController.clear();
                        },
                      ));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          );
        }),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90.h,
        backgroundColor: Colors.transparent,
        title: const Text('Notes'),
        actions: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF3B3B3B),
            child: Icon(
              Icons.search,
              color: Color(0xFF21AA93),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            ImageAssets.splashLogo,
            height: 50.h,
            width: 50.w,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xFF3B3B3B),
            child: Consumer<AuthProvider>(builder: (context, auth, child) {
              return IconButton(
                  onPressed: () {
                    ServiceNavigations.serviceNavi
                        .pushNamedWidget(RouteGenerator.settingPage);
                    // note.ClearTask();
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Color(0xFF21AA93),
                  ));
            }),
          ),
        ],
      ),
      body: provider.tasks == null
          ? Center(child: CircularProgressIndicator())
          : provider.tasks!.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if(data.isEmpty)
                    Center(
                      child: Image.asset(
                        "assets/image/mainImage.png",
                        height: 286,
                        width: 350,
                      ),
                    ),
                    // if(data.isEmpty)
                    const Text(
                      "Create your first note",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              : Consumer<NoteProvider>(
                  builder: (context, value, child) =>
                      // GroupedListView(
                      //   elements: value.tasks!,
                      //   groupBy: (elements) => elements.created_at.substring(0, 10),
                      //   groupSeparatorBuilder: (value) => Container( margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),height: 30.h,child: Text(value)),
                      //   groupHeaderBuilder: null,
                      //   itemBuilder: (context, element) => ToDoTile(
                      //     taskName: element.title,
                      //     deleteFunction: (val) {
                      //       showDialog(
                      //           context: context,
                      //           builder: (context) => alertDialog(
                      //                 title: "Delete Note",
                      //                 content: "Do You Want delete this note",
                      //                 onPressed: () {
                      //                   value.delete(element.id);
                      //                 },
                      //               ));
                      //     },
                      //     editFunction: (val) {
                      //       showModalBottomSheet(
                      //           isScrollControlled: true,
                      //           context: context,
                      //           builder: (context) => AddNotePage(
                      //                 noteController: editTaskController,
                      //                 text: "Edit Note",
                      //                 hintText: "Type Something",
                      //                 buttomText: "Save",
                      //                 onPressed: () {
                      //                   value.update(
                      //                       id: element.id,
                      //                       titel: editTaskController.text);
                      //                   editTaskController.clear();
                      //                 },
                      //               ));
                      //     },
                      //   ),
                      // )
                      ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.tasks!.length,
                    itemBuilder: (context, index) => Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(int i=0;i<value.tasks!.length;i++)...{
                            Visibility(
                              // value.tasks![index].created_at.substring(0, 10) == value.datesFilterTask[index] ? true : false
                                visible: value.tasks![index].created_at.substring(0, 10) == value.datesFilterTask[i] ? true : false,
                                child: Text(value.tasks![index].created_at.substring(0, 10))),
                          },
                          addVerticalSpace(10),
                          ToDoTile(
                            taskName: value.tasks![index].title,
                            deleteFunction: (val) {
                              showDialog(
                                  context: context,
                                  builder: (context) => alertDialog(
                                        title: "Delete Note",
                                        content: "Do You Want delete this note",
                                        onPressed: () {
                                          value.delete(value.tasks![index].id);
                                        },
                                      ));
                            },
                            editFunction: (val) {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => AddNotePage(
                                        noteController: editTaskController,
                                        text: "Edit Note",
                                        hintText: "Type Something",
                                        buttomText: "Save",
                                        onPressed: () {
                                          value.update(
                                              id: value.tasks![index].id,
                                              titel: editTaskController.text);
                                          editTaskController.clear();
                                        },
                                      ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
    );
  }
}
// value.tasks![index].id, editTaskController.text
