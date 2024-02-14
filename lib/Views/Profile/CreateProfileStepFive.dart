import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';

import '../../Presenter/PullUpLiveProvider.dart';
import '../../Utility/ColorTheme.dart';
import 'TsClip3.dart';

class CreateProfileStepFive extends StatefulWidget {
  CreateProfileStepFiveState createState() => CreateProfileStepFiveState();
}

class CreateProfileStepFiveState extends State<CreateProfileStepFive> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
      provider.getSubscriptionListApi(context);
    });
  }

  final PageController _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<PullUpLiveProvider>(context, listen: false);
    return Consumer<PullUpLiveProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Color(0xffF9FFFF),
        body: provider.isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: ColorTheme.themeCircularColor,
                  backgroundColor: ColorTheme.themeLightGrayColor,
                ))
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: <Widget>[
                        // The containers in the background
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // ClipPath(
                            //  clipper: TsClip3(),
                            //  child:
                            Container(
                              width: double.infinity,
                              height: 270,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff1F4FB2),
                                    Color(0xffFF4F00),
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 44.7,
                                    width: 155,
                                    margin: EdgeInsets.only(top: 55),
                                    child: Image.asset(
                                        "assets/images/splash/pull-logo.png"),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 26.63, bottom: 19),
                                      child: Text(
                                        "Create Profile",
                                        style: TextStyle(
                                          fontFamily: "Medium",
                                          fontSize: 19,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: 384,
                              decoration: BoxDecoration(
                                color: Color(0xffF9FFFF),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xff00000017),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                ],
                              ),
                            )
                          ],
                        ),
                        // The card widget with top padding,
                        // incase if you wanted bottom padding to work,
                        // set the `alignment` of container to Alignment.bottomCenter
                        Container(
                          height: 850,
                          width: 384,
                          margin: EdgeInsets.only(
                              left: 15, right: 15, bottom: 19, top: 160),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff00000017),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                      top: 26.63,
                                      bottom: 19,
                                    ),
                                    child: Text(
                                      "Step 5: Buy Subscription Plan",
                                      style: TextStyle(
                                        fontFamily: "Medium",
                                        fontSize: 19,
                                        color: Color(0xff0054FF),
                                      ),
                                    )),
                                Container(
                                  height: 700,
                                  width: 344,
                                  child: PageView.builder(
                                    physics: ScrollPhysics(),
                                    controller: _pageController,
                                    scrollDirection: Axis.horizontal,
                                    // shrinkWrap: true,
                                    itemCount: provider
                                        .objSubscriptionListResponse
                                        .data
                                        ?.length,
                                    itemBuilder: (context, mainindex) {
                                      var subsListItem = provider
                                          .objSubscriptionListResponse.data;
                                      var subMenuItems =
                                          subsListItem?[mainindex]
                                              .subscriptionDetails;
                                      return Column(
                                        children: [
                                          Container(
                                              height: 170,
                                              width: 344,
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                  top: 19, left: 20, right: 19),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: Color(0xffF3F3F3),
                                                  )),
                                              child: Center(
                                                child: Image.network(
                                                  subsListItem[mainindex]
                                                      .image
                                                      .toString(),
                                                  fit: BoxFit.fill,
                                                ),
                                                // child: Image.asset(
                                                //     "assets/images/profileImageFive.png"),
                                              )),
                                          Card(
                                            elevation: 1,
                                            margin: EdgeInsets.only(
                                                left: 20, right: 19, top: 57),
                                            child: Container(
                                              height: 400,
                                              width: 344,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffF8F8F8)),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        top: 73,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "${subsListItem[mainindex].name}",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "SemiBold",
                                                                color: Color(
                                                                    0xff545454),
                                                                fontSize: 28),
                                                          ),
                                                          Expanded(
                                                            child: ListView
                                                                .builder(
                                                                    physics:
                                                                        ScrollPhysics(),
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount:
                                                                        subMenuItems!
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            index) {
                                                                      return Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 70),
                                                                            height:
                                                                                6,
                                                                            width:
                                                                                6,
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff8B8B8B)),
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 8),
                                                                            child:
                                                                                Text(
                                                                              "${subMenuItems[index].name}",
                                                                              textAlign: TextAlign.justify,
                                                                              style: TextStyle(fontFamily: "Regular", color: Color(0xff545454), fontSize: 15),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      );
                                                                    }),
                                                          ),
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 24,
                                                                    bottom: 10),
                                                            height: 46,
                                                            width: 161,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          26.0),
                                                              gradient:
                                                                  const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  Color(
                                                                      0xff1F4FB2),
                                                                  Color(
                                                                      0xffFF4F00),
                                                                ],
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  shadowColor:
                                                                      Colors
                                                                          .transparent,
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pushNamed(
                                                                          '/createProfileStepFive2');
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'JOIN NOW',
                                                                  style: TextStyle(
                                                                      color: ColorTheme
                                                                          .themeWhiteColor,
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          "Regular"),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: -50,
                                                      child: Container(
                                                        width: 117,
                                                        height: 117,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(70),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0xff00000012),
                                                              offset:
                                                                  const Offset(
                                                                5.0,
                                                                5.0,
                                                              ),
                                                              blurRadius: 15.0,
                                                              spreadRadius: 2.0,
                                                            ), //BoxShadow
                                                            //BoxShadow
                                                          ],
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Text(
                                                              //  "12.99",
                                                              "\$${subsListItem[mainindex].price}",
                                                              style: TextStyle(
                                                                  fontSize: 23,
                                                                  fontFamily:
                                                                      "SemiBold",
                                                                  color: Color(
                                                                      0xff0054FF)),
                                                            ),
                                                            Text(
                                                              "monthly",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "SemiBold",
                                                                  color: Color(
                                                                      0xff0054FF)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    onPageChanged: (int index) {
                                      _currentPageNotifier.value = index;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    height: 30,
                                    alignment: Alignment.center,
                                    child: CirclePageIndicator(
                                      currentPageNotifier: _currentPageNotifier,
                                      itemCount: provider
                                          .objSubscriptionListResponse
                                          .data
                                          .length,
                                      size: 12,
                                      selectedSize: 12,
                                      borderColor: Color(0xFF707070),
                                      borderWidth: 1,
                                      dotColor: Colors.white,
                                      selectedDotColor: Color(0xff144FBB),
                                    )
                                    // ListView.builder(
                                    //     physics: ScrollPhysics(),
                                    //     scrollDirection: Axis.horizontal,
                                    //     shrinkWrap: true,
                                    //     itemCount: provider
                                    //         .objSubscriptionListResponse
                                    //         .data
                                    //         .length,
                                    //     itemBuilder: (context, index) {
                                    //       return Row(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.center,
                                    //         children: [
                                    //           Container(
                                    //             height: 12,
                                    //             width: 12,
                                    //             margin: EdgeInsets.only(right: 8),
                                    //             decoration: BoxDecoration(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(10),
                                    //               gradient: const LinearGradient(
                                    //                 begin: Alignment.topCenter,
                                    //                 end: Alignment.bottomCenter,
                                    //                 colors: [
                                    //                   Color(0xff1F4FB2),
                                    //                   Color(0xffFF4F00),
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           //     Container(
                                    //           //       height: 12,
                                    //           //       width: 12,
                                    //           //       decoration: BoxDecoration(
                                    //           //           borderRadius:
                                    //           //               BorderRadius.circular(10),
                                    //           //           border: Border.all(
                                    //           //               color: Color(0xFF707070),
                                    //           //               width: 1)),
                                    //           //     ),
                                    //         ],
                                    //       );
                                    //     }),
                                    ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //
                                //
                                //     SizedBox(
                                //       width: 8,
                                //     ),
                                //     Container(
                                //       height: 12,
                                //       width: 12,
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(10),
                                //           border: Border.all(
                                //               color: Color(0xFF707070),
                                //               width: 1)),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SKIP AND ACCESS FREE",
                                    style: TextStyle(
                                        fontFamily: "Regular",
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        color: Color(0xff727272)),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 29,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      );
    });
  }
}
