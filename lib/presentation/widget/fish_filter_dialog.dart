import 'package:flutter/material.dart';
import 'package:flutter_template/constant/enum/hemisphere_enum.dart';
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
        physics: const ClampingScrollPhysics(),
        children: [
          _buildHeader(),
          const Divider(),
          const SizedBox(height: 12),
          _buildHemispherePicker(),
          const SizedBox(height: 12),
          _buildCaughtFilter(),
          const SizedBox(height: 12),
          _buildDonatedFilter(),
          const SizedBox(height: 12),
          _buildHideAllYear(),
          const SizedBox(height: 12),
          _buildHideAllDay(),
          const SizedBox(height: 12),
          _buildShowOnlyNow(),
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

  Widget _buildHemispherePicker() {
    return SizedBox(
      height: 36,
      child: Row(
        children: [
          const Text("Hemisphere"),
          const SizedBox(width: 12),
          Expanded(
            child: DropdownButton<HemisphereEnum>(
              value: _filter.hemisphere,
              onChanged: (value) {
                setState(() => _filter = _filter.copyWith(hemisphere: value));
              },
              items: HemisphereEnum.values.map((hemisphere) {
                return DropdownMenuItem<HemisphereEnum>(
                  value: hemisphere,
                  child: Text(hemisphere.rawValue),
                );
              }).toList(),
            ),
          ),
        ],
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
          ),
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
          ),
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

  Widget _buildHideAllYear() {
    return Row(
      children: [
        const Expanded(
          child: Text("Hide All Year"),
        ),
        Expanded(
          child: Checkbox(
            value: _filter.hideAllYear,
            onChanged: (value) {
              setState(
                () => _filter = _filter.copyWith(hideAllYear: value),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHideAllDay() {
    return Row(
      children: [
        const Expanded(
          child: Text("Hide All Day"),
        ),
        Expanded(
          child: Checkbox(
            value: _filter.hideAllDay,
            onChanged: (value) {
              setState(
                () => _filter = _filter.copyWith(hideAllDay: value),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildShowOnlyNow() {
    return Row(
      children: [
        const Expanded(
          child: Text("Show Only Now"),
        ),
        Expanded(
          child: Checkbox(
            value: _filter.showOnlyNow,
            onChanged: (value) {
              setState(
                () => _filter = _filter.copyWith(showOnlyNow: value),
              );
            },
          ),
        ),
      ],
    );
  }
}
