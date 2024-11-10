import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:hackathon_app/featurues/preferances/allergies/bloc/allergies_bloc.dart';
import 'package:hackathon_app/featurues/preferances/favourites/ui/favourites.dart';

class AllergySelectPage extends StatefulWidget {
  const AllergySelectPage({super.key});

  @override
  State<AllergySelectPage> createState() => _AllergySelectPageState();
}

class _AllergySelectPageState extends State<AllergySelectPage> {
  final AllergiesBloc allergyBloc = AllergiesBloc();
  final List<String> preferences = ["Milk", "Tomato", "Egg", "Nuts"];

  @override
  void initState() {
    super.initState();
    allergyBloc.add(GetAllergiesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 124, 181, 106),
        title: const Text(
          'Select Allergies',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 7,
        shadowColor: Theme.of(context).shadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/allergy_select.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          // Keeps the content within the screen boundaries
          child: BlocConsumer<AllergiesBloc, AllergiesState>(
            bloc: allergyBloc,
            listenWhen: (previous, current) => current is AllergiesActionState,
            buildWhen: (previous, current) => current is! AllergiesActionState,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is AllergiesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is AllergiesFetchingErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              }
              if (state is AllergiesFetchedState) {
                final preferences = state.ingredients;
                final selectedPreferences = state.selectedPreferences;
                return Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children: preferences.map((preference) {
                      final isSelected =
                          selectedPreferences[preference["name"].toString()] ?? false;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? const Color.fromARGB(255, 108, 198, 150)
                                    .withOpacity(0.5)
                                : const Color.fromARGB(255, 229, 229, 229),
                          ),
                          child: GlassContainer(
                            blur: 1,
                            borderRadius: BorderRadius.circular(10),
                            child: CheckboxListTile(
                              activeColor: Colors.green[500],
                              title: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  preference["name"],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              value: isSelected,
                              onChanged: (bool? value) {
                                print('vaaaa');
                                setState(() {
                                  selectedPreferences[preference["name"]
                                      .toString()] = value ?? false;
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 151, 192, 137),
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.red[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back),
                    SizedBox(width: 5),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Next functionality
                  // You can replace this with navigation to the next page or logic
                  Get.to(() => const FavouritesSelectionPage());
                },
                style: ElevatedButton.styleFrom(
                  // primary: Colors.green[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_rounded)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
