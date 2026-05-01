import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Responsive Layout dengan LayoutBuilder
class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.queryWidth});

  final double queryWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: queryWidth * 0.25,
          height: constraints.maxHeight * 0.3,
          color: Colors.amber,
        );
      },
    );
  }
}

/*
  Di Flutter ada 2 tipe UI:

        1. Widget biasa
         - masuk ke tree
         - return Widget
        2. Overlay (Dialog, Snackbar, BottomSheet)
          - dipanggil pakai function
          - return Future

        Contoh lain:

        showDialog()
        showModalBottomSheet()
        ScaffoldMessenger.showSnackBar()

        👉 Semua ini bukan Widget return
*/
// Membuat dialog yang otomatis menyesuaikan dengan platform (tanpa package adaptivedialog)
//  Future<void> _showalertDialog (BuildContext context) {
//     final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return isIOS ? CupertinoAlertDialog(
//           title: Text("Go to Even Page"),
//           content: Text("Are You sure want to go to event page?"),
//           actions: [
//             CupertinoDialogAction(
//               onPressed: (){
//                 context.pop();
//               },
//               child: Text("No"),
//               ),
//                CupertinoDialogAction(
//               onPressed: (){
//                 context.go("/homePage/event");
//               },
//               child: Text("Yes"),
//               ),
//           ],
//         ) : AlertDialog(
//           title: Text("Go to Even Page"),
//           content: Text("Are You sure want to go to event page?"),
//           actions: [
//             TextButton.icon(
//               onPressed: (){
//                 context.pop();
//               },
//               icon: Icon(Icons.close),
//               label: Text("No"),
//               ),
//                TextButton.icon(
//               onPressed: (){
//                 context.go("/homePage/event");
//               },
//               icon: Icon(Icons.check),
//               label: Text("Yes"),
//               ),
//           ],
//         );
//       }
//       );
//  }

// Menggunakan package adaptivedialog untuk membuat dialog yang otomatis menyesuaikan dengan platform
Future<void> showAdaptiveAlertDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    animationStyle: AnimationStyle(
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 2),
    ),
    builder: (context) {
      final platform = Theme.of(context).platform;

      // iOS style
      if (platform == TargetPlatform.iOS) {
        return CupertinoAlertDialog(
          title: const Text("Go to Event Page"),
          content: const Text("Are you sure want to go to event page?"),
          actions: [
            CupertinoDialogAction(
              onPressed: () => context.pop(),
              child: const Text("No"),
            ),
            CupertinoDialogAction(
              onPressed: () => context.go("/homePage/event"),
              child: const Text("Yes"),
            ),
          ],
        );
      }

      // Default (Android, Web, Desktop)
      return AlertDialog(
        title: const Text("Go to Event Page"),
        content: const Text("Are you sure want to go to event page?"),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text("No")),
          TextButton(
            onPressed: () => context.go("/homePage/event"),
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}
 //Button DatePicker
ElevatedButton datepicker(BuildContext context) {
    return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  
                ),
                onPressed: (){
                  Theme.of(context).platform == TargetPlatform.android
                  ? showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(), 
                    firstDate: DateTime(2000), 
                    lastDate: DateTime(2100),
                  ) : showCupertinoModalPopup(
                    context: context, 
                    builder: (_) => Container( // (_) => itu adalah cara menulis context tanpa harus menulis context, karena sudah bisa diakses langsung dari parameter showCupertinoModalPopup
                      height: 250,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (date) {
                          print(date);
                        },
                      ),
                    ),
                  );
                },
                child: Text("Date Picker"),
                );
  }