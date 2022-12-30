import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juniorproj/layout/cubit/cubit.dart';
import 'package:juniorproj/layout/cubit/states.dart';
import 'package:juniorproj/modules/Units/units.dart';
import 'package:juniorproj/shared/components/components.dart';
import 'package:juniorproj/shared/network/local/cache_helper.dart';
import 'package:juniorproj/shared/styles/colors.dart';
import 'package:juniorproj/shared/styles/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:string_extensions/string_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          var model=AppCubit.userModel;
          var cubit= AppCubit.get(context);
          return ConditionalBuilder(
            condition: model !=null, //was AppCubit.userModel != null
            fallback: (context)=>const Center(child: CircularProgressIndicator(),),
            builder: (context)=>SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                               GestureDetector(
                                 child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                      'assets/images/${model!.user!.userPhoto}'), //assets/images/profile.jpg
                              ),
                                 onTap: ()
                                 {
                                   cubit.changeBottom(3);
                                 },
                               ),

                              const SizedBox(
                                width: 50,
                              ),

                              Expanded(
                                child: Text(
                                  'Welcome Back, ${model.user!.firstName}!',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: defaultHeadlineTextStyle,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          Padding(
                            padding: const EdgeInsetsDirectional.only(start:5 ),
                            child: Text(
                              'Continue Where You Left Off?',
                              style: ordinaryTextStyle,
                            ),
                          ),

                          const SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: [
                                const Spacer(),
                                Expanded(
                                    child: defaultButton(
                                        function: ()
                                        {
                                          List<String>? i;
                                          try
                                          {
                                            i=CacheHelper.getData(key: 'lastAccessedUnit'); //Get Cached Data
                                            if(i !=null) //If units has been accessed before
                                                {
                                              cubit.getAllUnits(i[0].toInt()!);  // i[0] contains the language Id, i[1] contains the name of the language
                                              navigateTo(context, Units(i[1]));
                                            }
                                            else //No Cached Data, will move user to Languages Page.
                                                {
                                              cubit.changeBottom(1);
                                            }
                                          }
                                          catch(error)
                                          {
                                            print('Error, ${error.toString()}');
                                            defaultToast(msg: 'You Haven\'t opened a unit yet.');
                                          }

                                        },
                                        text: "Let's Go",
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    myDivider(c: goldenColor),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Daily Challenge:',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: defaultHeadlineTextStyle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5),
                            child: Text(
                              'Learn Five New Words',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ordinaryTextStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                  child: defaultButton(
                                      function: () {}, text: 'Go Now !')),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    myDivider(c: goldenColor),

                    SizedBox(
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.black),
                      //   borderRadius: BorderRadius.circular(5),
                      // ),
                      height: 125,

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your Progress',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: defaultHeadlineTextStyle,
                            ),
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsetsDirectional.only(start: 10, top: 5),
                                child: CircularPercentIndicator(
                                  radius: 45.0,
                                  lineWidth: 8.0,
                                  animation: true,
                                  percent: getCurrentProgress('double'),
                                  animationDuration: 800,
                                  progressColor: Colors.redAccent,
                                  backgroundColor: Colors.grey,
                                  center: Text(
                                    getCurrentProgress('string'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                )
                              // Container(
                              //   height: 80,
                              //   width: 80,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //         color: Colors.grey,
                              //       ),
                              //       borderRadius:
                              //           const BorderRadius.all(Radius.circular(40))),
                              //   child: Center(
                              //       child: Text(
                              //     '75%',
                              //     style: TextStyle(
                              //       fontSize: 20,
                              //       color: defaultFontColor,
                              //     ),
                              //   )),
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    //
                    // Container(
                    //   height: 160,
                    //   width: 500,
                    //   color: Colors.blue,
                    //
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children:
                    //     [
                    //       Stack(
                    //
                    //         children:
                    //         [
                    //           const Image(image: AssetImage('assets/images/fire-ring.gif')),
                    //
                    //            Container(
                    //              width:250,
                    //              child: const Image(
                    //                image: AssetImage('assets/images/fire.gif'),
                    //                height: 50,
                    //                width: 50,
                    //                alignment: Alignment.center,
                    //              ),
                    //            ),
                    //
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  dynamic getCurrentProgress(String type)
  {
    if(type == 'string')
      {
        List<String>? i;
        String myLangProgress='0.0';
        int langId;

        try
        {
          print('for Test, ${CacheHelper.getData(key: 'lastAccessedUnits')}');
          i=CacheHelper.getData(key: 'lastAccessedUnit');

          if(i !=null)
          {
            print('Got Cached Unit');
            print('USER PROGRESS LIST IS: ${AppCubit.userModel!.user!.userProgress}');
            print('CACHED ITEM IS: ${i[0]}');

            AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
            {
              if(element.languageId == i![0].toInt())
              {
                print('Progress is: ${element.progress!}');
                myLangProgress = element.progress!;
              }
            });
            print('Current Language Progress is : $myLangProgress');

          }

          else
          {
            if(AppCubit.userModel!.user!.userLanguages.isNotEmpty) //There are languages in his list
                {
              langId= AppCubit.userModel!.user!.userLanguages[0]; //Take the first one

              AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
              {
                if(element.languageId == langId)
                {
                  myLangProgress = element.progress!;
                }
              });
            }

            print('Current Language Progress is : $myLangProgress');
            return myLangProgress;
          }

        }


        catch (error)
        {
          print('Error While Getting Cache, ${error.toString()}');

          if(AppCubit.userModel!.user!.userLanguages.isNotEmpty) //There are languages in his list
              {
            langId= AppCubit.userModel!.user!.userLanguages[0]; //Take the first one

            AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
            {
              if(element.languageId == langId)
              {
                myLangProgress = element.progress!;
              }
            });
          }
        }

        print('Current Language Progress is : $myLangProgress');
        return myLangProgress;
      }

    else if (type =='double')
      {
        List<String>? i;
        String myLangProgress='0.0';
        int langId;
        double finalValue=0.0;
        try
        {
          print('for Test, ${CacheHelper.getData(key: 'lastAccessedUnits')}');
          i=CacheHelper.getData(key: 'lastAccessedUnit');

          if(i !=null)
          {
            print('Got Cached Unit');
            print('USER PROGRESS LIST IS: ${AppCubit.userModel!.user!.userProgress}');
            print('CACHED ITEM IS: ${i[0]}');

            AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
            {
              if(element.languageId == i![0].toInt())
              {
                print('Progress is: ${element.progress!}');
                myLangProgress = element.progress!;
              }
            });
            print('Current Language Progress is : $myLangProgress');

          }

          else
          {
            if(AppCubit.userModel!.user!.userLanguages.isNotEmpty) //There are languages in his list
                {
              langId= AppCubit.userModel!.user!.userLanguages[0]; //Take the first one

              AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
              {
                if(element.languageId == langId)
                {
                  myLangProgress = element.progress!;
                }
              });
            }

            print('Current Language Progress is : $myLangProgress');
            return myLangProgress;
          }

        }


        catch (error)
        {
          print('Error While Getting Cache, ${error.toString()}');

          if(AppCubit.userModel!.user!.userLanguages.isNotEmpty) //There are languages in his list
              {
            langId= AppCubit.userModel!.user!.userLanguages[0]; //Take the first one

            AppCubit.userModel!.user!.userProgress?.forEach((element) //Loop Through User's Languages
            {
              if(element.languageId == langId)
              {
                myLangProgress = element.progress!;
              }
            });
          }
        }

        print('Current Language Progress is : $myLangProgress');
        myLangProgress= '0.$myLangProgress';
        finalValue= double.parse(myLangProgress);

        return finalValue;
      }
  }
  }




