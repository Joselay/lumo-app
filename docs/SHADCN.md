# Comprehensive Flutter Shadcn UI Documentation

Based on the official `/nank1ro/flutter-shadcn-ui` library documentation, here's a comprehensive guide covering installation, components, theming, and integration patterns.

## 1. Installation and Setup

### Basic Installation

```bash
flutter pub add shadcn_ui
```

### Basic App Setup

For a pure shadcn-ui Flutter app:

```dart
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp();
  }
}
```

## 2. Integration Patterns

### Integration with MaterialApp

```dart
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      appBuilder: (context) {
        return MaterialApp(
          theme: Theme.of(context),
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
        );
      },
    );
  }
}
```

### Integration with CupertinoApp

```dart
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadApp.custom(
      themeMode: ThemeMode.dark,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
      ),
      appBuilder: (context) {
        return CupertinoApp(
          theme: CupertinoTheme.of(context),
          localizationsDelegates: const [
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ],
          builder: (context, child) {
            return ShadAppBuilder(child: child!);
          },
        );
      },
    );
  }
}
```

## 3. Theming and Customization

### Available Color Schemes

The library supports 12 built-in color schemes:
- `blue`, `gray`, `green`, `neutral`
- `orange`, `red`, `rose`, `slate`
- `stone`, `violet`, `yellow`, `zinc`

### Basic Theme Configuration

```dart
// Define dark theme
ShadApp(
  darkTheme: ShadThemeData(
    brightness: Brightness.dark,
    colorScheme: const ShadSlateColorScheme.dark(),
  ),
  child: ...
);
```

### Dynamic Color Scheme Creation

```dart
// Available color scheme names
final shadThemeColors = [
  'blue', 'gray', 'green', 'neutral',
  'orange', 'red', 'rose', 'slate',
  'stone', 'violet', 'yellow', 'zinc',
];

// Create color schemes dynamically
final lightColorScheme = ShadColorScheme.fromName('blue');
final darkColorScheme = ShadColorScheme.fromName('slate', brightness: Brightness.dark);
```

### Override Specific Theme Properties

```dart
ShadApp(
  darkTheme: ShadThemeData(
    brightness: Brightness.dark,
    colorScheme: const ShadSlateColorScheme.dark(
      background: Colors.blue,
    ),
    primaryButtonTheme: const ShadButtonTheme(
      backgroundColor: Colors.cyan,
    ),
  ),
  child: ...
);
```

### Dynamic Theme Switching

```dart
ShadSelect<String>(
  initialValue: 'slate',
  maxHeight: 200,
  options: shadThemeColors.map(
    (option) => ShadOption(
      value: option,
      child: Text(option.capitalizeFirst()),
    ),
  ),
  selectedOptionBuilder: (context, value) {
    return Text(value.capitalizeFirst());
  },
  onChanged: (value) {
    // Rebuild the app using your state management solution
  },
)
```

### Custom Fonts

#### Using Custom Font Families

```dart
// pubspec.yaml
flutter:
  fonts:
    - family: UbuntuMono
      fonts:
        - asset: fonts/UbuntuMono-Regular.ttf
        - asset: fonts/UbuntuMono-Italic.ttf
          style: italic
        - asset: fonts/UbuntuMono-Bold.ttf
          weight: 700
```

```dart
// App configuration
ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
    textTheme: ShadTextTheme(
      colorScheme: const ShadZincColorScheme.light(),
      family: 'UbuntuMono',
    ),
  ),
);
```

#### Using Google Fonts

```dart
ShadApp(
  theme: ShadThemeData(
    brightness: Brightness.light,
    colorScheme: const ShadZincColorScheme.light(),
    textTheme: ShadTextTheme.fromGoogleFont(
      GoogleFonts.poppins,
      colorScheme: const ShadZincColorScheme.light(),
    ),
  ),
);
```

## 4. Available Components and Usage Examples

### Buttons

```dart
// Primary Button
ShadButton(
  child: const Text('Primary'),
  onPressed: () {},
)

// Secondary Button
ShadButton.secondary(
  child: const Text('Secondary'),
  onPressed: () {},
)

// Destructive Button
ShadButton.destructive(
  child: const Text('Destructive'),
  onPressed: () {},
)

// Outline Button
ShadButton.outline(
  child: const Text('Outline'),
  onPressed: () {},
)

// Ghost Button
ShadButton.ghost(
  child: const Text('Ghost'),
  onPressed: () {},
)

// Link Button
ShadButton.link(
  child: const Text('Link'),
  onPressed: () {},
)
```

### Icon Buttons

```dart
// Primary Icon Button
ShadIconButton(
  onPressed: () => print('Primary'),
  icon: const Icon(LucideIcons.rocket),
)

// Destructive Icon Button
ShadIconButton.destructive(
  icon: const Icon(LucideIcons.rocket),
  onPressed: () => print('Destructive'),
)

// With Gradient and Shadow
ShadIconButton(
  gradient: const LinearGradient(colors: [
    Colors.cyan,
    Colors.indigo,
  ]),
  shadows: [
    BoxShadow(
      color: Colors.blue.withValues(alpha: .4),
      spreadRadius: 4,
      blurRadius: 10,
      offset: const Offset(0, 2),
    ),
  ],
  icon: const Icon(LucideIcons.rocket),
)
```

### Badges

```dart
// Primary Badge
ShadBadge(
  child: const Text('Primary'),
)

// Secondary Badge
ShadBadge.secondary(
  child: const Text('Secondary'),
)

// Destructive Badge
ShadBadge.destructive(
  child: const Text('Destructive'),
)

// Outline Badge
ShadBadge.outline(
  child: const Text('Outline'),
)
```

### Avatar

```dart
ShadAvatar(
  'https://avatars.githubusercontent.com/u/124599?v=4',
  placeholder: Text('CN'),
)
```

### Card Component

```dart
const frameworks = {
  'next': 'Next.js',
  'react': 'React',
  'astro': 'Astro',
  'nuxt': 'Nuxt.js',
};

ShadCard(
  width: 350,
  title: Text('Create project', style: theme.textTheme.h4),
  description: const Text('Deploy your new project in one-click.'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ShadButton.outline(
        child: const Text('Cancel'),
        onPressed: () {},
      ),
      ShadButton(
        child: const Text('Deploy'),
        onPressed: () {},
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Name'),
        const SizedBox(height: 6),
        const ShadInput(placeholder: Text('Name of your project')),
        const SizedBox(height: 16),
        const Text('Framework'),
        const SizedBox(height: 6),
        ShadSelect<String>(
          placeholder: const Text('Select'),
          options: frameworks.entries
              .map((e) => ShadOption(value: e.key, child: Text(e.value)))
              .toList(),
          selectedOptionBuilder: (context, value) {
            return Text(frameworks[value]!);
          },
          onChanged: (value) {},
        ),
      ],
    ),
  ),
)
```

### Accordion

```dart
final details = [
  (
    title: 'Is it acceptable?',
    content: 'Yes. It adheres to the WAI-ARIA design pattern.',
  ),
  (
    title: 'Is it styled?',
    content: "Yes. It comes with default styles that matches the other components' aesthetic.",
  ),
  (
    title: 'Is it animated?',
    content: "Yes. It's animated by default, but you can disable it if you prefer.",
  ),
];

// Single Selection
ShadAccordion<({String content, String title})>(
  children: details.map(
    (detail) => ShadAccordionItem(
      value: detail,
      title: Text(detail.title),
      child: Text(detail.content),
    ),
  ),
);

// Multiple Selection
ShadAccordion<({String content, String title})>.multiple(
  children: details.map(
    (detail) => ShadAccordionItem(
      value: detail,
      title: Text(detail.title),
      child: Text(detail.content),
    ),
  ),
);
```

### Input Components

```dart
// Basic Input
const ShadInput(placeholder: Text('Name of your project'))

// Textarea
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 400),
  child: const ShadTextarea(
    placeholder: Text('Type your message here'),
  ),
)

// Textarea Form Field
ShadTextareaFormField(
  id: 'bio',
  label: const Text('Bio'),
  placeholder: const Text('Tell us a little bit about yourself'),
  description: const Text('You can @mention other users and organizations.'),
  validator: (v) {
    if (v.length < 10) {
      return 'Bio must be at least 10 characters.';
    }
    return null;
  },
)
```

### Switch Component

```dart
class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return ShadSwitch(
      value: value,
      onChanged: (v) => setState(() => value = v),
      label: const Text('Airplane Mode'),
    );
  }
}

// Switch Form Field
ShadSwitchFormField(
  id: 'terms',
  initialValue: false,
  inputLabel: const Text('I accept the terms and conditions'),
  onChanged: (v) {},
  inputSublabel: const Text('You agree to our Terms and Conditions'),
  validator: (v) {
    if (!v) {
      return 'You must accept the terms and conditions';
    }
    return null;
  },
)
```

### Select Component

```dart
final verifiedEmails = [
  'm@example.com',
  'm@google.com',
  'm@support.com',
];

// Basic Select
ShadSelect<String>(
  placeholder: const Text('Select'),
  options: frameworks.entries
      .map((e) => ShadOption(value: e.key, child: Text(e.value)))
      .toList(),
  selectedOptionBuilder: (context, value) {
    return Text(frameworks[value]!);
  },
  onChanged: (value) {},
)

// Select Form Field
ShadSelectFormField<String>(
  id: 'email',
  minWidth: 350,
  initialValue: null,
  options: verifiedEmails
      .map((email) => ShadOption(value: email, child: Text(email)))
      .toList(),
  selectedOptionBuilder: (context, value) => value == 'none'
      ? const Text('Select a verified email to display')
      : Text(value),
  placeholder: const Text('Select a verified email to display'),
  validator: (v) {
    if (v == null) {
      return 'Please select an email to display';
    }
    return null;
  },
)
```

### Tabs Component

```dart
ShadTabs<String>(
  value: 'account',
  tabBarConstraints: const BoxConstraints(maxWidth: 400),
  contentConstraints: const BoxConstraints(maxWidth: 400),
  tabs: [
    ShadTab(
      value: 'account',
      content: ShadCard(
        title: const Text('Account'),
        description: const Text("Make changes to your account here."),
        footer: const ShadButton(child: Text('Save changes')),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ShadInputFormField(
              label: const Text('Name'),
              initialValue: 'Ale',
            ),
            const SizedBox(height: 8),
            ShadInputFormField(
              label: const Text('Username'),
              initialValue: 'nank1ro',
            ),
          ],
        ),
      ),
      child: const Text('Account'),
    ),
    ShadTab(
      value: 'password',
      content: ShadCard(
        title: const Text('Password'),
        description: const Text("Change your password here."),
        footer: const ShadButton(child: Text('Save password')),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ShadInputFormField(
              label: const Text('Current password'),
              obscureText: true,
            ),
            const SizedBox(height: 8),
            ShadInputFormField(
              label: const Text('New password'),
              obscureText: true,
            ),
          ],
        ),
      ),
      child: const Text('Password'),
    ),
  ],
)
```

### Dialog Component

```dart
ShadButton.outline(
  child: const Text('Edit Profile'),
  onPressed: () {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text('Edit Profile'),
        description: const Text("Make changes to your profile here."),
        actions: const [ShadButton(child: Text('Save changes'))],
        child: Container(
          width: 375,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text('Name', textAlign: TextAlign.end),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: ShadInput(initialValue: 'Alexandru'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  },
)
```

### Sheet Component

```dart
ShadButton.outline(
  child: const Text('Open'),
  onPressed: () => showShadSheet(
    side: ShadSheetSide.right,
    context: context,
    builder: (context) => const EditProfileSheet(),
  ),
)

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: const BoxConstraints(maxWidth: 512),
      title: const Text('Edit Profile'),
      description: const Text("Make changes to your profile here."),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Row(
              children: [
                Expanded(child: Text('Name', textAlign: TextAlign.end)),
                const SizedBox(width: 16),
                Expanded(flex: 5, child: ShadInput(initialValue: 'Alexandru')),
              ],
            ),
          ],
        ),
      ),
      actions: const [
        ShadButton(child: Text('Save changes')),
      ],
    );
  }
}
```

### Date Picker

```dart
// Basic Date Picker
ShadDatePicker(
  selected: selected,
  onChanged: (date) => setState(() => selected = date),
)

// Date Picker with Presets
const presets = {
  0: 'Today',
  1: 'Tomorrow',
  3: 'In 3 days',
  7: 'In a week',
};

ShadDatePicker(
  groupId: groupId,
  header: ShadSelect<int>(
    groupId: groupId,
    minWidth: 276,
    placeholder: const Text('Select'),
    options: presets.entries
        .map((e) => ShadOption(value: e.key, child: Text(e.value)))
        .toList(),
    selectedOptionBuilder: (context, value) => Text(presets[value]!),
    onChanged: (value) {
      if (value == null) return;
      setState(() {
        selected = today.add(Duration(days: value));
      });
    },
  ),
  selected: selected,
)
```

### Calendar Component

```dart
// Basic Calendar
ShadCalendar(
  selected: selected,
  onChanged: (date) => setState(() => selected = date),
)

// Calendar with Dropdown Navigation
ShadCalendar(
  captionLayout: ShadCalendarCaptionLayout.dropdownMonths,
)

ShadCalendar(
  captionLayout: ShadCalendarCaptionLayout.dropdownYears,
)
```

### Separator

```dart
// Horizontal Separator
const ShadSeparator.horizontal(
  thickness: 4,
  margin: EdgeInsets.symmetric(horizontal: 20),
  radius: BorderRadius.all(Radius.circular(4)),
)

// Vertical Separator
const ShadSeparator.vertical(
  thickness: 4,
  margin: EdgeInsets.symmetric(vertical: 20),
  radius: BorderRadius.all(Radius.circular(4)),
)
```

### Table Component

```dart
ShadTable.list(
  header: const [
    ShadTableCell.header(child: Text('Invoice')),
    ShadTableCell.header(child: Text('Status')),
    ShadTableCell.header(child: Text('Method')),
    ShadTableCell.header(
      alignment: Alignment.centerRight,
      child: Text('Amount'),
    ),
  ],
  footer: const [
    ShadTableCell.footer(child: Text('Total')),
    ShadTableCell.footer(child: Text('')),
    ShadTableCell.footer(child: Text('')),
    ShadTableCell.footer(
      alignment: Alignment.centerRight,
      child: Text(r'$2500.00'),
    ),
  ],
  children: invoices.map(
    (invoice) => [
      ShadTableCell(child: Text(invoice.invoice)),
      ShadTableCell(child: Text(invoice.paymentStatus)),
      ShadTableCell(child: Text(invoice.paymentMethod)),
      ShadTableCell(
        alignment: Alignment.centerRight,
        child: Text(invoice.totalAmount),
      ),
    ],
  ),
)
```

### Popover Component

```dart
class PopoverPage extends StatefulWidget {
  @override
  State<PopoverPage> createState() => _PopoverPageState();
}

class _PopoverPageState extends State<PopoverPage> {
  final popoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    return ShadPopover(
      controller: popoverController,
      popover: (context) => SizedBox(
        width: 288,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Dimensions', style: textTheme.h4),
            Text('Set the dimensions for the layer.'),
            ...layer.map((e) => Row(
              children: [
                Expanded(child: Text(e.name)),
                Expanded(
                  flex: 2,
                  child: ShadInput(initialValue: e.initialValue),
                )
              ],
            )),
          ],
        ),
      ),
      child: ShadButton.outline(
        onPressed: popoverController.toggle,
        child: const Text('Open popover'),
      ),
    );
  }
}
```

### Menubar Component

```dart
ShadMenubar(
  items: [
    ShadMenubarItem(
      items: [
        const ShadContextMenuItem(child: Text('New Tab')),
        const ShadContextMenuItem(child: Text('New Window')),
        const ShadContextMenuItem(
          enabled: false,
          child: Text('New Incognito Window'),
        ),
        ShadSeparator.horizontal(margin: const EdgeInsets.symmetric(vertical: 4)),
        const ShadContextMenuItem(
          trailing: Icon(LucideIcons.chevronRight),
          items: [
            ShadContextMenuItem(child: Text('Email Link')),
            ShadContextMenuItem(child: Text('Messages')),
          ],
          child: Text('Share'),
        ),
      ],
      child: const Text('File'),
    ),
  ],
)
```

## 5. Typography System

The library provides a comprehensive typography system:

```dart
// Heading Styles
Text('Large Heading', style: ShadTheme.of(context).textTheme.h1Large)
Text('Primary Heading', style: ShadTheme.of(context).textTheme.h1)
Text('Secondary Heading', style: ShadTheme.of(context).textTheme.h2)
Text('Tertiary Heading', style: ShadTheme.of(context).textTheme.h3)
Text('Fourth Heading', style: ShadTheme.of(context).textTheme.h4)

// Body Text Styles
Text('Paragraph Text', style: ShadTheme.of(context).textTheme.p)
Text('Lead Text', style: ShadTheme.of(context).textTheme.lead)
Text('Large Text', style: ShadTheme.of(context).textTheme.large)

// Utility Styles
Text('Small Text', style: ShadTheme.of(context).textTheme.small)
Text('Muted Text', style: ShadTheme.of(context).textTheme.muted)
Text('List Item', style: ShadTheme.of(context).textTheme.list)
Text('Table Content', style: ShadTheme.of(context).textTheme.table)
```

## 6. Icons

The library integrates with Lucide Icons:

```dart
// Using Lucide Icons
Icon(LucideIcons.activity)
Icon(LucideIcons.rocket)
Icon(LucideIcons.chevronRight)
Icon(LucideIcons.check)
```

## 7. Responsive Design

```dart
// Configure breakpoints
ShadThemeData(
  breakpoints: ShadBreakpoints(
    tn: 0,    // tiny
    sm: 640,  // small
    md: 768,  // medium
    lg: 1024, // large
    xl: 1280, // extra large
    xxl: 1536, // extra extra large
  ),
)
```

## 8. Form Integration

The library provides comprehensive form support with validation:

```dart
// Form Fields with Validation
ShadInputFormField(
  label: const Text('Name'),
  initialValue: 'Ale',
  validator: (value) {
    if (value.isEmpty) return 'Name is required';
    return null;
  },
)

ShadSelectFormField<String>(
  id: 'email',
  options: emails.map((email) => ShadOption(value: email, child: Text(email))).toList(),
  validator: (v) {
    if (v == null) return 'Please select an email';
    return null;
  },
)

ShadSwitchFormField(
  id: 'terms',
  inputLabel: const Text('I accept the terms and conditions'),
  validator: (v) {
    if (!v) return 'You must accept the terms and conditions';
    return null;
  },
)
```

This comprehensive documentation covers all major aspects of the flutter-shadcn-ui library. The library provides a complete UI toolkit with consistent theming, comprehensive components, and excellent integration patterns for Flutter apps. All components follow accessibility guidelines (WAI-ARIA) and include proper form integration with validation support.