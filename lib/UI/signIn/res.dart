import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class McGyver {

  McGyver mcGyver = McGyver();

  // static final TAG_CLASS_ID = "McGyver";

  static double _fixedWidth;    // Defined in pixels !!
  static double _fixedHeight;   // Defined in pixels !!
  static bool _isFullScreenApp = false;   // Define whether app is a fullscreen app [true] or not [false] !!

  static void hideSoftKeyboard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  static double roundToDecimals(double val, int places) {
    double mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  static Orientation setScaleRatioBasedOnDeviceOrientation(BuildContext context) {
    Orientation scaleAxis;
    if(MediaQuery.of(context).orientation == Orientation.portrait) {
      _fixedWidth = 420;                  // Ration: 1 [width]
      _fixedHeight = 840;                 // Ration: 2 [height]
      scaleAxis = Orientation.portrait;   // Shortest axis == width !!
    } else {
      _fixedWidth = 840;                   // Ration: 2 [width]
      _fixedHeight = 420;                  // Ration: 1 [height]
      scaleAxis = Orientation.landscape;   // Shortest axis == height !!
    }
    return scaleAxis;
  }

  static int rsIntW(BuildContext context, double scaleValue) {

    // ---------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled integer - Scaling based on device's width.                            //
    // ---------------------------------------------------------------------------------------- //

    final double _origVal = McGyver.rsDoubleW(context, scaleValue);
    return McGyver.roundToDecimals(_origVal, 0).toInt();
  }

  static int rsIntH(BuildContext context, double scaleValue) {

    // ---------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled integer - Scaling based on device's height.                           //
    // ---------------------------------------------------------------------------------------- //

    final double _origVal = McGyver.rsDoubleH(context, scaleValue);
    return McGyver.roundToDecimals(_origVal, 0).toInt();
  }

  static double rsDoubleW(BuildContext context, double wPerc) {

    // ------------------------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled double - scaling based on device's screen width in relation to fixed width ration.   //
    // INPUTS: - 'context'     [context] -> BuildContext                                                           //
    //         - 'wPerc'   [double]  -> Value (as a percentage) to be ratio-scaled in terms of width.          //
    // OUTPUT: - 'rsWidth' [double]  -> Ratio-scaled value.                                                    //
    // ------------------------------------------------------------------------------------------------------- //

    final int decimalPlaces = 14;   //* NB: Don't change this value -> has big effect on output result accuracy !!

    Size screenSize = MediaQuery.of(context).size;                  // Device Screen Properties (dimensions etc.).
    double scrnWidth = screenSize.width.floorToDouble();        // Device Screen maximum Width (in pixels).

    McGyver.setScaleRatioBasedOnDeviceOrientation(context);   //* Set Scale-Ratio based on device orientation.

    double rsWidth = 0;   //* OUTPUT: 'rsWidth' == Ratio-Scaled Width (in pixels)
    if (scrnWidth == _fixedWidth) {

      //* Do normal 1:1 ratio-scaling for matching screen width (i.e. '_fixedWidth' vs. 'scrnWidth') dimensions.
      rsWidth = McGyver.roundToDecimals(scrnWidth * (wPerc / 100), decimalPlaces);

    } else {

      //* Step 1: Calculate width difference based on width scale ration (i.e. pixel delta: '_fixedWidth' vs. 'scrnWidth').
      double wPercRatioDelta = McGyver.roundToDecimals(100 - ((scrnWidth / _fixedWidth) * 100), decimalPlaces);   // 'wPercRatioDelta' == Width Percentage Ratio Delta !!

      //* Step 2: Calculate primary ratio-scale adjustor (in pixels) based on input percentage value.
      double wPxlsInpVal = (wPerc / 100) * _fixedWidth;   // 'wPxlsInpVal' == Width in Pixels of Input Value.

      //* Step 3: Calculate secondary ratio-scale adjustor (in pixels) based on primary ratio-scale adjustor.
      double wPxlsRatDelta = (wPercRatioDelta / 100) * wPxlsInpVal;   // 'wPxlsRatDelta' == Width in Pixels of Ratio Delta (i.e. '_fixedWidth' vs. 'scrnWidth').

      //* Step 4: Finally -> Apply ratio-scales and return value to calling function / instance.
      rsWidth = McGyver.roundToDecimals((wPxlsInpVal - wPxlsRatDelta), decimalPlaces);

    }
    return rsWidth;
  }

  static double rsDoubleH(BuildContext context, double hPerc) {

    // ------------------------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled double - scaling based on device's screen height in relation to fixed height ration. //
    // INPUTS: - 'context'      [context] -> BuildContext                                                          //
    //         - 'hPerc'    [double]  -> Value (as a percentage) to be ratio-scaled in terms of height.        //
    // OUTPUT: - 'rsHeight' [double]  -> Ratio-scaled value.                                                   //
    // ------------------------------------------------------------------------------------------------------- //

    final int decimalPlaces = 14;   //* NB: Don't change this value -> has big effect on output result accuracy !!

    Size scrnSize = MediaQuery.of(context).size;                  // Device Screen Properties (dimensions etc.).
    double scrnHeight = scrnSize.height.floorToDouble();      // Device Screen maximum Height (in pixels).
    double statsBarHeight = MediaQuery.of(context).padding.top;   // Status Bar Height (in pixels).

    McGyver.setScaleRatioBasedOnDeviceOrientation(context);   //* Set Scale-Ratio based on device orientation.

    double rsHeight = 0;   //* OUTPUT: 'rsHeight' == Ratio-Scaled Height (in pixels)
    if (scrnHeight == _fixedHeight) {

      //* Do normal 1:1 ratio-scaling for matching screen height (i.e. '_fixedHeight' vs. 'scrnHeight') dimensions.
      rsHeight = McGyver.roundToDecimals(scrnHeight * (hPerc / 100), decimalPlaces);

    } else {

      //* Step 1: Calculate height difference based on height scale ration (i.e. pixel delta: '_fixedHeight' vs. 'scrnHeight').
      double hPercRatioDelta = McGyver.roundToDecimals(100 - ((scrnHeight / _fixedHeight) * 100), decimalPlaces);   // 'hPercRatioDelta' == Height Percentage Ratio Delta !!

      //* Step 2: Calculate height of Status Bar as a percentage of the height scale ration (i.e. 'statsBarHeight' vs. '_fixedHeight').
      double hPercStatsBar = McGyver.roundToDecimals((statsBarHeight / _fixedHeight) * 100, decimalPlaces);   // 'hPercStatsBar' == Height Percentage of Status Bar !!

      //* Step 3: Calculate primary ratio-scale adjustor (in pixels) based on input percentage value.
      double hPxlsInpVal = (hPerc / 100) * _fixedHeight;   // 'hPxlsInpVal' == Height in Pixels of Input Value.

      //* Step 4: Calculate secondary ratio-scale adjustors (in pixels) based on primary ratio-scale adjustor.
      double hPxlsStatsBar = (hPercStatsBar / 100) * hPxlsInpVal;     // 'hPxlsStatsBar' == Height in Pixels of Status Bar.
      double hPxlsRatDelta = (hPercRatioDelta / 100) * hPxlsInpVal;   // 'hPxlsRatDelta' == Height in Pixels of Ratio Delat (i.e. '_fixedHeight' vs. 'scrnHeight').

      //* Step 5: Check if '_isFullScreenApp' is true and adjust 'Status Bar' scalar accordingly.
      double hAdjStatsBarPxls = _isFullScreenApp ? 0 : hPxlsStatsBar;   // Set to 'zero' if FULL SCREEN APP !!

      //* Step 6: Finally -> Apply ratio-scales and return value to calling function / instance.
      rsHeight = McGyver.roundToDecimals(hPxlsInpVal - (hPxlsRatDelta + hAdjStatsBarPxls), decimalPlaces);

    }
    return rsHeight;
  }

  static Widget rsWidget(BuildContext context, Widget inWidget,
                    double percWidth, double percHeight, {String viewID}) {

    // ---------------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled "SizedBox" Widget - Scaling based on device's width & height.         //
    // ---------------------------------------------------------------------------------------------- //

    return SizedBox(
      width: McGyver.rsDoubleW(context, percWidth),
      height: McGyver.rsDoubleH(context, percHeight),
      child: inWidget,
    );
  }

  //* SPECIAL 'rsWidget' that has both its height & width ratio-scaled based on 'width' alone !!
  static Widget rsWidgetW(BuildContext context, Widget inWidget,
                    double percWidth, double percHeight, {String viewID}) {

    // ---------------------------------------------------------------------------------------------- //
    // INFO: Ratio-Scaled "SizedBox" Widget - Scaling based on device's width ONLY !!          //
    // ---------------------------------------------------------------------------------------------- //

    return SizedBox(
      width: McGyver.rsDoubleW(context, percWidth),
      height: McGyver.rsDoubleW(context, percHeight),
      child: inWidget,
    );
  }

  static double textSize(BuildContext context, double textSize) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (isPortrait) {
      double screenHeight = MediaQuery.of(context).size.height / 100;
      return textSize * screenHeight;
    } else {
      double screenHeight = MediaQuery.of(context).size.width / 100;
      return textSize * screenHeight;
    }
  }

}