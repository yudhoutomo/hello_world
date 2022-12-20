import 'package:flutter/material.dart';

class ImFlutter extends StatelessWidget {
  const ImFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: FlutterLogo(
      size: 200,
    ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(backgroundColor: Colors.blue, title: Text(data.name)),
//         body: CustomScrollView(
//       slivers: [
//         _header(),
//         // SliverToBoxAdapter(
//         //   child: Container(
//         //       padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
//         //       child: const Text(
//         //         "Search airports or city name",
//         //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//         //       )),
//         // ),
//         // SliverToBoxAdapter(
//         //   child: Container(
//         //       padding: const EdgeInsets.all(12),
//         //       child: const Text(
//         //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam \n"
//         //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam",
//         //         style: TextStyle(fontSize: 15),
//         //       )),
//         // ),
//         // SliverToBoxAdapter(
//         //   child: Container(
//         //     padding: const EdgeInsets.all(12),
//         //     child: ElevatedButton(
//         //         onPressed: () => {}, child: Text("Add to Favorite")),
//         //   ),
//         // )
//       ],
//     ));
//   }

//   Widget _header() {
//     return SliverToBoxAdapter(
//         child: Stack(
//       alignment: Alignment.bottomLeft,
//       children: [
//         Container(
//           width: double.infinity,
//           child: const Text("",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//         ),
//         Container(
//           alignment: Alignment.bottomCenter,
//           height: 100,
//           width: double.infinity,
//           margin: const EdgeInsets.symmetric(
//             horizontal: 12,
//             vertical: 12,
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   padding: EdgeInsets.all(12),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Search airports or city name",
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                               color: Colors.black),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         // Text(
//                         //   "data.description",
//                         //   style: TextStyle(color: Colors.grey),
//                         // )
//                       ]),
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     ));
//   }

//   Widget _textField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               hintText: 'Enter a search term',
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
//           child: TextFormField(
//             decoration: const InputDecoration(
//               border: UnderlineInputBorder(),
//               labelText: 'Enter your username',
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
