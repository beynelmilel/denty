part of search_view;

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
    required this.size,
    required this.onPress,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Size size;
  final VoidCallback onPress;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: size.height * 0.08,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(color: themeData.primaryColor),
                ),
                Icon(icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


