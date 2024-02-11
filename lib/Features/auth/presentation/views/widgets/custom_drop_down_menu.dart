

// class CustomDropDownMenu extends StatelessWidget {
//   const CustomDropDownMenu({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu(
//       onSelected: (university) {
        
//       },
//       dropdownMenuEntries: const <DropdownMenuEntry>[
//         DropdownMenuEntry(
//           value: University.mti,
//           label: 'Modern University for technology and informations (MTI)',
//         ),
//         DropdownMenuEntry(
//             value: University.modernacademy,
//             label: 'Modern Academy for Engineering and Technology'),
//       ],
//       label: const Text('Select your university'),
//       menuStyle: MenuStyle(
//         shadowColor: MaterialStatePropertyAll<Color>(
//             Theme.of(context).colorScheme.surface),
//         padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
//             EdgeInsets.symmetric(vertical: 16)),
//         backgroundColor: MaterialStatePropertyAll<Color>(
//             Theme.of(context).colorScheme.primary),
//         shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(8),
//             ),
//           ),
//         ),
//       ),
//       width: SizeConfig.screenwidth! * 0.9,
//       inputDecorationTheme: InputDecorationTheme(
//           fillColor: Theme.of(context).colorScheme.surface,
//           filled: true,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
//     );
//   }
// }
