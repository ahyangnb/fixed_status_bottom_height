# Readme
Get the persistent bottom status padding height.

# Use case.

### Step 1
config the FixedStatusBottomHeight to MaterialApp
```dart
MaterialApp.router(
  routerConfig: goRouter,
  title: AppConfig.appName,
  builder: (BuildContext context, Widget? child) {
    return Stack(
      children: [
        child ?? Container(),
        const FixedStatusBottomHeight(),
      ],
    );
  },
  theme: AppTheme.theme(),
);
```
the FixedStatusBottomHeight is empty content so will not affect the app content.

### Step 2
use the `FixedStatusBottomHeight.maxBottomPaddingHeight` to get the padding bottom height.
```dart
          ValueListenableBuilder<double>(
              valueListenable: FixedStatusBottomHeight.maxBottomPaddingHeight,
              builder: (BuildContext context, double maxBottomPaddingHeight,
                  Widget? child) {
                return SizedBox(height: maxBottomPaddingHeight);
              })
```