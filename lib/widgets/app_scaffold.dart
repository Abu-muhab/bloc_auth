// ignore_for_file: require_trailing_commas
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.isLoading = false,
    this.appBar,
    this.bottomsheet,
    this.bottomNavigationBar,
    this.scaffoldKey,
  }) : super(key: key);

  final Widget body;
  final Color? backgroundColor;
  final bool isLoading;
  final PreferredSizeWidget? appBar;
  final Widget? bottomsheet;
  final Widget? bottomNavigationBar;
  final Key? scaffoldKey;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Stack(
        children: [
          Scaffold(
            key: widget.scaffoldKey,
            bottomSheet: widget.bottomsheet,
            backgroundColor: widget.backgroundColor,
            appBar: widget.appBar,
            bottomNavigationBar: widget.bottomNavigationBar,
            body: widget.body,
          ),
          if (widget.isLoading)
            Container(
              color: Colors.black.withAlpha(90),
              child: const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
