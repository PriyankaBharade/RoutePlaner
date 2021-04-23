// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class countrylistwidget extends StatefulWidget {
  
//    @override
//   _countrylistwidget createState() => _countrylistwidget();


// }

// class _countrylistwidget extends  State<countrylistwidget>{
//   int selectedValue = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cupertino picker demo"),
//       ),
//       body: Column(
//         //showPicker();
//       ),
//     );
//   }


// // Future<T?> showModalActionSheet<T>({
// //   required BuildContext context,
// //   String? title,
// //   String? message,
// //   List<SheetAction<T>> actions = const [],
// //   String? cancelLabel,
// //   AdaptiveStyle style = AdaptiveStyle.adaptive,
// //   bool isDismissible = true,
// //   bool useRootNavigator = true,
// //   MaterialModalActionSheetConfiguration? materialConfiguration,
// // }) 


// // {
// //   void pop(T? key) => Navigator.of(
// //         context,
// //         rootNavigator: useRootNavigator,
// //       ).pop(key);
// //   final theme = Theme.of(context);
// //   return style.isCupertinoStyle(theme)
// //       ? showCupertinoModalPopup(
// //           context: context,
// //           useRootNavigator: useRootNavigator,
// //           builder: (context) => 
// //           CupertinoModalActionSheet(
// //             onPressed: pop,
// //             title: title,
// //             message: message,
// //             actions: actions,
// //             cancelLabel: cancelLabel,
// //           ),
// //         )
// //       : showModalBottomSheet(
// //           context: context,
// //           isScrollControlled: materialConfiguration != null,
// //           isDismissible: isDismissible,
// //           useRootNavigator: useRootNavigator,
// //           builder: (context) => MaterialModalActionSheet(
// //             onPressed: pop,
// //             title: title,
// //             message: message,
// //             actions: actions,
// //             cancelLabel: cancelLabel,
// //             materialConfiguration: materialConfiguration,
// //           ),
// //         );
        
// // }
// // }
// 
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// Widget ShowDialog(BuildContext context){
//   return Scaffold(
//     body:Column(
//       showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return CupertinoPicker(
//             backgroundColor: Colors.white,
//             onSelectedItemChanged: (value) {
//               // setState(() {
//               //   selectedValue = value;
//               // });
//             },
//             itemExtent: 32.0,
//             children: const [
//               Text('Item01'),
//               Text('Item02'),
//               Text('Item03'),
//             ],
//           );
//         })
//     )
//   );
// }

