import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Shared/Components/Components.dart';
import '../../../layout/NewsApp/Cubit/cubit.dart';
import '../../../layout/NewsApp/Cubit/states.dart';

class Sports_Screen extends StatelessWidget {
  const Sports_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list = NewsCubit.get(context).Sports;
        return ConditionalBuilder(
          condition: list.isNotEmpty ,
          builder: (context)=> ListView.separated(
              itemBuilder: (context, index) => build_list_news(list[index],context),
              separatorBuilder: (context, index) => line(),
              itemCount: list.length
          ),
          fallback: (context)=>  Center(child: CircularProgressIndicator(color: Colors.orange,)),
        );
      },
    );
  }
}