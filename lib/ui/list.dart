import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FlightCubit>()..getFlight(),
      child: SafeArea(
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
  }

  Widget _getGroupSeparator(Flight element) {
    return Container(
        height: 45,
        color: AppColors.grey,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10, right: 20),
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Text('${element.countryName}',
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.grey)),
            )));
  }

  Widget _getItem(BuildContext ctx, Flight element) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: Column(children: [
              SizedBox(height: 3),
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
              SizedBox(height: 13),
              new Divider(
                height: 1.0,
                color: Colors.grey,
              )
            ]))
      ],
    );
  }
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
          //color: Color.fromARGB(255, 89, 174, 244),
          color: AppColors.blue,
          alignment: Alignment.centerLeft,
          height: height,
          width: double.infinity,
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
                  height: 47,
                  width: 80,
                  //alignment: Alignment.center,
                  //apply margin and padding using Container Widget.
                  margin: EdgeInsets.only(left: 5, right: 15),
                  child: ElevatedButton(
                      child: Text("Close",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.white)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(AppColors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side:
                                          BorderSide(color: AppColors.blue)))),
                      onPressed: () => {
                            if (Navigator.canPop(context))
                              {Navigator.pop(context)}
                            else
                              {SystemNavigator.pop()}
                          }))
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
