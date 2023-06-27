import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tefora/view/widget/appbar_widgets.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgets(
          "Privacy & Policy", Color.fromRGBO(4, 83, 155, 1), Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Platinum Academy built the platinum academy app as a Free app. This SERVICE is provided by platinum academy at no cost and is intended for use as is.This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at platinum academy unless otherwise defined in this Privacy Policy.",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Information Collection and Use",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.The app does use third-party services that may collect information used to identify you.",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Changes to This Privacy Policy",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.This policy is effective as of 2023-06-27.",
            style: TextStyle(fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
