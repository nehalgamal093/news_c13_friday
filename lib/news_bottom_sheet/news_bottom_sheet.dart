import 'package:flutter/material.dart';
import 'package:news_c13_friday/model/NewsResponse.dart';

showNewsBottomSheet(BuildContext context, Articles article) {
  Size size = MediaQuery.of(context).size;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                article.description!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(16.0),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'View Full Article',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
