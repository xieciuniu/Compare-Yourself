# Compare Yourself — Design System Setup

## What's in this package

```
DesignSystem/
├── swiftgen.yml                          # SwiftGen config — run once to generate Colors.swift
├── Resources/
│   └── Colors.xcassets/                  # Xcode asset catalog — drag into your project
│       ├── Brand/          (4 colors)    # Energy, Progress, Achievement, Alert
│       ├── Background/     (4 colors)    # Base, Elevated, Surface, Overlay
│       ├── Text/           (3 colors)    # Primary, Secondary, Tertiary
│       └── Border/         (3 colors)    # Subtle, Default, Emphasis
└── Sources/DesignSystem/
    ├── DesignTokens.swift                # Spacing, Typography, CornerRadius, Animation, PinState
    ├── Color+Theme.swift                 # Color extensions + View modifiers + Shape aliases
    └── Components.swift                  # Reusable SwiftUI components
```

---

## 1. Add the asset catalog to Xcode

Drag `Resources/Colors.xcassets` into your Xcode project navigator.
If you already have an `Assets.xcassets`, you can either:
- Merge the color folders into it, or
- Keep `Colors.xcassets` as a separate catalog (both work fine)

---

## 2. Install SwiftGen

```bash
brew install swiftgen
```

Or add it as a Swift Package (see swiftgen.github.io for SPM setup).

---

## 3. Run SwiftGen

From the project root (same folder as `swiftgen.yml`):

```bash
swiftgen
```

This generates `Generated/Colors.swift` with type-safe accessors like:
```swift
Asset.Brand.colorEnergy.color       // → UIColor
Color(Asset.Brand.colorEnergy)      // → SwiftUI Color
```

---

## 4. Add the Swift source files

Drag into your Xcode target (ensure "Add to target" is checked):
- `Sources/DesignSystem/DesignTokens.swift`
- `Sources/DesignSystem/Color+Theme.swift`
- `Sources/DesignSystem/Components.swift`
- `Generated/Colors.swift` (after running SwiftGen)

---

## 5. Add SwiftGen as a build phase (optional but recommended)

In Xcode → your target → Build Phases → "+" → New Run Script Phase:

```bash
if which swiftgen > /dev/null; then
  swiftgen
else
  echo "warning: SwiftGen not installed, download from https://github.com/SwiftGen/SwiftGen"
fi
```

Move it **above** "Compile Sources" so colors are regenerated before compilation.

---

## Usage examples

### Colors

```swift
// In any SwiftUI view
Text("38.5 cm")
    .foregroundStyle(Color.progress)          // #00CFA4

Rectangle()
    .fill(Color.backgroundElevated)           // #161819 dark / #FFFFFF light

RoundedRectangle(cornerRadius: CornerRadius.lg)
    .stroke(Color.borderDefault, lineWidth: 0.5)
```

### Typography

```swift
Text("Right Bicep — Flexed")
    .font(Typography.headline)               // 17pt Semibold SF Pro

Text("38.5 cm")
    .font(Typography.dataBody)               // 16pt SF Mono

Text("3 days ago")
    .font(Typography.caption)               // 12pt Regular
```

### Spacing

```swift
VStack(spacing: Spacing.sm) { ... }         // 8pt
.padding(.horizontal, Spacing.screenHorizontal)  // 16pt
.padding(Spacing.md)                        // 16pt
```

### Cards

```swift
VStack { ... }
    .cardStyle()                             // backgroundElevated + cornerLG + borderDefault stroke
```

### Components

```swift
// Primary CTA
PrimaryButton("Add measurement", icon: "ruler") {
    // action
}

// Stat row
HStack(spacing: Spacing.chipGap) {
    StatChip(value: "38.5", label: "Latest (cm)")
    StatChip(value: "+2.1", label: "Total gain", valueColor: .progress)
    StatChip(value: "39.0", label: "Best (cm)",  valueColor: .achievement)
    StatChip(value: "12",   label: "Entries")
}

// Pin on body diagram
PinView(state: .recent)

// Settings row
SettingsRow(icon: "ruler", iconBackground: IconSquareColor.units, label: "Measurement units") {
    // trailing content (toggle, picker, chevron...)
}

// Measurement list entry
MeasurementRow(
    name: "Waist at Navel",
    date: "Today, 9:12 AM",
    value: "84.2 cm",
    delta: "−0.8 cm"
)
```

### Pin state

```swift
let state = PinState.from(daysSinceLastMeasurement: 3)  // → .recent
let noMeasurements = PinState.from(daysSinceLastMeasurement: nil)  // → .new
```

---

## Color token reference

| Token | Dark | Light | Usage |
|---|---|---|---|
| `Color.energy` | #FF6534 | #FF6534 | Primary CTAs, tab active |
| `Color.progress` | #00CFA4 | #00CFA4 | Charts, positive data |
| `Color.achievement` | #F5A623 | #F5A623 | Badges, 30-day pins |
| `Color.alert` | #FF4D6D | #FF4D6D | Stale pins, warnings |
| `Color.backgroundBase` | #0C0D0F | #F5F5F7 | App background |
| `Color.backgroundElevated` | #161819 | #FFFFFF | Cards, sheets |
| `Color.backgroundSurface` | #1F2126 | #F0F1F3 | Chips, inputs |
| `Color.backgroundOverlay` | #272B33 | #E8E9EC | Modals, overlays |
| `Color.textPrimary` | #F2F3F5 | #0C0D0F | Titles, values |
| `Color.textSecondary` | #8B909C | #5A5F6B | Subtitles, dates |
| `Color.textTertiary` | #4B505E | #9A9FA8 | Disabled, hints |

---

## Spacing token reference

| Token | Value | Usage |
|---|---|---|
| `Spacing.xs` | 4pt | Icon gaps |
| `Spacing.sm` | 8pt | Compact padding |
| `Spacing.md` | 16pt | Standard padding |
| `Spacing.lg` | 24pt | Section gaps |
| `Spacing.xl` | 32pt | Major sections |
| `Spacing.xxl` | 48pt | Hero sections |
| `Spacing.screenHorizontal` | 16pt | Screen margins |
| `Spacing.cardGap` | 12pt | Between cards |

---

## Corner radius reference

| Token | Value | Usage |
|---|---|---|
| `CornerRadius.sm` | 6pt | Badges |
| `CornerRadius.md` | 10pt | Buttons, chips |
| `CornerRadius.lg` | 14pt | Cards (default) |
| `CornerRadius.xl` | 20pt | Hero cards |
| `CornerRadius.full` | 9999pt | Pill shapes |
