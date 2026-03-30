// ─────────────────────────────────────────────────────────────────────────────
// Color+Theme.swift — Compare Yourself
// Semantic Color extensions on top of the SwiftGen-generated Asset enum.
// After running `swiftgen`, import this file and use Color.energy etc.
// everywhere — never access Asset.* directly in views.
// ─────────────────────────────────────────────────────────────────────────────

import SwiftUI

extension Color {

    // MARK: - Brand

    /// #FF6534 — primary CTAs, tab bar active state, body outline accents
    static let energy      = Color("Brand/ColorEnergy")
    /// #00CFA4 — positive data, charts, improvement indicators, recent pin
    static let progress    = Color("Brand/ColorProgress")
    /// #F5A623 — badges, streak highlights, 30-day active pin
    static let achievement = Color("Brand/ColorAchievement")
    /// #FF4D6D — stale pins, destructive actions, warnings
    static let alert       = Color("Brand/ColorAlert")

    // MARK: - Backgrounds

    /// App window background (dark: #0C0D0F / light: #F5F5F7)
    static let backgroundBase     = Color("Background/BackgroundBase")
    /// Cards, sheets, list rows (dark: #161819 / light: #FFFFFF)
    static let backgroundElevated = Color("Background/BackgroundElevated")
    /// Secondary surfaces, input backgrounds, stat chips (dark: #1F2126 / light: #F0F1F3)
    static let backgroundSurface  = Color("Background/BackgroundSurface")
    /// Modal backgrounds, overlays, action sheets (dark: #272B33 / light: #E8E9EC)
    static let backgroundOverlay  = Color("Background/BackgroundOverlay")

    // MARK: - Text

    /// Primary labels, titles, measurement values (dark: #F2F3F5 / light: #0C0D0F)
    static let textPrimary   = Color("Text/TextPrimary")
    /// Subtitles, dates, metadata (dark: #8B909C / light: #5A5F6B)
    static let textSecondary = Color("Text/TextSecondary")
    /// Disabled states, very muted hints (dark: #4B505E / light: #9A9FA8)
    static let textTertiary  = Color("Text/TextTertiary")

    // MARK: - Borders

    /// List separators, card inner dividers — use .opacity() for alpha control
    static let borderSubtle   = Color("Border/BorderSubtle")
    /// Card borders, input borders at rest
    static let borderDefault  = Color("Border/BorderDefault")
    /// Focused inputs, selected states
    static let borderEmphasis = Color("Border/BorderEmphasis")
}

// MARK: - View Modifiers

extension View {

    /// Applies the standard card styling: BackgroundElevated + cornerRadius(lg) + borderDefault stroke.
    func cardStyle() -> some View {
        self
            .background(Color.backgroundElevated)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.lg))
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.lg)
                    .stroke(Color.borderDefault, lineWidth: 0.5)
            )
    }

    /// Applies standard screen horizontal padding (16pt each side).
    func screenPadding() -> some View {
        self.padding(.horizontal, Spacing.screenHorizontal)
    }

    /// Section label style — all-caps, letter-spaced, secondary color.
    func sectionLabelStyle() -> some View {
        self
            .font(.system(size: 11, weight: .semibold, design: .default))
            .foregroundStyle(Color.textSecondary)
            .textCase(.uppercase)
            .kerning(0.5)
    }
}
