// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  HomeController controller;
  HeaderProjectsMenu({
    required this.controller,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Container(
        height: constraints.maxHeight,
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * .5,
              child: DropdownButtonFormField<ProjectStatus>(
                value: ProjectStatus.emAndamento,
                items: ProjectStatus.values
                    .map((e) => DropdownMenuItem<ProjectStatus>(
                          value: e,
                          child: Text(e.label),
                        ))
                    .toList(),
                onChanged: (status) {
                  if (status != null) {
                    controller.filter(status);
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  isCollapsed: true,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await Modular.to.pushNamed('/project/register');
                controller.loadProject();
              },
              label: const Text('Novo projeto'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      );
    }));
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
