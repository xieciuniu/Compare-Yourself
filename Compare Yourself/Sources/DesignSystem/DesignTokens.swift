// ─────────────────────────────────────────────────────────────────────────────
// DesignTokens.swift — Compare Yourself
// All non-color design tokens: spacing, typography, corner radius, animation.
// Source of truth — matches Design.md.
// ─────────────────────────────────────────────────────────────────────────────

import SwiftUI

// MARK: - Spacing

/// 8-point grid. Use these tokens exclusively — never hardcode spacing values.
enum Spacing {
    /// 4pt — icon-to-label gaps, very tight internal padding
    static let xs:  CGFloat = 4
    /// 8pt — internal padding in compact components, between related elements
    static let sm:  CGFloat = 8
    /// 16pt — standard horizontal padding, card internal padding
    static let md:  CGFloat = 16
    /// 24pt — section spacing, generous card padding
    static let lg:  CGFloat = 24
    /// 32pt — between major sections, generous vertical rhythm
    static let xl:  CGFloat = 32
    /// 48pt — hero sections, large empty-state illustrations
    static let xxl: CGFloat = 48

    /// Horizontal screen margin (16pt — matches Apple HIG)
    static let screenHorizontal: CGFloat = 16

    /// Standard gap between cards in a list
    static let cardGap: CGFloat = 12

    /// Gap between stat chips
    static let chipGap: CGFloat = 8
}

// MARK: - Corner Radius

enum CornerRadius {
    /// 6pt — small badges, tags, tiny chips
    static let sm:   CGFloat = 6
    /// 10pt — buttons, input fields, small cards
    static let md:   CGFloat = 10
    /// 14pt — standard cards, sheets, list cells (default)
    static let lg:   CGFloat = 14
    /// 20pt — large hero cards, modals
    static let xl:   CGFloat = 20
    /// 9999pt — pill-shaped elements
    static let full: CGFloat = 9999
}

// MARK: - Typography

/// Type scale based on SF Pro (system font).
/// Always use these — never hardcode font sizes.
enum Typography {
    // ── Display ──────────────────────────────────────────────────────────────
    /// 34pt Heavy — onboarding hero, empty state headlines
    static let display = Font.system(size: 34, weight: .heavy, design: .default)

    // ── Titles ────────────────────────────────────────────────────────────────
    /// 28pt Bold — screen titles, diagram section headers
    static let title1 = Font.system(size: 28, weight: .bold, design: .default)
    /// 22pt Bold — card titles, measurement point names
    static let title2 = Font.system(size: 22, weight: .bold, design: .default)
    /// 20pt Semibold — section headers within screens
    static let title3 = Font.system(size: 20, weight: .semibold, design: .default)

    // ── Body family ───────────────────────────────────────────────────────────
    /// 17pt Semibold — list item names, form labels
    static let headline = Font.system(size: 17, weight: .semibold, design: .default)
    /// 17pt Regular — descriptions, notes, general content
    static let body = Font.system(size: 17, weight: .regular, design: .default)
    /// 16pt Regular — secondary body text
    static let callout = Font.system(size: 16, weight: .regular, design: .default)
    /// 15pt Regular — supporting text, sub-labels
    static let subheadline = Font.system(size: 15, weight: .regular, design: .default)

    // ── Small ─────────────────────────────────────────────────────────────────
    /// 13pt Regular — metadata, dates, footnotes
    static let footnote = Font.system(size: 13, weight: .regular, design: .default)
    /// 12pt Regular — timestamps, chart axis labels
    static let caption = Font.system(size: 12, weight: .regular, design: .default)
    /// 11pt Regular — badges, status pills, very small labels
    static let caption2 = Font.system(size: 11, weight: .regular, design: .default)

    // ── Monospaced (data values) ───────────────────────────────────────────────
    /// 20pt Medium Mono — large measurement display values
    static let dataLarge = Font.system(size: 20, weight: .medium, design: .monospaced)
    /// 18pt Medium Mono — stat chip values
    static let dataMedium = Font.system(size: 18, weight: .medium, design: .monospaced)
    /// 16pt Regular Mono — inline measurement values in lists
    static let dataBody = Font.system(size: 16, weight: .regular, design: .monospaced)
    /// 14pt Regular Mono — chart axis labels, compact data
    static let dataSmall = Font.system(size: 14, weight: .regular, design: .monospaced)
    /// 12pt Regular Mono — delta badges, caption-sized data
    static let dataCaption = Font.system(size: 12, weight: .regular, design: .monospaced)
}

// MARK: - Animation

/// Spring and easing tokens. Prefer these over inline .animation() values.
enum Animation {
    /// General UI transitions, card appearances
    static let `default` = SwiftUI.Animation.spring(response: 0.35, dampingFraction: 0.75)
    /// Button taps, tab switches, quick feedback
    static let snappy = SwiftUI.Animation.spring(response: 0.25, dampingFraction: 0.8)
    /// Chart data updates, opacity fades
    static let gentle = SwiftUI.Animation.easeInOut(duration: 0.4)
    /// Recent pin pulse — repeats indefinitely
    static let pulse = SwiftUI.Animation.easeInOut(duration: 1.4).repeatForever(autoreverses: true)
    /// Chart line draw-on entry
    static let chartReveal = SwiftUI.Animation.easeOut(duration: 0.6)
}

// MARK: - Pin States

/// Visual state of a measurement point pin on the body diagram.
enum PinState: Equatable {
    /// No measurements recorded yet
    case new
    /// Measured within the last 7 days
    case recent
    /// Measured within the last 30 days
    case active
    /// Last measurement was over 30 days ago
    case stale

    /// Derive state from days since last measurement.
    /// Pass `nil` if there are no measurements.
    static func from(daysSinceLastMeasurement days: Int?) -> PinState {
        guard let days else { return .new }
        switch days {
        case 0...7:   return .recent
        case 8...30:  return .active
        default:      return .stale
        }
    }

    var fillColor: Color {
        switch self {
        case .new:    return .clear
        case .recent: return Color("Brand/ColorProgress")
        case .active: return Color("Brand/ColorAchievement")
        case .stale:  return Color("Brand/ColorAlert")
        }
    }

    var borderColor: Color {
        switch self {
        case .new:    return Color("Text/TextTertiary")
        case .recent: return .clear
        case .active: return .clear
        case .stale:  return .clear
        }
    }

    var borderWidth: CGFloat {
        self == .new ? 1.5 : 0
    }

    var opacity: Double {
        self == .stale ? 0.55 : 1.0
    }

    var shouldPulse: Bool {
        self == .recent
    }

    var label: String {
        switch self {
        case .new:    return "New"
        case .recent: return "Recent"
        case .active: return "Active"
        case .stale:  return "Stale"
        }
    }
}

// MARK: - Icon Squares (Settings rows)

/// Tinted 32pt rounded-square backgrounds for settings row icons.
/// Each category has a distinct dark-tinted color.
enum IconSquareColor {
    static let units:   Color = Color(red: 0.122, green: 0.227, blue: 0.180) // dark green
    static let sync:    Color = Color(red: 0.102, green: 0.165, blue: 0.243) // dark blue
    static let export:  Color = Color(red: 0.165, green: 0.165, blue: 0.102) // dark amber
    static let about:   Color = Color(red: 0.165, green: 0.102, blue: 0.165) // dark purple
    static let version: Color = Color(red: 0.102, green: 0.122, blue: 0.165) // dark slate
    static let privacy: Color = Color(red: 0.102, green: 0.141, blue: 0.125) // dark teal
    static let danger:  Color = Color(red: 0.165, green: 0.102, blue: 0.102) // dark red
}
