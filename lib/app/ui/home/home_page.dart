import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiki_app/app/bloc/home/provider/home_bloc.dart';
import 'package:wiki_app/app/repository/home/model/wiki_result.dart' as wiki;
import 'package:wiki_app/app/ui/home/web_view_page.dart';
import 'package:wiki_app/resources/font_styles/poppin_style.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;
  TextEditingController textEditingController  = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
   homeBloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      resizeToAvoidBottomInset: false,
      body:  SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 20,right: 20),
              child: Form(
                key: _formKey,
                child: TextFormField(controller: textEditingController, onEditingComplete: (){
                  if(_formKey.currentState!.validate()){
                    FocusScope.of(context).unfocus();
                    homeBloc.add(SearchResultEvent(textEditingController.text));
                  }
                },
                  onChanged: (value){
                    _formKey.currentState!.validate();
                  },
                  validator: (value){
                  if(textEditingController.text.isEmpty){
                    return "Can't be empty";
                  }
                  return null;
                  },
                  cursorColor: const Color(0xFF38CC77),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle:  Poppins.textStyleW200(fontSize: 12),
                  contentPadding: EdgeInsets.only(left: 16),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.red)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Color(0xFF38CC77))),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Color(0xFF38CC77)))
                ),),
              ),
            ),
            BlocConsumer<HomeBloc, HomeState>(
              bloc: homeBloc,
              listener: (ctxt, state) {},
    builder: (ctxt, state) {
                if(state is LoadedHomeState) {
                  var keyList = state.wikiResults.query?.pages?.keys.toList()??[];
                  if(keyList.isEmpty){
                    return Center(child: Container(child: Text("No Results Found",style: Poppins.textStyleW200(fontSize: 12),),),);
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16,bottom: 10.0),
                      child: ListView.builder(
                        itemCount: keyList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return listItem(state.wikiResults.query?.pages?[keyList[index]],context);
                        }),
                    ),
                  );
                }
                else if(state is LoadingHomeState){
                  return
                      const Expanded(child: Center(child: CircularProgressIndicator()));
                }
                else if(state is ErrorHomeState){
                  return  Expanded(child: Center(child: Text("Something went wrong",style: Poppins.textStyleW200(fontSize: 12),),));
                }
            return const SizedBox();
    }
            ),
          ],
        ),
      ),
    );
  }


}

Widget listItem(wiki.Page? page,BuildContext context){
 return Padding(padding: const EdgeInsets.only(top: 16,left: 16,right: 16),child:GestureDetector(
   onTap: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewPage(webViewUrl: 'https://en.wikipedia.org/wiki/${page?.title}')));
   },
   child: Card(

     color: Colors.white,
     child: Padding(
       padding:  EdgeInsets.only(bottom: 16.0),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           Column(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               page?.thumbnail?.source!=null && (page?.thumbnail?.source?.isNotEmpty??false)?
               Container(
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.black,width: 0.5),
                   shape: BoxShape.rectangle
                 ),
                 margin: const EdgeInsets.only(top: 16.0,left: 8),
                 child:   CachedNetworkImage(
               imageUrl: page?.thumbnail?.source??'',
                 fit: BoxFit.scaleDown,
                 fadeInDuration:  Duration(milliseconds: 500),
                 placeholder: (context, value) {
                   return Container(decoration:BoxDecoration( border: Border.all(color: Colors.black,width: 0.5),
                       shape: BoxShape.rectangle),child: Image.asset('assets/images/noImage.png',width: 100,height: 100,fit: BoxFit.fitWidth));
                 },
                 errorWidget: (context, value, i) {
                   return Container(decoration:BoxDecoration( border: Border.all(color: Colors.black,width: 0.5),
                       shape: BoxShape.rectangle),child: Image.asset('assets/images/noImage.png',width: 100,height: 100,fit: BoxFit.fitWidth,));
                 },
                 height: 100,
                 width: 100,
               )
               ):
               Padding(
                 padding: const EdgeInsets.only(top: 16.0,left: 8),
                 child: Container(decoration:BoxDecoration( border: Border.all(color: Colors.black,width: 0.5),
                     shape: BoxShape.rectangle),child: Image.asset('assets/images/noImage.png',width: 100,height: 100,fit: BoxFit.fitWidth,)),
               )
             ],
           ),
           Expanded(
             child: Padding(
               padding:  const EdgeInsets.only(left: 16,right: 16,top: 16),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(children: [Expanded(child: Text(page?.title??'',style: Poppins.textStyleW600(fontSize: 18),))]),
                   Row(
                     children: [
                       Expanded(child: Text(page?.extract??'',overflow: TextOverflow.ellipsis,maxLines: 5,)),
                     ],
                   )
                 ],
               ),
             ),
           )
         ],
       ),
     ),
   ),
 ),);
}
