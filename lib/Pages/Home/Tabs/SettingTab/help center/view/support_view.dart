part of 'index.dart';


class SupportView extends StatefulWidget {
  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SupportViewModel>(context, listen: false);

    final List<String> imageUrls = [
      'https://www.seqrite.com/skin/frontend/default/seqrite_v1/images/support-img.png',
      'https://img.freepik.com/free-vector/service-24-7-concept-illustration_114360-7380.jpg?w=740&t=st=1701006779~exp=1701007379~hmac=3603e3e186d15880b4d33f5b4f091b6e0aaf8289187dec2318450b1963a7d0c8',
      'https://img.freepik.com/premium-vector/phone-handset-with-speech-bubble-3d-vector-icon-cartoon-minimal-style_365941-669.jpg',
    ];

    List<SupportOption> supportOptions = [
      SupportOption(
        onPressed: () => viewModel.launchWhatsApp(context),
        iconData: Icons.wechat,
        text: 'Chat with us on WhatsApp',
        color: Colors.green,
      ),
      SupportOption(
        onPressed: () => viewModel.launchEmail(context),
        iconData: Icons.email,
        text: 'Email us for Support',
        color: Colors.blue,
      ),
      SupportOption(
        onPressed: () => viewModel.makePhoneCall(context),
        iconData: Icons.phone,
        text: 'Call Support',
        color: Colors.red,
      ),
      // Add more support options as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: ListView(
          children: [
            SizedBox(height: 1),
            Text(
              'Welcome to our Support Center!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.indigo[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'How can we assist you today? Whether you have questions, feedback, or need help with something, we\'re here for you.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0, // Adjust this value based on your design
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemCount: supportOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isLastItem = index == supportOptions.length - 1;

                  return TriangularButton(
                    onPressed: supportOptions[index].onPressed,
                    iconData: supportOptions[index].iconData,
                    text: supportOptions[index].text,
                    color: supportOptions[index].color,
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.info,
              size: MediaQuery.of(context).size.width > 600 ? 60 : 40,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
int _calculateCrossAxisCount(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth > 600 ? 4 : 2;
}
class TriangularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String text;
  final Color color;

  const TriangularButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.all(0),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class SupportOption {
  final VoidCallback onPressed;
  final IconData iconData;
  final String text;
  final Color color;

  SupportOption({
    required this.onPressed,
    required this.iconData,
    required this.text,
    required this.color,
  });
}