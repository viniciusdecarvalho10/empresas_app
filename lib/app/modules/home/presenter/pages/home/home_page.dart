import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../shared/components/text_result_count_widget.dart';
import '../../../../../shared/extensions/name_string.dart';
import '../../../../../shared/helpers/app_colors.dart';
import 'components/enterprises_list/enterprises_list_widget.dart';
import 'components/search_bar/search_bar.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SearchBar(
              name: controller.authStore.state.name.getNameInitials(),
              onChanged: (value) {
                controller.getEnterprisesFiltered(value!);
              }),
          Observer(builder: (_) {
            return Container(
              margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
              alignment: Alignment.centerLeft,
              child: ResultCountList(
                count: controller.store.enterprisesFiltered.length,
              ),
            );
          }),
          Expanded(child: Observer(
            builder: (_) {
              if (controller.store.enterprises.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              return controller.store.enterprisesFiltered.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.store.enterprisesFiltered.length,
                      itemBuilder: (_, index) {
                        var enterprise = controller.store.enterprisesFiltered[index];
                        var number = enterprise.id;

                        return Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: EnterpriseList(
                            enterprise: enterprise,
                            number: number,
                            controller: controller,
                            index: index,
                          ),
                        );
                      },
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Empresas não encontradas",
                        style: AppTheme.defaultStyle.copyWith(fontWeight: FontWeight.normal, fontSize: 18, color: AppTheme.grey40),
                      ),
                    );
            },
          )),
        ],
      ),
    );
  }
}
