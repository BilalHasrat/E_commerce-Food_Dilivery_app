class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent({required this.image,required this.title, required this.description});

 static List<OnboardingContent> content = [
    OnboardingContent(image: 'images/screen1.png', title: "select from our \n Best Menu", description: 'Pick your food from our menu\n more than 35 times'),
    OnboardingContent(image: 'images/screen2.png', title: "Easy and online payment", description: 'You can pay Cash on Delivery and \n Card payment is available'),
    OnboardingContent(image: 'images/screen2.png', title: "Quick delivery at your Doorstep", description: 'Deliver your food at your \n Doorstep'),

  ];
}