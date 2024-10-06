
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../logic/cubit/search_cubit.dart';
import '../widgets/notes.dart';
import '../widgets/search_failure_view.dart';

// ignore: must_be_immutable
class SearchView extends StatefulWidget {

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  // ignore: prefer_final_fields
  TextEditingController _controller = TextEditingController();
  String keyword = '';

  Widget _buildSearchTextField(){
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(),
        hintText: 'Search by the keyword...',
        hintStyle: TextStyle(
          color: AppColors.grey,
        ),
        suffixIcon: Icon(Icons.close,color: AppColors.grey,),
      ),
      style: const TextStyle(
        color: AppColors.white,
      ),
      onChanged: (value) {
        setState(() {
          keyword = value;
        });
        BlocProvider.of<SearchCubit>(context).filterList(keyword);
      },
    );
  }

  Widget _buildBlocBuilder(){
    return BlocBuilder<SearchCubit,SearchState>(builder: (context,state){
      if(state is SearchSuccess){
        return NotesSearch(notes: state.items);
      }else if(state is SearchFailure){
        return SearchFailureView(assetName: AppAssets.emptySearch,message: AppStrings.emptySearch,);
      }
        return SearchFailureView(assetName: AppAssets.search,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
             child:  Column(
                 children: [
                  _buildSearchTextField(),
                  _buildBlocBuilder(),
                 ],
              ),
          ),
      ),
    );
  }
}