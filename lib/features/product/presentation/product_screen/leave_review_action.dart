import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/size.dart';
import '../../../../utils/date_formatter.dart';
import '../../../../widgets/custom_text_button.dart';
import '../../../../widgets/responsive_two_column_widget.dart';
import '../../../order/domain/purchase.dart';

/// Simple widget to show the product purchase date along with a button to
/// leave a review.
class LeaveReviewAction extends ConsumerWidget {
  const LeaveReviewAction({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: Read from data source
    final purchase = Purchase(orderId: 'abc', orderDate: DateTime.now());
    if (purchase != null) {
      final dateFormatted =
          ref.watch(dateFormatterProvider).format(purchase.orderDate);
      return Column(
        children: [
          const Divider(),
          gapH8,
          ResponsiveTwoColumnLayout(
            spacing: Sizes.p16,
            breakpoint: 300,
            startFlex: 3,
            endFlex: 2,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            startContent: Text('Purchased on $dateFormatted'),
            endContent: CustomTextButton(
              text: 'Leave a review',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.green[700]),
              onPressed: () => context.goNamed(
                AppRoute.leaveReview.name,
                params: {'id': productId},
              ),
            ),
            columnMainAxisAlignment: null,
          ),
          gapH8,
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
