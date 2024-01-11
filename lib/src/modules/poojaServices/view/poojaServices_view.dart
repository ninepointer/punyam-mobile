import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:stoxhero/src/modules/modules.dart';

import '../../../core/core.dart';

class PoojaServicesView extends GetView<PoojaServicesController> {
  const PoojaServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pooja Services'),
          bottom: TabBar(
            indicatorColor: AppColors.lightGreen,
            tabs: [
              Tab(
                child: Text(
                  'Pooja at Home',
                  style: Theme.of(context).textTheme.tsRegular16,
                  textAlign: TextAlign.center,
                ),
              ),
              Tab(
                child: Text(
                  'Online Pooja',
                  style: Theme.of(context).textTheme.tsRegular16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        body: Visibility(
          visible: !controller.isLoadingStatus,
          replacement: CommonLoader(),
          child: TabBarView(
            children: [
              PoojaAtHomeView(),
              OnlinePoojaView(),
            ],
          ),
        ),
      ),
    );
  }
}
