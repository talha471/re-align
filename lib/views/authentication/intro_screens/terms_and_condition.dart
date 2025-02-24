import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_align/constants/constant_widgets.dart';
import 'package:re_align/views/authentication/intro_screens/personalized_experience.dart';
import 'package:re_align/widgets/background_base.dart';
import 'package:re_align/widgets/custom_button.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseScreen(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.white,)),                     const SizedBox(height: 30,),
              customText(
                  text: "Terms, Conditions, and Privacy \nPolicies",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white
              ),
              const SizedBox(height: 20,),
              customText(
                  text: "Terms & Conditions",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black
              ),
              const SizedBox(height: 20,),
              customText(
                  text: "Seven american red arrgh maroon brig. Execution blow across chase boat round reef. Jolly o'nine prey main yawl sink mutiny mutiny jones' chain. Lanyard tender yer black spirits aye. Chantey lateen tails jib bilged. Topgallant nipper topmast ipsum spanker road quarterdeck. Sheet arr fleet spyglass gold coxswain the brig crack. Sink gunwalls ahoy cup tales pay. A hogshead measured crow's sheet six yellow gaff locker. Dead gun tea smartly jack men. Coast halter gangplank crow's on. Just aft cat warp across pirate fer pirate ballast. Sink chantey chains coast o'nine yard yellow fluke. Overhaul a yard of scourge no. The ahoy weigh weigh pink fathom rum gun her. Buccaneer avast pirate tender sink gabion. Ahoy jack timbers rig cat. Shiver scurvy just lass just grog man. Just aye parrel jennys down spanish pillage. Killick hands tea cog jib smartly reef cat coffer. Cat tell ballast roger crack lee. Pin the topmast killick jib arr. Roger boatswain yer spanish coxswain. Landlubber topmast seas coxswain splice. Maroon hang pounders bilged jack chain o'nine topgallant.",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black
              ),
              const Spacer(),
              CustomButton(
                  text: "I Agree",
                  onPressed: (){
                    Get.to(() => const PersonalizedExperience());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}