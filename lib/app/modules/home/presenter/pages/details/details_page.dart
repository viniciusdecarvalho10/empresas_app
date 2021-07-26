import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../../shared/helpers/app_colors.dart';

import '../../../domain/entities/enterprises_entity.dart';
import '../../stores/home_store.dart';

class DetailsPage extends StatefulWidget {
  final List<EnterpriseEntity> enterprises;
  final int indexCurrentEnterprise;
  final HomeStore store;

  DetailsPage({required this.enterprises, required this.indexCurrentEnterprise, required this.store});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<EnterpriseEntity> get enterprises => widget.enterprises;
  int get indexCurrentEnterprise => widget.indexCurrentEnterprise;

  late Size size;

  final _pageviewController = PageController();

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _pageviewController.jumpToPage(indexCurrentEnterprise);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.store.enterpriseSelected.enterpriseName,
            style: AppTheme.defaultStyle.copyWith(color: AppTheme.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          textTheme: TextTheme(headline6: AppTheme.defaultStyle.copyWith(color: AppTheme.black, fontSize: 20)),
          iconTheme: IconThemeData(color: AppTheme.ruby),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: AppTheme.white),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * 0.25,
                  color: Colors.white,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    height: size.height * 0.7,
                    width: size.width,
                    child: Container(
                      padding: EdgeInsets.only(top: 50, bottom: 30, left: 15, right: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            Text(widget.store.enterpriseSelected.description,
                                style: AppTheme.defaultStyle.copyWith(
                                  color: AppTheme.black,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(child: _pageViewEnterprises()),
          ],
        ),
      );
    });
  }

  _pageViewEnterprises() {
    return PageView.builder(
      controller: _pageviewController,
      itemCount: widget.enterprises.length,
      onPageChanged: (int page) {
        widget.store.setEnterpriseSelected(enterprises[page]);
      },
      scrollBehavior: ScrollBehavior(),
      itemBuilder: (context, index) {
        return Hero(
          tag: widget.store.enterpriseSelected.urlImage,
          child: Container(
            alignment: Alignment.topCenter,
            child: Image.network(
              widget.store.enterpriseSelected.urlImage,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
