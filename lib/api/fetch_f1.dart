// // import 'dart:convert';
// import 'package:formula1/Data/constants.dart';
// import 'package:formula1/Models/constructor_model.dart';
// import 'package:formula1/Models/driver_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/dom.dart' as dom;
// // import 'package:formula1/Models/driver_model.dart';

// Future<void> getDrivers() async {
//   const String url =
//       'https://www.formula1.com/en/results.html/2024/drivers.html'; // Ensure the URL is correct and includes 'https://'
//   final response = await http.get(Uri.parse(url));
//   dom.Document html = dom.Document.html(response.body);
// //body > div.site-wrapper > main > article > div > div.ResultArchiveContainer > div.resultsarchive-wrapper > div.resultsarchive-content > div > table > tbody > tr:nth-child(1) > td:nth-child(3) > a
//   final driverName = html
//       .querySelectorAll(' a > span.hide-for-mobile')
//       .map((element) => element.innerHtml.trim())
//       .toList();
//   final constructor = html
//       .querySelectorAll('div > table > tbody > tr > td > a.grey')
//       .map((e) => e.innerHtml.trim())
//       .toList();
//   for (int i = 0; i < driverName.length; i++) {
//     driver.add(DriverData(
//         name: driverName[i], constructor: constructor[i], points: '0'));
//   }
// }

// Future getConstructor() async {
//   const String url = 'https://www.formula1.com/en/results.html/2024/team.html';
//   final response = await http.get(Uri.parse(url));
//   dom.Document html = dom.Document.html(response.body);

//   final constructorHtml = html
//       .querySelectorAll('div > table > tbody > tr > td >a')
//       .map((element) => element.innerHtml.trim())
//       .toList();

//   // final points = html.querySelectorAll('').map((element) => element.innerHtml.trim())
//   //     .toList();

//   for (int i = 0; i < constructorHtml.length; i++) {
//     constructor.add(ConstructorData(name: constructorHtml[i], points: '0'));
//   }
// }


// Get all rows from the table containing the driver standings
// const tableRows = document.querySelectorAll('.response tbody tr');

// // Initialize an array to store the driver names
// let driverNames = [];

// // Loop through each row, starting from the second row (index 1) to skip the header
// for (let i = 1; i < tableRows.length; i++) {
//   const cells = tableRows[i].getElementsByTagName('td');
//   if (cells.length > 1) {
//     // Get the driver name from the second column (index 1)
//     const driverName = cells[1].innerText;
//     driverNames.push(driverName);
//   }
// }

// // Output the array of driver names
// console.log(driverNames);
