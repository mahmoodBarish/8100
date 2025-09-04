import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  // Route name for navigation (though go_router uses the path directly)
  static const String routeName = '/order';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // State for the Delivery/Pickup toggle
  String _selectedDeliveryType = 'Deliver';
  // State for the item quantity
  int _itemQuantity = 1;

  // Define custom colors based on Figma values
  static const Color primaryColor = Color(0xFFC67C4E); // Figma 0.776...
  static const Color darkTextColor = Color(0xFF2F2D2C); // Figma 0.141...
  static const Color mediumGrayTextColor = Color(0xFF3D3D3D); // Figma 0.191...
  static const Color lightGrayTextColor = Color(0xFFA9A9A9); // Figma 0.635...
  static const Color dividerColor = Color(0xFFEDEDED); // Figma 0.929...
  static const Color lighterDividerColor = Color(0xFFF9F2ED); // Figma 0.976...

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1), // Responsive app bar height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          // Set status bar icons to dark for light app bar background
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04), // Responsive padding
            child: GestureDetector(
              onTap: () {
                context.pop(); // Navigate back using go_router
              },
              child: Container(
                width: screenWidth * 0.11, // Responsive size
                height: screenWidth * 0.11, // Responsive size
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded, // Standard Flutter icon for back arrow
                    color: darkTextColor,
                    size: screenWidth * 0.05, // Responsive icon size
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'Order',
            style: GoogleFonts.sora(
              color: darkTextColor,
              fontSize: screenWidth * 0.045, // Responsive font size
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          // The 'Favourite' element (142:326) is marked as visible: false in Figma, so it is omitted.
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.06, // Responsive horizontal padding
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: constraints.maxHeight * 0.02),

                  // Deliver / Pick Up Toggle Section
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.06, // Responsive height
                    decoration: BoxDecoration(
                      color: dividerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDeliveryType = 'Deliver';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: _selectedDeliveryType == 'Deliver'
                                    ? primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Deliver',
                                  style: GoogleFonts.sora(
                                    color: _selectedDeliveryType == 'Deliver'
                                        ? Colors.white
                                        : darkTextColor,
                                    fontSize: constraints.maxWidth * 0.04, // Responsive font size
                                    fontWeight: _selectedDeliveryType == 'Deliver'
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDeliveryType = 'Pick Up';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                color: _selectedDeliveryType == 'Pick Up'
                                    ? primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Pick Up',
                                  style: GoogleFonts.sora(
                                    color: _selectedDeliveryType == 'Pick Up'
                                        ? Colors.white
                                        : darkTextColor,
                                    fontSize: constraints.maxWidth * 0.04, // Responsive font size
                                    fontWeight: _selectedDeliveryType == 'Pick Up'
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Delivery Address Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Address',
                        style: GoogleFonts.sora(
                          color: darkTextColor,
                          fontSize: constraints.maxWidth * 0.045, // Responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Text(
                        'Jl. Kpg Sutoyo',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038, // Responsive font size
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.005),
                      Text(
                        'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
                        style: GoogleFonts.sora(
                          color: lightGrayTextColor,
                          fontSize: constraints.maxWidth * 0.032, // Responsive font size
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      Row(
                        children: [
                          // Edit Address Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightGrayTextColor),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // Navigates to an inferred '/editAddress' route using go_router
                                  context.push('/editAddress');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.03,
                                    vertical: constraints.maxHeight * 0.007,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit_outlined, // Standard Flutter icon for edit
                                        size: constraints.maxWidth * 0.038,
                                        color: mediumGrayTextColor,
                                      ),
                                      SizedBox(width: constraints.maxWidth * 0.01),
                                      Text(
                                        'Edit Address',
                                        style: GoogleFonts.sora(
                                          color: mediumGrayTextColor,
                                          fontSize: constraints.maxWidth * 0.032,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),

                          // Add Note Button
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightGrayTextColor),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(16),
                                onTap: () {
                                  // Navigates to an inferred '/addNote' route using go_router
                                  context.push('/addNote');
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.03,
                                    vertical: constraints.maxHeight * 0.007,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.note_alt_outlined, // Standard Flutter icon for notes
                                        size: constraints.maxWidth * 0.038,
                                        color: mediumGrayTextColor,
                                      ),
                                      SizedBox(width: constraints.maxWidth * 0.01),
                                      Text(
                                        'Add Note',
                                        style: GoogleFonts.sora(
                                          color: mediumGrayTextColor,
                                          fontSize: constraints.maxWidth * 0.032,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Divider Line
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.005, // Responsive height for divider
                    color: lighterDividerColor,
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Checkout Product Item
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/I142_286_417_715.png', // Local asset path from rules
                              width: constraints.maxWidth * 0.14, // Responsive size
                              height: constraints.maxWidth * 0.14, // Responsive size
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.04),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Caffe Mocha',
                                style: GoogleFonts.sora(
                                  color: darkTextColor,
                                  fontSize: constraints.maxWidth * 0.045,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: constraints.maxHeight * 0.005),
                              Text(
                                'Deep Foam',
                                style: GoogleFonts.sora(
                                  color: lightGrayTextColor,
                                  fontSize: constraints.maxWidth * 0.032,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Minus quantity button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_itemQuantity > 1) _itemQuantity--;
                              });
                            },
                            child: Container(
                              width: constraints.maxWidth * 0.07,
                              height: constraints.maxWidth * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: dividerColor),
                              ),
                              child: Icon(
                                Icons.remove, // Standard Flutter icon for minus
                                size: constraints.maxWidth * 0.04,
                                color: lightGrayTextColor,
                              ),
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03),
                          Text(
                            _itemQuantity.toString(),
                            style: GoogleFonts.sora(
                              color: mediumGrayTextColor,
                              fontSize: constraints.maxWidth * 0.038,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03),
                          // Plus quantity button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _itemQuantity++;
                              });
                            },
                            child: Container(
                              width: constraints.maxWidth * 0.07,
                              height: constraints.maxWidth * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: dividerColor),
                              ),
                              child: Icon(
                                Icons.add, // Standard Flutter icon for plus
                                size: constraints.maxWidth * 0.04,
                                color: mediumGrayTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Discount Card
                  Container(
                    width: double.infinity,
                    height: constraints.maxHeight * 0.07, // Responsive height
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.04,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          // Navigates to an inferred '/discount' route using go_router
                          context.push('/discount');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.local_offer_outlined, // Standard Flutter icon for discount
                              color: primaryColor,
                              size: constraints.maxWidth * 0.05,
                            ),
                            SizedBox(width: constraints.maxWidth * 0.04),
                            Text(
                              '1 Discount is Applies',
                              style: GoogleFonts.sora(
                                color: mediumGrayTextColor,
                                fontSize: constraints.maxWidth * 0.038,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded, // Standard Flutter icon for right arrow
                              color: darkTextColor,
                              size: constraints.maxWidth * 0.04,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),

                  // Payment Summary Section
                  Text(
                    'Payment Summary',
                    style: GoogleFonts.sora(
                      color: darkTextColor,
                      fontSize: constraints.maxWidth * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),

                  // Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$ 4.53',
                        style: GoogleFonts.sora(
                          color: darkTextColor,
                          fontSize: constraints.maxWidth * 0.038,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01),

                  // Delivery Fee Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee',
                        style: GoogleFonts.sora(
                          color: mediumGrayTextColor,
                          fontSize: constraints.maxWidth * 0.038,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$ 2.0',
                            style: GoogleFonts.sora(
                              color: mediumGrayTextColor,
                              fontSize: constraints.maxWidth * 0.038,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough, // Strikethrough for old price
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Text(
                            '\$ 1.0',
                            style: GoogleFonts.sora(
                              color: darkTextColor,
                              fontSize: constraints.maxWidth * 0.038,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),
                ],
              ),
            );
          },
        ),
      ),
      // Bottom Navigation Bar / Persistent Footer
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06, // Responsive horizontal padding
          vertical: screenHeight * 0.02, // Responsive vertical padding
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Occupy minimum space vertically
          children: [
            // Payment Method display
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined, // Standard Flutter icon for wallet
                      color: primaryColor,
                      size: screenWidth * 0.05,
                    ),
                    SizedBox(width: screenWidth * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cash/Wallet',
                          style: GoogleFonts.sora(
                            color: darkTextColor,
                            fontSize: screenWidth * 0.038,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          '\$ 5.53',
                          style: GoogleFonts.sora(
                            color: primaryColor,
                            fontSize: screenWidth * 0.032,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded, // Standard Flutter icon for dropdown
                  color: darkTextColor,
                  size: screenWidth * 0.05,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),

            // Order Button
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07, // Responsive height for button
              child: ElevatedButton(
                onPressed: () {
                  // Navigates to an inferred '/orderConfirmation' route using go_router
                  context.push('/orderConfirmation');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.zero, // Remove default padding
                ),
                child: Text(
                  'Order',
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}