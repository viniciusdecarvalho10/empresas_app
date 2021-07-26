import 'package:flutter/material.dart';

import '../../../../../../../shared/helpers/app_colors.dart';
import '../../../../../domain/entities/enterprises_entity.dart';
import '../../../details/details_page.dart';
import '../../home_controller.dart';

class EnterpriseList extends StatelessWidget {
  final EnterpriseEntity enterprise;
  final int number;
  final int index;
  final HomeController controller;
  EnterpriseList({
    Key? key,
    required this.controller,
    required this.index,
    required this.enterprise,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          controller.store.setEnterpriseSelected(enterprise);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                enterprises: controller.store.enterprisesFiltered,
                indexCurrentEnterprise: index,
                store: controller.store,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            children: [
              Expanded(
                child: Hero(
                  tag: 'enterprise$number',
                  child: Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.network(
                                  enterprise.urlImage,
                                  fit: BoxFit.fitWidth,
                                ))),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: AppTheme.black.withOpacity(0.5)),
                        ),
                        Center(
                            child: Text(
                          enterprise.enterpriseName.toUpperCase(),
                          style: TextStyle(color: AppTheme.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
