import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../../../../widgets/alert_dialogs.dart';
import '../../../../widgets/primary_button.dart';
import '../../domain/review.dart';

class LeaveReviewFormField extends StatefulWidget {
  const LeaveReviewFormField({
    super.key,
    required this.productId,
    this.review,
  });

  final String productId;
  final Review? review;

  static const reviewCommentKey = Key('reviewComment');
  @override
  State<LeaveReviewFormField> createState() => _LeaveReviewFormFieldState();
}

class _LeaveReviewFormFieldState extends State<LeaveReviewFormField> {
  final _controller = TextEditingController();
  double _rating = 0;
  @override
  void initState() {
    super.initState();
    final review = widget.review;
    if (review != null) {
      _controller.text = review.comment;
      _rating = review.score;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    await showNotImplementedAlertDialog(context: context);
    // only submit if new rating or different from before
    final previousReview = widget.review;
    if (previousReview == null ||
        _rating != previousReview.score ||
        _controller.text != previousReview.comment) {
      // TODO: Submit review
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.review != null) ...[
          Text(
            'You reviewed this product before. Submit again to edit.'.hardcoded,
            textAlign: TextAlign.center,
          ),
          gapH24,
        ],
        Center(
          child: ProductRatingBar(
            initialRating: _rating,
            onRatingUpdate: (rating) => setState(() => _rating = rating),
          ),
        ),
        gapH32,
        TextField(
          key: LeaveReviewFormField.reviewCommentKey,
          controller: _controller,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 5,
          decoration: const InputDecoration(
            labelText: 'Your review (optional)',
            border: OutlineInputBorder(),
          ),
        ),
        gapH32,
        PrimaryButton(
          text: 'Submit',
          // TODO: Loading state
          isLoading: false,
          onPressed: _rating == 0 ? null : _submitReview,
        )
      ],
    );
  }
}
