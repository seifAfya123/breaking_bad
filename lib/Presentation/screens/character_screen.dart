import 'package:break_and_bad_v1/Data/model/character_class.dart';
import 'package:break_and_bad_v1/Presentation/widgets/characteritem.dart';
import 'package:break_and_bad_v1/business%20logic/cubit/characters_cubit.dart';
import 'package:break_and_bad_v1/constants/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<CharacterClass> all_characters;
  late List<CharacterClass> Searched_Characters;
  bool _is_searching = false;
  final _search_controller = TextEditingController();
  Widget _build_search_feild() {
    return TextField(
      controller: _search_controller,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Find a character',
        hintStyle: TextStyle(
          color: my_colors.my_grey,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: my_colors.my_grey,
        fontSize: 18,
      ),
      onChanged: (Searched_Char) {
        add_searched_item_to_list(Searched_Char);
      },
    );
  }

  void add_searched_item_to_list(String Searched_Char) {
    setState(() {
      Searched_Characters = all_characters
          .where((element) =>
              element.name!.toLowerCase().startsWith(Searched_Char))
          .toList();
    });
  }

  List<Widget> _appBar_Actions() {
    if (_is_searching) {
      return [
        IconButton(
            onPressed: () {
              _clear_searching();
            },
            icon: const Icon(
              Icons.clear,
              color: my_colors.my_grey,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _start_search();
            },
            icon: const Icon(
              Icons.search,
              color: my_colors.my_grey,
            )),
      ];
    }
  }

  void _start_search() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopsearching));
    setState(() {
      _is_searching = true;
    });
  }

  void _stopsearching() {
    _clear_searching();
    setState(() {
      _is_searching = false;
    });
  }

  void _clear_searching() {
    setState(() {
      _search_controller.clear();
    });
  }

  Widget _build_appBar() {
    return const Text(
      "Characters",
      style: TextStyle(
        color: my_colors.my_grey,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).get_All_characters();
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is Charactersloaded) {
          all_characters = (state).Characters;
          return BuildLoadedListWidgets();
        } else {
          return ShowloadingIndecator();
        }
      },
    );
  }

  Widget ShowloadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget BuildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Expanded(
        child: Container(
          color: my_colors.my_grey,
          child: Column(
            children: [
              BuildCharactersList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _search_controller.text.isEmpty
          ? all_characters.length
          : Searched_Characters.length,
      itemBuilder: (ctx, index) {
        return Characteritem(
          character: _search_controller.text.isEmpty
              ? all_characters[index]
              : Searched_Characters[index],
        );
      },
    );
  }

  Widget no_internet_widget() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/notfound.png'),
          const SizedBox(
            height: 5,
          ),
          const Text("Cheak your internet!"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: my_colors.my_tellow,
        leading: _is_searching
            ? const BackButton(
                color: my_colors.my_grey,
              )
            : Container(),
// leading: _is_searching?
        title: _is_searching ? _build_search_feild() : _build_appBar(),
        actions: _appBar_Actions(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BuildBlocWidget();
          } else {
            return no_internet_widget();
          }
        },
        child: ShowloadingIndecator(),
      ),

      // BuildBlocWidget(),
    );
  }
}
