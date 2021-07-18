import 'package:flutter/material.dart';
import 'package:flutter_template/model/fish_filter.dart';

class FishFilterDialog extends StatefulWidget {
  final FishFilter filter;

  const FishFilterDialog(this.filter);

  @override
  _FishFilterDialogState createState() => _FishFilterDialogState();
}

class _FishFilterDialogState extends State<FishFilterDialog> {
  late FishFilter _filter;

  @override
  void initState() {
    super.initState();

    _filter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        children: [
          _buildHeader(),
          const Divider(),
          const SizedBox(height: 12),
          _buildCaughtFilter(),
          const SizedBox(height: 12),
          _buildDonatedFilter(),
          const SizedBox(height: 12),
          _buildButtonBar(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      "Filter",
      style: TextStyle(
        fontSize: 32,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildCaughtFilter() {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          const Expanded(
            child: Text("Caught"),
          ),
          Expanded(
            flex: 3,
            child: ToggleButtons(
              isSelected: _filter.showCaught,
              onPressed: (index) {
                final showCaught = [..._filter.showCaught];
                showCaught[index] = !showCaught[index];

                setState(
                  () => _filter = _filter.copyWith(showCaught: showCaught),
                );
              },
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Caught"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Uncaught"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDonatedFilter() {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          const Expanded(
            child: Text("Donated"),
          ),
          Expanded(
            flex: 3,
            child: ToggleButtons(
              isSelected: _filter.showDonated,
              onPressed: (index) {
                final showDonated = [..._filter.showDonated];
                showDonated[index] = !showDonated[index];

                setState(
                  () => _filter = _filter.copyWith(showDonated: showDonated),
                );
              },
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Donated"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Not Donated"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(_filter);
          },
          child: const Text("Apply"),
        ),
      ],
    );
  }
}
