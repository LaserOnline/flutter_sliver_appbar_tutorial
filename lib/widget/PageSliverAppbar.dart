import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './PageMenu.dart';

class PageSliverAppbar extends StatefulWidget {
  const PageSliverAppbar({Key? key}) : super(key: key);

  @override
  State<PageSliverAppbar> createState() => _PageSliverAppbar();
}

class _PageSliverAppbar extends State<PageSliverAppbar> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // กำหนด controller ให้กับ ListView
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const Icon(
                Icons.android_outlined,
                color: Colors.white,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.apple_sharp),
                  onPressed: () {
                    // กำหนด behavior ที่ต้องการเมื่อกดปุ่มด้านขวา
                  },
                ),
              ],
              centerTitle: true,
              // title: const Text("S L I V E R A P P B A R"),
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: const Icon(Icons.brightness_1_rounded),
              ),
              expandedHeight: 300,
              floating: false,
              pinned: false,
              primary: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.pink,
                  child: const SafeArea(
                      child: Center(
                    child: Text(
                      "S L I V E R A P P B A R",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Icon(Icons.chevron_left),
                      onTap: () {
                        _scrollController.animateTo(
                          _scrollController.offset -
                              50, // ระยะที่จะเลื่อนไปทางซ้าย
                          curve: Curves.linear,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: 10,
                          controller:
                              _scrollController, // เชื่อมต่อ ScrollController
                          itemBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 80,
                              child: PageMenu(),
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          itemExtent: 50,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Icon(Icons.chevron_right),
                      onTap: () {
                        _scrollController.animateTo(
                          _scrollController.offset +
                              50, // ระยะที่จะเลื่อนไปทางขวา
                          curve: Curves.linear,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                    ),
                  ],
                ),
                centerTitle: true,
              ),

              backgroundColor: Colors.black,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  shrinkWrap: true,
                  physics:
                      ScrollPhysics(), // เพิ่ม physics เป็น ScrollPhysics()
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.deepPurple,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
