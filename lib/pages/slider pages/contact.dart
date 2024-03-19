import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your full name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    maxLines: 10,
                    decoration: const InputDecoration(
                      // labelText: 'Message',
                      hintText:
                          'Type your message here. We value your feedback and are here to assist you with any questions or concerns you may have. Please provide as much detail as possible to help us better understand and address your inquiry. Thank you for reaching out to us!',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const Column(
                children: [
                  Text('Email us at gavinmasese911@gmail.com'),
                  Text('call us at 0791722733'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
