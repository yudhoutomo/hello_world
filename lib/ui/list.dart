import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:grouped_list/sliver_grouped_list.dart';
import 'package:hello_world/core/data/model/flight/flight.dart';
import 'package:hello_world/core/utils/status.dart';
import 'package:hello_world/core/widgets/app_button.dart';
import 'package:hello_world/core/widgets/app_colors.dart';
import 'package:hello_world/di/injection.dart';
import 'package:hello_world/ui/cubit/cubit/flight_cubit.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  //final Profile data;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(backgroundColor: Colors.blue, title: Text(data.name)),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () => Navigator.of(context).pop(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // List<Element> _elements = <Element>[
    //   Element('TAKENGON REMBELE', '23066614', 'TXE', '1935745', 'Aceh', 'id',
    //       'Indonesia', 'Aceh (TXE), Takengon Rembele'),
    //   Element('TAKENGON REMBELE', '23066614', 'TXE', '1935745', 'Aceh', 'id',
    //       'Indonesia', 'Aceh (TXE), Takengon Rembele'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Indonesia', 'Alor Island (ARD), Mali'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Indonesia', 'Alor Island (ARD), Mali'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Japan', 'Alor Island (ARD), Mali'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Japan', 'Alor Island (ARD), Mali'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Columbia', 'Alor Island (ARD), Mali'),
    //   Element('MALI', '23066614', 'TXE', '1935745', 'Alor Island', 'id',
    //       'Columbia', 'Alor Island (ARD), Mali'),
    // ];
    // final List _elements = [
    //   {'name': 'John', 'group': 'Team A'},
    //   {'name': 'Will', 'group': 'Team B'},
    //   {'name': 'Beth', 'group': 'Team A'},
    //   {'name': 'Miranda', 'group': 'Team B'},
    //   {'name': 'Mike', 'group': 'Team C'},
    //   {'name': 'Danny', 'group': 'Team C'},
    // ];
    // return Container(
    //   child: SafeArea(
    //       child: CustomScrollView(
    //     slivers: [
    //       StickyGroupedListView<Element, DateTime>(
    //         elements: _elements,
    //         order: StickyGroupedListOrder.ASC,
    //         groupBy: (Element element) => DateTime(
    //           element.date.year,
    //           element.date.month,
    //           element.date.day,
    //         ),
    //         groupComparator: (DateTime value1, DateTime value2) =>
    //             value2.compareTo(value1),
    //         itemComparator: (Element element1, Element element2) =>
    //             element1.date.compareTo(element2.date),
    //         floatingHeader: false,
    //         groupSeparatorBuilder: _getGroupSeparator,
    //         itemBuilder: _getItem,
    //       ),
    //     ],
    //     // StickyGroupedListView<Element, DateTime>(
    //     //   elements: _elements,
    //     //   order: StickyGroupedListOrder.ASC,
    //     //   groupBy: (Element element) => DateTime(
    //     //     element.date.year,
    //     //     element.date.month,
    //     //     element.date.day,
    //     //   ),
    //     //   groupComparator: (DateTime value1, DateTime value2) =>
    //     //       value2.compareTo(value1),
    //     //   itemComparator: (Element element1, Element element2) =>
    //     //       element1.date.compareTo(element2.date),
    //     //   floatingHeader: false,
    //     //   groupSeparatorBuilder: _getGroupSeparator,
    //     //   itemBuilder: _getItem,
    //     // ),
    //   )
    //       //_header(),

    //       ),
    // );
    return BlocProvider(
      create: (context) => getIt<FlightCubit>()..getFlight(),
      child: SafeArea(
        // debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        child: Scaffold(
          appBar: const MyCustomAppBar(height: 120),
          body: BlocBuilder<FlightCubit, FlightState>(
            builder: (context, state) {
              if (state is FlightInitialState &&
                  state.status == Status.success) {
                final datas = state.data!;
                return StickyGroupedListView<Flight, String>(
                  elements: datas,
                  order: StickyGroupedListOrder.ASC,
                  groupBy: (element) => element.countryName,
                  //groupSeparatorBuilder: (dynamic element) => Text(element['group']),
                  itemComparator: (Flight element1, Flight element2) =>
                      element1.airportName.compareTo(element2.airportName),
                  floatingHeader: false,
                  groupSeparatorBuilder: _getGroupSeparator,
                  itemBuilder: _getItem,
                );
              } else {
                return Text("Loading..");
              }
            },
          ),
        ),
      ),
    );

    // return Scaffold(
    //     // appBar: AppBar(backgroundColor: Colors.blue, title: Text(data.name)),
    //     body: SafeArea(
    //   child: CustomScrollView(
    //     slivers: [
    //       _header(),
    //       // SliverToBoxAdapter(
    //       //   child: Container(
    //       //       padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
    //       //       child: const Text(
    //       //         "Search airports or city name",
    //       //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    //       //       )),
    //       // ),
    //       // SliverToBoxAdapter(
    //       //   child: Container(
    //       //       padding: const EdgeInsets.all(12),
    //       //       child: const Text(
    //       //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam \n"
    //       //         "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error, harum nesciunt ipsum debitis quas aliquid. Reprehenderit, quia. Quo neque error repudiandae fuga? Ipsa laudantium molestias eos sapiente officiis modi at sunt excepturi expedita sint? Sed quibusdam",
    //       //         style: TextStyle(fontSize: 15),
    //       //       )),
    //       // ),
    //       // SliverToBoxAdapter(
    //       //   child: Container(
    //       //     padding: const EdgeInsets.all(12),
    //       //     child: ElevatedButton(
    //       //         onPressed: () => {}, child: Text("Add to Favorite")),
    //       //   ),
    //       // )
    //     ],
    //   ),
    // ));
  }

  Widget _header() {
    // final List _elements = [
    //   {'name': 'John', 'group': 'Team A'},
    //   {'name': 'Will', 'group': 'Team B'},
    //   {'name': 'Beth', 'group': 'Team A'},
    //   {'name': 'Miranda', 'group': 'Team B'},
    //   {'name': 'Mike', 'group': 'Team C'},
    //   {'name': 'Danny', 'group': 'Team C'},
    // ];

    return SliverToBoxAdapter(
        child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          children: [
            Container(
              color: Colors.blue,
              alignment: Alignment.bottomCenter,
              height: 80,
              width: double.infinity,
              // margin: const EdgeInsets.symmetric(
              //   horizontal: 12,
              //   vertical: 12,
              // ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Search airports or city name'),
                          cursorColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: Text('Close'))
                  // Expanded(
                  //   flex: 3,
                  //   child: Container(
                  //     child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [

                  //         ]),
                  //   ),
                  // ),
                ],
              ),
            ),
            // // Container(
            // //   child: StickyGroupedListView<Element, DateTime>(
            // //     elements: _elements,
            // //     order: StickyGroupedListOrder.ASC,
            // //     groupBy: (Element element) => DateTime(
            // //       element.date.year,
            // //       element.date.month,
            // //       element.date.day,
            // //     ),
            // //     groupComparator: (DateTime value1, DateTime value2) =>
            // //         value2.compareTo(value1),
            // //     itemComparator: (Element element1, Element element2) =>
            // //         element1.date.compareTo(element2.date),
            // //     floatingHeader: false,
            // //     groupSeparatorBuilder: _getGroupSeparator,
            // //     itemBuilder: _getItem,
            // //   ),
            // )

            // TextField(
            //   decoration: InputDecoration(
            //       border: OutlineInputBorder(), hintText: 'test'),
            //   cursorColor: Colors.white,
            // ),
          ],
        )
        // Container(
        //   width: double.infinity,
        //   margin: const EdgeInsets.symmetric(
        //     horizontal: 12,
        //     vertical: 12,
        //   ),
        //   child: const Text("Search airports or city name",
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        // ),
        // Container(
        //     color: Colors.blue,
        //     margin: EdgeInsets.all(12),
        //     child: Container(
        //       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             TextField(
        //               decoration: InputDecoration(
        //                   border: OutlineInputBorder(),
        //                   hintText: 'Search airports or city name'),
        //             ),
        //             Text(
        //               "data.name",
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 18,
        //                   color: Colors.black),
        //             ),
        //             const SizedBox(
        //               height: 3,
        //             ),
        //             Text(
        //               "data.description",
        //               style: TextStyle(color: Colors.grey),
        //             )
        //           ]),
        //     )),
      ],
    ));
  }

  Widget _getGroupSeparator(Flight element) {
    return Container(
        height: 45,
        color: Color.fromARGB(255, 243, 240, 240),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              //apply margin and padding using Container Widget.
              padding: EdgeInsets.only(
                  left: 10, right: 20), //You can use EdgeInsets like above
              margin: EdgeInsets.all(5),
              child: Text('${element.countryName}',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey)),
            ))
        // Container(
        //   width: 120,
        //   decoration: BoxDecoration(
        //       // color: Colors.grey[300],
        //       // border: Border.all(
        //       //   color: Colors.blue[300]!,
        //       // ),
        //       //borderRadius: const BorderRadius.all(Radius.circular(20.0))
        //       ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       '${element.date.day}. ${element.date.month}, ${element.date.year}',
        //       textAlign: TextAlign.center,
        //     ),
        //   ),
        // ),

        );
  }

  Widget _getItem(BuildContext ctx, Flight element) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                //apply margin and padding using Container Widget.
                padding: EdgeInsets.only(
                    left: 10,
                    right: 20,
                    top: 5), //You can use EdgeInsets like above
                margin: EdgeInsets.all(5),
                child: Text('${element.airportName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.black)),
              ),
              Container(
                alignment: Alignment.topLeft,
                //apply margin and padding using Container Widget.
                padding: EdgeInsets.only(
                    left: 10, right: 20), //You can use EdgeInsets like above
                margin: EdgeInsets.all(5),
                child: Text('${element.locationName}',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.grey)),
              ),
              new Divider(
                height: 15.0,
                color: Colors.grey,
              )
            ]))

        // // Container(
        // //   child: StickyGroupedListView<Element, DateTime>(
        // //     elements: _elements,
        // //     order: StickyGroupedListOrder.ASC,
        // //     groupBy: (Element element) => DateTime(
        // //       element.date.year,
        // //       element.date.month,
        // //       element.date.day,
        // //     ),
        // //     groupComparator: (DateTime value1, DateTime value2) =>
        // //         value2.compareTo(value1),
        // //     itemComparator: (Element element1, Element element2) =>
        // //         element1.date.compareTo(element2.date),
        // //     floatingHeader: false,
        // //     groupSeparatorBuilder: _getGroupSeparator,
        // //     itemBuilder: _getItem,
        // //   ),
        // )

        // TextField(
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(), hintText: 'test'),
        //   cursorColor: Colors.white,
        // ),
      ],
    );
    // return Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(6.0),
    //   ),
    //   elevation: 8.0,
    //   margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    //   child: SizedBox(
    //     child: ListTile(
    //       contentPadding:
    //           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    //       leading: Icon(element.icon),
    //       title: Text(element.name),
    //       trailing: Text('${element.date.hour}:00'),
    //     ),
    //   ),
    // );
  }
}

class Element {
  String airport_name;
  String business_id;
  String airport_code;
  String business_name_trans_id;
  String location_name;
  String country_id;
  String country_name;
  String label;

  Element(
      this.airport_name,
      this.business_id,
      this.airport_code,
      this.business_name_trans_id,
      this.location_name,
      this.country_id,
      this.country_name,
      this.label);
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromARGB(255, 89, 174, 244),
          alignment: Alignment.centerLeft,
          height: height,
          width: double.infinity,
          // margin: const EdgeInsets.symmetric(
          //   horizontal: 12,
          //   vertical: 12,
          // ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Container(
                    child: TextField(
                      onChanged: (value) =>
                          context.read<FlightCubit>().filter(value),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Search airports or city name'),
                      cursorColor: Colors.black,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  //apply margin and padding using Container Widget.
                  margin: EdgeInsets.only(left: 10, right: 15),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      //primary: Colors.blue,
                      // textStyle: TextStyle(
                      //     fontSize: 30, fontWeight: FontWeight.bold)),

                      // style: ButtonStyle(
                      //   foregroundColor:

                      //       MaterialStateProperty.all<Color>(Colors.white),
                      //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      //     (Set<MaterialState> states) {
                      //       if (states.contains(MaterialState.hovered))
                      //         return Colors.blue;
                      //       if (states.contains(MaterialState.focused) ||
                      //           states.contains(MaterialState.pressed))
                      //         return Colors.blue;
                      //       return null; // Defer to the widget's default.
                      //     },
                      //   ),
                      // ),
                      onPressed: () {},
                      child: Text('Close')))
              // Expanded(
              //   flex: 3,
              //   child: Container(
              //     child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [

              //         ]),
              //   ),
              // ),
            ],
          ),
        ),
        // // Container(
        // //   child: StickyGroupedListView<Element, DateTime>(
        // //     elements: _elements,
        // //     order: StickyGroupedListOrder.ASC,
        // //     groupBy: (Element element) => DateTime(
        // //       element.date.year,
        // //       element.date.month,
        // //       element.date.day,
        // //     ),
        // //     groupComparator: (DateTime value1, DateTime value2) =>
        // //         value2.compareTo(value1),
        // //     itemComparator: (Element element1, Element element2) =>
        // //         element1.date.compareTo(element2.date),
        // //     floatingHeader: false,
        // //     groupSeparatorBuilder: _getGroupSeparator,
        // //     itemBuilder: _getItem,
        // //   ),
        // )

        // TextField(
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(), hintText: 'test'),
        //   cursorColor: Colors.white,
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
