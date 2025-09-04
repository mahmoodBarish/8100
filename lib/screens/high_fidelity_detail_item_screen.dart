import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HighFidelityDetailItemScreen extends StatefulWidget {
  const HighFidelityDetailItemScreen({super.key});

  @override
  State<HighFidelityDetailItemScreen> createState() =>
      _HighFidelityDetailItemScreenState();
}

class _HighFidelityDetailItemScreenState
    extends State<HighFidelityDetailItemScreen> {
  String _selectedSize = 'M';
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    // Define common padding values for responsiveness based on 375x812 Figma
    final double horizontalPadding = screenWidth * (24 / 375);
    final double largeVerticalSpacing = screenHeight * (16 / 812);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            mediaQuery.padding.top + screenWidth * (44 / 375)), // Status bar + header height
        child: Padding(
          padding: EdgeInsets.only(
            top: mediaQuery.padding.top, // Account for system status bar height
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: Column(
            children: [
              _buildStatusBar(screenWidth),
              SizedBox(height: largeVerticalSpacing),
              _buildHeader(screenWidth),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: largeVerticalSpacing), // Spacing below app bar
            _buildProductImage(screenWidth, screenHeight),
            SizedBox(height: largeVerticalSpacing),
            _buildProductDetails(screenWidth, screenHeight),
            SizedBox(height: largeVerticalSpacing),
            Divider(color: const Color(0xFFE3E3E3), thickness: 1),
            SizedBox(height: largeVerticalSpacing),
            _buildDescription(screenWidth),
            SizedBox(height: largeVerticalSpacing * 2),
            _buildSizeSelection(screenWidth),
            SizedBox(
                height: screenHeight *
                    (118 / 812)), // Space for the fixed bottom action bar
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActionbar(screenWidth, screenHeight),
    );
  }

  Widget _buildStatusBar(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '9:41',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(Icons.signal_cellular_alt_rounded,
                size: screenWidth * (16 / 375), color: const Color(0xFF242424)),
            SizedBox(width: screenWidth * (4 / 375)),
            Icon(Icons.wifi_rounded,
                size: screenWidth * (16 / 375), color: const Color(0xFF242424)),
            SizedBox(width: screenWidth * (4 / 375)),
            Icon(Icons.battery_full_rounded,
                size: screenWidth * (16 / 375), color: const Color(0xFF242424)),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop(); // Use context.pop() for back navigation
          },
          child: Container(
            width: screenWidth * (44 / 375),
            height: screenWidth * (44 / 375),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent, // Figma background is transparent
            ),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: const Color(0xFF242424),
              size: screenWidth * (24 / 375),
            ),
          ),
        ),
        Text(
          'Detail',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
          child: Container(
            width: screenWidth * (44 / 375),
            height: screenWidth * (44 / 375),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
            ),
            child: Icon(
              _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: const Color(0xFF242424),
              size: screenWidth * (24 / 375),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/I142_377_417_715.png', // Main product image
        width: screenWidth - (screenWidth * (24 / 375) * 2), // Full width minus horizontal padding
        height: screenHeight * (202 / 812), // Dynamic height based on Figma ratio
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                color: const Color(0xFF242424),
                fontSize: screenWidth * (20 / 375),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenHeight * (4 / 812)),
            Text(
              'Ice/Hot',
              style: GoogleFonts.sora(
                color: const Color(0xFF909090),
                fontSize: screenWidth * (12 / 375),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * (16 / 812)),
            Row(
              children: [
                Icon(Icons.star_rounded,
                    color: const Color(0xFFFABE21),
                    size: screenWidth * (20 / 375)),
                SizedBox(width: screenWidth * (4 / 375)),
                Text(
                  '4.8',
                  style: GoogleFonts.sora(
                    color: const Color(0xFF2A2A2A),
                    fontSize: screenWidth * (16 / 375),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: screenWidth * (4 / 375)),
                Text(
                  '(230)',
                  style: GoogleFonts.sora(
                    color: const Color(0xFF909090),
                    fontSize: screenWidth * (12 / 375),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildSuperiorityIcon(
                'assets/images/I142_371_418_950.png', screenWidth), // Bike icon
            SizedBox(width: screenWidth * (12 / 375)),
            _buildSuperiorityIcon(
                'assets/images/I142_373_418_971.png', screenWidth), // Bean icon
            SizedBox(width: screenWidth * (12 / 375)),
            _buildSuperiorityIcon(
                'assets/images/I142_375_418_967.png', screenWidth), // Milk icon
          ],
        )
      ],
    );
  }

  Widget _buildSuperiorityIcon(String assetPath, double screenWidth) {
    return Container(
      width: screenWidth * (44 / 375),
      height: screenWidth * (44 / 375),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0x59EDEDED), // R:237, G:237, B:237, A:0.35
      ),
      child: Center(
        child: Image.asset(
          assetPath,
          width: screenWidth * (20 / 375),
          height: screenWidth * (20 / 375),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildDescription(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * (8 / 375)),
        RichText(
          text: TextSpan(
            style: GoogleFonts.sora(
              color: const Color(0xFFA1A1A1), // R:161, G:161, B:161, A:1
              fontSize: screenWidth * (14 / 375),
              fontWeight: FontWeight.w300,
              height: 1.5,
            ),
            children: <TextSpan>[
              const TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
              ),
              TextSpan(
                text: 'Read More',
                style: GoogleFonts.sora(
                  color: const Color(0xFFC67C4E), // Primary accent color
                  fontSize: screenWidth * (14 / 375),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelection(double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.sora(
            color: const Color(0xFF242424),
            fontSize: screenWidth * (16 / 375),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: screenWidth * (16 / 375)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['S', 'M', 'L'].map((size) {
            bool isSelected = _selectedSize == size;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSize = size;
                });
              },
              child: Container(
                width: screenWidth * (96 / 375),
                height: screenWidth * (41 / 375),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFF9F2ED) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFC67C4E)
                        : const Color(0xFFE3E3E3),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    size,
                    style: GoogleFonts.sora(
                      color: isSelected
                          ? const Color(0xFFC67C4E)
                          : const Color(0xFF242424),
                      fontSize: screenWidth * (14 / 375),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomActionbar(double screenWidth, double screenHeight) {
    final bottomSafeAreaHeight = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      // Total height: Figma bar (118) + system safe area (if any)
      height: screenHeight * (118 / 812) + bottomSafeAreaHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * (24 / 375),
          right: screenWidth * (24 / 375),
          top: screenHeight * (16 / 812),
          bottom: bottomSafeAreaHeight > 0
              ? bottomSafeAreaHeight
              : screenHeight * (34 / 812), // Apply system safe area or Figma's 34px if no safe area
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.sora(
                        color: const Color(0xFF909090),
                        fontSize: screenWidth * (14 / 375),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: screenWidth * (4 / 375)),
                    Text(
                      '\$ 4.53',
                      style: GoogleFonts.sora(
                        color: const Color(0xFFC67C4E), // Primary accent color
                        fontSize: screenWidth * (18 / 375),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to order screen using go_router.
                    // Assuming '/order' is the intended route for "Buy Now" or adding to cart leading to order flow.
                    context.push('/order');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC67C4E), // Primary accent color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * (20 / 375),
                      vertical: screenWidth * (16 / 375),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Buy Now',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: screenWidth * (16 / 375),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}