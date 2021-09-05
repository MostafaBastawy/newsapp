import 'package:flutter/material.dart';
import 'package:newsapp/screens/webview_screen.dart';

Widget buildArticleItem(
  Map article,
  context,
) =>
    InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, index) {
        return myDivider();
      },
      itemBuilder: (BuildContext context, index) {
        return buildArticleItem(list[index], context);
      },
      itemCount: 10,
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required String labelText,
  required Function validate,
  required IconData prefixIcon,
  IconData? suffixIcon,
  required Function onChange,
  required Function onSubmit,
  required Function onTap,
  TextInputType? type,
}) =>
    TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(),
      ),
      validator: (value) => validate(value),
      onChanged: (value) => onChange(value),
      onFieldSubmitted: (value) => onSubmit(value),
      onTap: () => onTap(),
      keyboardType: type,
    );

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}
