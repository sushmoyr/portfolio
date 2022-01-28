import 'package:flutter/material.dart';

/// Widget that resize text automatically based on given text box area.
/// Text will be resized under following conditions
/// * When given [text] width is greater than the [textBoxWidth]
/// * When given [text] height is greater than the [textBoxHeight]
/// * When given [text] line count is greater than [maxLines]
class AutoReSizeText extends StatelessWidget {
  /// Creates a Text widget that automatically resizes itself by adjusting
  /// fontSize
  /// The positional argument [text] is a required argument. The value of the
  /// text argument will be displayed.
  /// [style] is the style that the text will follow. Only the
  /// fontSize is changed and other styles are remained intact.
  /// [maxLines] The maximum number of lines that the text can have
  /// [textBoxWidth] is the width of the text. If null, the widget will take all
  /// the available width.
  /// [textBoxHeight] is the height of the text. If null, the widget will take
  /// all the available height
  const AutoReSizeText(this.text,
      {Key? key,
      this.style = const TextStyle(fontSize: 14),
      this.maxLines = 1,
      this.textBoxHeight,
      this.textBoxWidth,
      this.resizeBehaviour = AutoResizeTextSizeBehaviour.fit})
      : super(key: key);

  final double? textBoxWidth;
  final double? textBoxHeight;
  final int maxLines;
  final TextStyle style;
  final String text;
  final AutoResizeTextSizeBehaviour resizeBehaviour;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double layoutWidth = textBoxWidth ?? constraints.maxWidth;

      double fontSize = style.fontSize ?? 14;

      TextConfiguration configuration = _textConfiguration(
        style: style,
        fontSize: fontSize,
        boxWidth: layoutWidth,
      );

      //Perform Resize
      //Check if width extends layout width
      if (configuration.textWidth > layoutWidth) {
        //Perform Resize in terms of width
        while (configuration.textWidth > layoutWidth) {
          fontSize = fontSize - 1;
          configuration = _textConfiguration(
            style: style,
            fontSize: fontSize,
            boxWidth: layoutWidth,
          );
        }
      }

      //Check line
      if (configuration.lines != maxLines) {
        while (configuration.lines != maxLines) {
          if (configuration.lines > maxLines) {
            fontSize = fontSize - 1;
          } else if (configuration.lines < maxLines) {
            fontSize = fontSize + 1;
          }

          configuration = _textConfiguration(
            style: style,
            fontSize: fontSize,
            boxWidth: layoutWidth,
          );
        }
      }

      double layoutHeight = textBoxHeight ?? constraints.maxHeight;

      if (configuration.textHeight > layoutHeight) {
        //Perform Resize in terms of width
        while (configuration.textHeight > layoutHeight) {
          fontSize = fontSize - 1;
          configuration = _textConfiguration(
            style: style,
            fontSize: fontSize,
            boxWidth: layoutWidth,
          );
        }
      }

      if (resizeBehaviour == AutoResizeTextSizeBehaviour.fill) {
        if (maxLines == configuration.lines) {
          while (true) {
            configuration = _textConfiguration(
              style: style,
              fontSize: fontSize + 1,
              boxWidth: layoutWidth,
            );

            if (configuration.lines == maxLines) {
              fontSize = fontSize + 1;
            } else {
              fontSize = fontSize - 1;
              break;
            }
          }
        }

        if (configuration.textHeight > layoutHeight) {
          while (configuration.textHeight > layoutHeight) {
            fontSize = fontSize - 1;
            configuration = _textConfiguration(
              style: style,
              fontSize: fontSize + 1,
              boxWidth: layoutWidth,
            );
          }
        }
      }

      return Text(
        text,
        maxLines: maxLines,
        style: style.copyWith(fontSize: fontSize),
      );
    });
  }

  TextConfiguration _textConfiguration(
      {required TextStyle style,
      required double fontSize,
      required double boxWidth}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(fontSize: fontSize),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    double textWidth = textPainter.size.width;
    double textHeight = textPainter.size.height;
    double lineNo = (textPainter.size.width / boxWidth);
    final countLines = lineNo.ceil();
    final height = countLines * textHeight;

    return TextConfiguration(
      textWidth: textWidth,
      textHeight: height,
      lines: countLines,
    );
  }
}

class TextConfiguration {
  double textWidth;
  double textHeight;
  int lines;

  TextConfiguration({
    required this.textWidth,
    required this.textHeight,
    required this.lines,
  });
}

enum AutoResizeTextSizeBehaviour { fill, fit }
