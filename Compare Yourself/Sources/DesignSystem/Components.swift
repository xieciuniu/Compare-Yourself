// ─────────────────────────────────────────────────────────────────────────────
// Components.swift — Compare Yourself
// Reusable SwiftUI components built entirely from design tokens.
// Import and use these in screens — never rebuild ad-hoc.
// ─────────────────────────────────────────────────────────────────────────────

import SwiftUI

// MARK: - Buttons

struct PrimaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void

    init(_ title: String, icon: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.sm) {
                if let icon {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .medium))
                }
                Text(title)
                    .font(Typography.headline)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.energy)
            .clipShape(RoundedRectangle.chip)
        }
    }
}

struct SecondaryButton: View {
    let title: String
    let icon: String?
    let action: () -> Void

    init(_ title: String, icon: String? = nil, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: Spacing.sm) {
                if let icon {
                    Image(systemName: icon)
                        .font(.system(size: 18, weight: .medium))
                }
                Text(title)
                    .font(Typography.headline)
            }
            .foregroundStyle(Color.textPrimary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.backgroundSurface)
            .clipShape(RoundedRectangle.chip)
            .overlay(RoundedRectangle.chip.stroke(Color.borderDefault, lineWidth: 0.5))
        }
    }
}

// MARK: - Stat Chip

/// Single numeric stat tile. Use in HStack(spacing: Spacing.chipGap).
struct StatChip: View {
    let value: String
    let label: String
    var valueColor: Color = Color.textPrimary

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(Typography.dataMedium)
                .foregroundStyle(valueColor)
            Text(label)
                .font(Typography.caption2)
                .foregroundStyle(Color.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Spacing.sm + 2)
        .background(Color.backgroundSurface)
        .clipShape(RoundedRectangle.chip)
    }
}

// MARK: - State Badge

/// Small pill badge showing measurement point state or date context.
struct StateBadge: View {
    let text: String
    let color: Color

    var body: some View {
        Text(text)
            .font(Typography.caption2)
            .foregroundStyle(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(color.opacity(0.12))
            .clipShape(Capsule())
    }
}

// MARK: - Section Header

/// Standard section header row with optional trailing action.
struct SectionHeader: View {
    let title: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        HStack {
            Text(title)
                .font(Typography.headline)
                .foregroundStyle(Color.textPrimary)
            Spacer()
            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(Typography.subheadline)
                    .foregroundStyle(Color.energy)
            }
        }
    }
}

// MARK: - Pin View

/// Body diagram pin. Handles all four visual states including pulse animation.
struct PinView: View {
    let state: PinState
    @State private var pulsing = false

    var body: some View {
        ZStack {
            Circle()
                .fill(state.fillColor)
                .frame(width: 12, height: 12)
                .overlay(
                    Circle()
                        .stroke(state.borderColor, lineWidth: state.borderWidth)
                )
                .opacity(state.opacity)
                .scaleEffect(state.shouldPulse && pulsing ? 1.15 : 1.0)
                .animation(
                    state.shouldPulse ? Animation.pulse : nil,
                    value: pulsing
                )
        }
        .frame(width: 44, height: 44)           // minimum tap target
        .contentShape(Circle())
        .onAppear { pulsing = true }
    }
}

// MARK: - Icon Square (Settings rows)

/// 32pt rounded-square icon container used in Settings list rows.
struct IconSquare: View {
    let systemName: String
    let backgroundColor: Color

    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.white)
            .frame(width: 32, height: 32)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.md))
    }
}

// MARK: - Settings Row

/// Standard row used inside grouped settings cards.
struct SettingsRow<TrailingContent: View>: View {
    let icon: String
    let iconBackground: Color
    let label: String
    var subtitle: String? = nil
    @ViewBuilder let trailing: () -> TrailingContent

    var body: some View {
        HStack(spacing: Spacing.md) {
            IconSquare(systemName: icon, backgroundColor: iconBackground)
            VStack(alignment: .leading, spacing: 3) {
                Text(label)
                    .font(Typography.subheadline)
                    .foregroundStyle(Color.textPrimary)
                if let subtitle {
                    Text(subtitle)
                        .font(Typography.caption)
                        .foregroundStyle(Color.textSecondary)
                }
            }
            Spacer()
            trailing()
        }
        .padding(.horizontal, Spacing.md)
        .padding(.vertical, subtitle != nil ? 14 : 12)
    }
}

// MARK: - Measurement Row

/// Single measurement entry row used in history lists.
struct MeasurementRow: View {
    let name: String
    let date: String
    let value: String
    let delta: String?
    var pinColor: Color = Color.progress
    var deltaColor: Color = Color.progress

    var body: some View {
        HStack {
            HStack(spacing: Spacing.sm) {
                Circle()
                    .fill(pinColor)
                    .frame(width: 10, height: 10)
                VStack(alignment: .leading, spacing: 2) {
                    Text(name)
                        .font(Typography.subheadline)
                        .foregroundStyle(Color.textPrimary)
                    Text(date)
                        .font(Typography.caption)
                        .foregroundStyle(Color.textSecondary)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 2) {
                Text(value)
                    .font(Typography.dataBody)
                    .foregroundStyle(Color.progress)
                if let delta {
                    Text(delta)
                        .font(Typography.dataCaption)
                        .foregroundStyle(deltaColor)
                }
            }
        }
        .padding(.vertical, 12)
    }
}
