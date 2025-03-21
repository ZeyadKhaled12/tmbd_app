import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MlWidgetSearch extends StatefulWidget {
  const MlWidgetSearch({super.key});

  @override
  State<MlWidgetSearch> createState() => _MlWidgetSearchState();
}

class _MlWidgetSearchState extends State<MlWidgetSearch> {
  bool _isSeach = false;
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose(); // Always dispose FocusNode
    _controller.dispose();
    super.dispose();
  }

  void _unfocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.withOpacity(0.4))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              cursorColor: Colors.white,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 15),
              onChanged: (value) {
                setState(() {
                  _isSeach = true;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for movie',
                hintStyle: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.2), fontSize: 15),
              ),
            ),
          ),
          _isSeach
              ? InkWell(
                  onTap: () {
                    setState(() {
                      _controller.clear();
                      _unfocus();
                      _isSeach = false;
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              : Icon(
                  Icons.search_outlined,
                  color: Colors.white,
                  size: 25,
                ),
          Padding(padding: EdgeInsets.only(left: 20))
        ],
      ),
    );
  }
}
