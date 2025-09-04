import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  // Define colors based on Figma JSON values
  final Color primaryDarkColor = const Color.fromRGBO(36, 36, 36, 1);
  final Color mediumGreyColor = const Color.fromRGBO(162, 162, 162, 1);
  final Color lightGreyColor = const Color.fromRGBO(227, 227, 227, 1);
  final Color veryLightGreyColor = const Color.fromRGBO(237, 237, 237, 1);
  final Color accentOrangeColor = const Color.fromRGBO(198, 124, 78, 1);
  final Color accentGreenColor = const Color.fromRGBO(54, 192, 126, 1);
  final Color whiteColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Figma base screen size is 375x812
    // Calculate scaling factors for responsive design
    final double scaleWidth = screenWidth / 375;
    final double scaleHeight = screenHeight / 812;

    return Scaffold(
      body: Stack(
        children: [
          // Maps (background image) - 142:198
          Positioned.fill(
            child: Image.asset(
              'assets/images/142_198.png',
              fit: BoxFit.cover,
            ),
          ),

          // Top section: Status bar and Delivery Info header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * scaleWidth, // 16px on 375px screen
                ),
                child: Column(
                  children: [
                    SizedBox(height: 12 * scaleHeight), // Spacing for status bar area (approx)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button - 142:234
                        GestureDetector(
                          onTap: () {
                            context.pop(); // Go back to the previous screen using go_router
                          },
                          child: Container(
                            width: 44 * scaleWidth,
                            height: 44 * scaleWidth,
                            decoration: BoxDecoration(
                              color: veryLightGreyColor,
                              borderRadius: BorderRadius.circular(12 * scaleWidth),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: primaryDarkColor,
                              size: 18 * scaleWidth, // Adjusted for better visibility
                            ),
                          ),
                        ),
                        // Screen Title (Inferred from screen name "High-Fidelity ( Delivery )")
                        Text(
                          'Delivery',
                          style: GoogleFonts.sora(
                            fontSize: 16 * scaleWidth,
                            fontWeight: FontWeight.w600, // SemiBold
                            color: primaryDarkColor,
                          ),
                        ),
                        // GPS Icon Button - 142:237
                        Container(
                          width: 44 * scaleWidth,
                          height: 44 * scaleWidth,
                          decoration: BoxDecoration(
                            color: veryLightGreyColor,
                            borderRadius: BorderRadius.circular(12 * scaleWidth),
                          ),
                          child: Icon(
                            Icons.gps_fixed, // Closest match for "gps"
                            color: primaryDarkColor,
                            size: 20 * scaleWidth, // Adjusted size
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Driver Location (on map) - 142:231
          Positioned(
            // Original x: 1861, y: 311. Relative to 1628,0 origin, so 1861-1628 = 233.
            left: 233 * scaleWidth,
            top: 311 * scaleHeight, // 311px on 812px screen
            child: Container(
              padding: EdgeInsets.all(8 * scaleWidth), // 8px
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20 * scaleWidth),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 4 * scaleWidth,
                    offset: Offset(0, 4 * scaleHeight),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/I142_232_418_950.png', // Custom bike icon
                width: 24 * scaleWidth,
                height: 24 * scaleWidth,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Delivery Location marker - 142:224
          Positioned(
            // Original x: 1694, y: 211. Relative to 1628,0 origin, so 1694-1628 = 66.
            left: 66 * scaleWidth,
            top: 211 * scaleHeight, // 211px on 812px screen
            child: Icon(
              Icons.location_on, // Closest match for "Location"
              color: accentOrangeColor,
              size: 30 * scaleWidth, // Adjusted size
            ),
          ),

          // Detail Driver (bottom sheet) - 142:199
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: screenWidth,
              height: 322 * scaleHeight, // 322px on 812px screen
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24 * scaleWidth),
                  topRight: Radius.circular(24 * scaleWidth),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * scaleWidth,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 16 * scaleHeight), // 16px
                    // Indicator - 142:223
                    Container(
                      width: 45 * scaleWidth,
                      height: 5 * scaleHeight,
                      decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(16 * scaleWidth),
                      ),
                    ),
                    SizedBox(height: 16 * scaleHeight), // 16px
                    // 10 minutes left & Delivery to Jl. Kpg Sutoyo - 142:215
                    Column(
                      children: [
                        Text(
                          '10 minutes left',
                          style: GoogleFonts.sora(
                            fontSize: 16 * scaleWidth,
                            fontWeight: FontWeight.w600, // SemiBold
                            color: primaryDarkColor,
                          ),
                        ),
                        SizedBox(height: 2 * scaleHeight), // 2px
                        Text.rich(
                          TextSpan(
                            text: 'Delivery to ',
                            style: GoogleFonts.sora(
                              fontSize: 12 * scaleWidth,
                              fontWeight: FontWeight.w400, // Regular
                              color: mediumGreyColor,
                              height: 1.5, // To match 18px line height for 12px font size
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jl. Kpg Sutoyo',
                                style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600, // SemiBold
                                  color: primaryDarkColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20 * scaleHeight), // 20px gap
                    // Progress Bar - 142:218
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProgressBarSegment(accentGreenColor, scaleWidth), // 142:219
                        SizedBox(width: 10 * scaleWidth), // 10px
                        _buildProgressBarSegment(accentGreenColor, scaleWidth), // 142:220
                        SizedBox(width: 10 * scaleWidth), // 10px
                        _buildProgressBarSegment(accentGreenColor, scaleWidth), // 142:221
                        SizedBox(width: 10 * scaleWidth), // 10px
                        _buildProgressBarSegment(lightGreyColor, scaleWidth), // 142:222
                      ],
                    ),
                    SizedBox(height: 28 * scaleHeight), // 28px gap
                    // Delivery Status and Text - 142:209
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8 * scaleHeight,
                          horizontal: 16 * scaleWidth,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: lightGreyColor, width: 1 * scaleWidth),
                        borderRadius: BorderRadius.circular(12 * scaleWidth),
                      ),
                      child: Row(
                        children: [
                          // Deliver Icon Container - 142:210
                          Container(
                            width: 56 * scaleWidth,
                            height: 56 * scaleWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor, width: 1 * scaleWidth),
                              borderRadius: BorderRadius.circular(12 * scaleWidth),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/I142_211_418_950.png', // Custom motorbike icon
                                width: 27.5 * scaleWidth,
                                height: 27.5 * scaleWidth,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 16 * scaleWidth), // 16px
                          // Text - 142:212
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivered your order',
                                  style: GoogleFonts.sora(
                                    fontSize: 14 * scaleWidth,
                                    fontWeight: FontWeight.w600, // SemiBold
                                    color: primaryDarkColor,
                                  ),
                                ),
                                SizedBox(height: 4 * scaleHeight), // 4px
                                Text(
                                  'We will deliver your goods to you in\nthe shortest possible time.',
                                  style: GoogleFonts.sora(
                                    fontSize: 12 * scaleWidth,
                                    fontWeight: FontWeight.w300, // Light
                                    color: mediumGreyColor,
                                    height: 1.5, // To match 18px line height for 12px font size
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20 * scaleHeight), // 20px gap
                    // Driver Profile & Call - 142:200
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Driver Profile - 142:201
                        Row(
                          children: [
                            // Driver Image - 142:203
                            Container(
                              width: 56 * scaleWidth,
                              height: 56 * scaleWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14 * scaleWidth),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/142_203.png'), // Driver profile image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16 * scaleWidth), // 16px
                            // Driver Name and Role - 142:204
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brooklyn Simmons',
                                  style: GoogleFonts.sora(
                                    fontSize: 14 * scaleWidth,
                                    fontWeight: FontWeight.w600, // SemiBold
                                    color: primaryDarkColor,
                                  ),
                                ),
                                SizedBox(height: 4 * scaleHeight), // 4px
                                Text(
                                  'Personal Courier',
                                  style: GoogleFonts.sora(
                                    fontSize: 12 * scaleWidth,
                                    fontWeight: FontWeight.w400, // Regular
                                    color: mediumGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Call Button - 142:207
                        GestureDetector(
                          onTap: () {
                            // Placeholder for call functionality.
                            // If a call screen were needed, it would use context.push('/callDriver')
                            debugPrint('Calling Brooklyn Simmons...');
                          },
                          child: Container(
                            width: 44 * scaleWidth,
                            height: 44 * scaleWidth,
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGreyColor, width: 1 * scaleWidth),
                              borderRadius: BorderRadius.circular(12 * scaleWidth),
                            ),
                            child: Icon(
                              Icons.call_outlined, // Closest match for "Calling"
                              color: primaryDarkColor,
                              size: 20 * scaleWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator - 142:249
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 34 * scaleHeight, // 34px on 812px screen
              alignment: Alignment.topCenter,
              child: Container(
                width: 134 * scaleWidth,
                height: 5 * scaleHeight,
                decoration: BoxDecoration(
                  color: primaryDarkColor,
                  borderRadius: BorderRadius.circular(100 * scaleWidth),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for progress bar segments
  Widget _buildProgressBarSegment(Color color, double scaleWidth) {
    // Each segment width: 71.25px as per Figma
    return Expanded( // Use Expanded to evenly distribute segments
      child: Container(
        height: 4 * scaleWidth, // Scale height as well
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20 * scaleWidth),
        ),
      ),
    );
  }
}