class OnboardingClass {
  final String title;
  final String description;
  final String image;

  OnboardingClass({
    required this.title,
    required this.description,
    required this.image,
  });
  static List<OnboardingClass> onboardingList = [

    OnboardingClass(
      title: "Discover New Opportunities",
      description:
          "take your business to the next level with our tools.",
      image: "1.png",
    ),

    OnboardingClass(
      title: "Grow Your Business",
      description:
          "Build meaningful connections with customers.",
      image: "2.png",
    ),

    OnboardingClass(
      title: "Simplify Your Workflow",
      description:
          "Save time and boost productivity with our smart tools.",
      image: "3.png",
    ),
    

  ];
}
