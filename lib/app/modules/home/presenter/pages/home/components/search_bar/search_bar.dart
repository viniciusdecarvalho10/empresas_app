import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../../shared/components/text_field_rounded_widget.dart';
import '../../../../../../../shared/helpers/app_colors.dart';
import '../../../../../../../shared/helpers/constants.dart';

class SearchBar extends StatefulWidget {
  final String? title;
  final Function(String?)? onChanged;
  final String name;

  const SearchBar({this.title, required this.onChanged, required this.name});

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<SearchBar> {
  late Size size;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
            height: size.height * 0.25,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                    height: size.height * 0.25,
                    padding: EdgeInsets.only(top: (size.height * 0.048)),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/header_background.png",
                          ),
                          fit: BoxFit.fitWidth,
                          repeat: ImageRepeat.repeat),
                    )),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.purple,
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppTheme.white),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: const Icon(Icons.logout),
                          color: Colors.white,
                          onPressed: () async {
                            logoutPressed();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                    child: Transform.translate(
                  offset: Offset(0.0, size.height * 0.120),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Material(
                          color: AppTheme.white40,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  width: size.height * 0.20,
                                  child: TextFieldRoundedWidget(
                                    prefixIcon: Container(padding: EdgeInsets.fromLTRB(0, 15, 15, 15), child: Image.asset("assets/images/search_icon.png", width: 20, height: 20)),
                                    showBorder: false,
                                    hintText: widget.title ?? 'Pesquise por empresa',
                                    onChanged: widget.onChanged,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                )),
              ],
            )));
  }

  Future<void> logoutPressed() async {
    Modular.to.navigate(Constants.SIGNIN_ROUTE);
  }
}
