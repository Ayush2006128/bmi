import 'package:flutter/material.dart';

class BmiForm extends StatelessWidget {
  const BmiForm(
      {super.key,
      required this.heightCon,
      required this.weightCon,
      this.onSubmit});

  final TextEditingController heightCon;
  final TextEditingController weightCon;
  final void Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width*9,
      height: MediaQuery.of(context).size.height*8,
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("height"),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: heightCon,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("weight"),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: weightCon,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: const Text("submit"),
            ),
          ),
        ],
      ),
    );
  }
}
