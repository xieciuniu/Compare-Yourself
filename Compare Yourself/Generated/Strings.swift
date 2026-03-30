// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum AddMeasurement {
    /// Logged. Keep going.
    internal static let confirmation = L10n.tr("Localizable", "addMeasurement.confirmation", fallback: "Logged. Keep going.")
    /// Last: %@ %@
    internal static func lastValue(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "addMeasurement.lastValue", String(describing: p1), String(describing: p2), fallback: "Last: %@ %@")
    }
    /// Add measurement
    internal static let title = L10n.tr("Localizable", "addMeasurement.title", fallback: "Add measurement")
    internal enum Action {
      /// Save measurement
      internal static let save = L10n.tr("Localizable", "addMeasurement.action.save", fallback: "Save measurement")
      /// Save & take photo
      internal static let saveAndPhoto = L10n.tr("Localizable", "addMeasurement.action.saveAndPhoto", fallback: "Save & take photo")
    }
    internal enum Error {
      /// Please enter a valid number
      internal static let valueInvalid = L10n.tr("Localizable", "addMeasurement.error.valueInvalid", fallback: "Please enter a valid number")
      /// Please enter a value
      internal static let valueRequired = L10n.tr("Localizable", "addMeasurement.error.valueRequired", fallback: "Please enter a value")
    }
    internal enum Field {
      internal enum Date {
        /// Date
        internal static let label = L10n.tr("Localizable", "addMeasurement.field.date.label", fallback: "Date")
      }
      internal enum LinkPhoto {
        /// Link to photo
        internal static let label = L10n.tr("Localizable", "addMeasurement.field.linkPhoto.label", fallback: "Link to photo")
        /// None
        internal static let `none` = L10n.tr("Localizable", "addMeasurement.field.linkPhoto.none", fallback: "None")
      }
      internal enum Notes {
        /// Notes
        internal static let label = L10n.tr("Localizable", "addMeasurement.field.notes.label", fallback: "Notes")
        /// Optional note…
        internal static let placeholder = L10n.tr("Localizable", "addMeasurement.field.notes.placeholder", fallback: "Optional note…")
      }
      internal enum Value {
        /// Value
        internal static let label = L10n.tr("Localizable", "addMeasurement.field.value.label", fallback: "Value")
        /// 0.0
        internal static let placeholder = L10n.tr("Localizable", "addMeasurement.field.value.placeholder", fallback: "0.0")
      }
    }
  }
  internal enum AddPoint {
    /// New measurement point
    internal static let title = L10n.tr("Localizable", "addPoint.title", fallback: "New measurement point")
    internal enum Action {
      /// Save point
      internal static let save = L10n.tr("Localizable", "addPoint.action.save", fallback: "Save point")
    }
    internal enum Error {
      /// Please enter a name for this point
      internal static let nameRequired = L10n.tr("Localizable", "addPoint.error.nameRequired", fallback: "Please enter a name for this point")
      /// Name must be 50 characters or fewer
      internal static let nameTooLong = L10n.tr("Localizable", "addPoint.error.nameTooLong", fallback: "Name must be 50 characters or fewer")
    }
    internal enum Field {
      internal enum Location {
        /// Body area
        internal static let label = L10n.tr("Localizable", "addPoint.field.location.label", fallback: "Body area")
        /// e.g. Right arm
        internal static let placeholder = L10n.tr("Localizable", "addPoint.field.location.placeholder", fallback: "e.g. Right arm")
      }
      internal enum Name {
        /// Name
        internal static let label = L10n.tr("Localizable", "addPoint.field.name.label", fallback: "Name")
        /// e.g. Right Bicep — Flexed
        internal static let placeholder = L10n.tr("Localizable", "addPoint.field.name.placeholder", fallback: "e.g. Right Bicep — Flexed")
      }
      internal enum Unit {
        /// Unit
        internal static let label = L10n.tr("Localizable", "addPoint.field.unit.label", fallback: "Unit")
      }
    }
  }
  internal enum Camera {
    /// Progress photo
    internal static let title = L10n.tr("Localizable", "camera.title", fallback: "Progress photo")
    internal enum Action {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "camera.action.cancel", fallback: "Cancel")
      /// Take photo
      internal static let capture = L10n.tr("Localizable", "camera.action.capture", fallback: "Take photo")
      /// Retake
      internal static let retake = L10n.tr("Localizable", "camera.action.retake", fallback: "Retake")
      /// Use photo
      internal static let usePhoto = L10n.tr("Localizable", "camera.action.usePhoto", fallback: "Use photo")
    }
    internal enum Ghost {
      /// Ghost opacity
      internal static let label = L10n.tr("Localizable", "camera.ghost.label", fallback: "Ghost opacity")
      /// No previous photo to overlay
      internal static let noReference = L10n.tr("Localizable", "camera.ghost.noReference", fallback: "No previous photo to overlay")
      internal enum Toggle {
        /// Hide overlay
        internal static let hide = L10n.tr("Localizable", "camera.ghost.toggle.hide", fallback: "Hide overlay")
        /// Show overlay
        internal static let show = L10n.tr("Localizable", "camera.ghost.toggle.show", fallback: "Show overlay")
      }
    }
    internal enum Lidar {
      /// Target %@
      internal static func target(_ p1: Any) -> String {
        return L10n.tr("Localizable", "camera.lidar.target", String(describing: p1), fallback: "Target %@")
      }
      /// LiDAR not available on this device
      internal static let unavailable = L10n.tr("Localizable", "camera.lidar.unavailable", fallback: "LiDAR not available on this device")
      internal enum Angle {
        /// Angle
        internal static let label = L10n.tr("Localizable", "camera.lidar.angle.label", fallback: "Angle")
      }
      internal enum Distance {
        /// Distance
        internal static let label = L10n.tr("Localizable", "camera.lidar.distance.label", fallback: "Distance")
      }
      internal enum Status {
        /// Adjust angle
        internal static let angleOff = L10n.tr("Localizable", "camera.lidar.status.angleOff", fallback: "Adjust angle")
        /// Good position
        internal static let good = L10n.tr("Localizable", "camera.lidar.status.good", fallback: "Good position")
        /// Move back
        internal static let tooClose = L10n.tr("Localizable", "camera.lidar.status.tooClose", fallback: "Move back")
        /// Move closer
        internal static let tooFar = L10n.tr("Localizable", "camera.lidar.status.tooFar", fallback: "Move closer")
      }
    }
    internal enum Permission {
      internal enum Denied {
        /// Open Settings
        internal static let action = L10n.tr("Localizable", "camera.permission.denied.action", fallback: "Open Settings")
        /// Please allow camera access in Settings to take progress photos.
        internal static let message = L10n.tr("Localizable", "camera.permission.denied.message", fallback: "Please allow camera access in Settings to take progress photos.")
        /// Camera access needed
        internal static let title = L10n.tr("Localizable", "camera.permission.denied.title", fallback: "Camera access needed")
      }
    }
  }
  internal enum Dashboard {
    /// Compare Yourself
    internal static let title = L10n.tr("Localizable", "dashboard.title", fallback: "Compare Yourself")
    internal enum Actions {
      /// Add measurement
      internal static let addMeasurement = L10n.tr("Localizable", "dashboard.actions.addMeasurement", fallback: "Add measurement")
      /// Take photo
      internal static let takePhoto = L10n.tr("Localizable", "dashboard.actions.takePhoto", fallback: "Take photo")
    }
    internal enum Goal {
      /// Goal reached
      internal static let achieved = L10n.tr("Localizable", "dashboard.goal.achieved", fallback: "Goal reached")
      /// Last measured
      internal static let lastMeasured = L10n.tr("Localizable", "dashboard.goal.lastMeasured", fallback: "Last measured")
      /// Current goal
      internal static let sectionLabel = L10n.tr("Localizable", "dashboard.goal.sectionLabel", fallback: "Current goal")
      /// Target
      internal static let target = L10n.tr("Localizable", "dashboard.goal.target", fallback: "Target")
      internal enum Empty {
        /// Set a goal
        internal static let action = L10n.tr("Localizable", "dashboard.goal.empty.action", fallback: "Set a goal")
        /// Set a goal to track your progress
        internal static let subtitle = L10n.tr("Localizable", "dashboard.goal.empty.subtitle", fallback: "Set a goal to track your progress")
        /// No active goal
        internal static let title = L10n.tr("Localizable", "dashboard.goal.empty.title", fallback: "No active goal")
      }
    }
    internal enum RecentMeasurements {
      /// No measurements yet — start by adding a measurement point
      internal static let empty = L10n.tr("Localizable", "dashboard.recentMeasurements.empty", fallback: "No measurements yet — start by adding a measurement point")
      /// Recent measurements
      internal static let title = L10n.tr("Localizable", "dashboard.recentMeasurements.title", fallback: "Recent measurements")
    }
    internal enum RecentPhoto {
      /// %d days ago
      internal static func daysAgo(_ p1: Int) -> String {
        return L10n.tr("Localizable", "dashboard.recentPhoto.daysAgo", p1, fallback: "%d days ago")
      }
      /// Last progress photo
      internal static let title = L10n.tr("Localizable", "dashboard.recentPhoto.title", fallback: "Last progress photo")
      internal enum Empty {
        /// Take photo
        internal static let action = L10n.tr("Localizable", "dashboard.recentPhoto.empty.action", fallback: "Take photo")
        /// Take your first progress photo
        internal static let subtitle = L10n.tr("Localizable", "dashboard.recentPhoto.empty.subtitle", fallback: "Take your first progress photo")
        /// No photos yet
        internal static let title = L10n.tr("Localizable", "dashboard.recentPhoto.empty.title", fallback: "No photos yet")
      }
    }
  }
  internal enum Global {
    internal enum Action {
      /// Add
      internal static let add = L10n.tr("Localizable", "global.action.add", fallback: "Add")
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "global.action.cancel", fallback: "Cancel")
      /// Close
      internal static let close = L10n.tr("Localizable", "global.action.close", fallback: "Close")
      /// Confirm
      internal static let confirm = L10n.tr("Localizable", "global.action.confirm", fallback: "Confirm")
      /// Delete
      internal static let delete = L10n.tr("Localizable", "global.action.delete", fallback: "Delete")
      /// Done
      internal static let done = L10n.tr("Localizable", "global.action.done", fallback: "Done")
      /// Edit
      internal static let edit = L10n.tr("Localizable", "global.action.edit", fallback: "Edit")
      /// Export
      internal static let export = L10n.tr("Localizable", "global.action.export", fallback: "Export")
      /// Save
      internal static let save = L10n.tr("Localizable", "global.action.save", fallback: "Save")
      /// See all
      internal static let seeAll = L10n.tr("Localizable", "global.action.seeAll", fallback: "See all")
      /// Try again
      internal static let tryAgain = L10n.tr("Localizable", "global.action.tryAgain", fallback: "Try again")
    }
    internal enum Empty {
      /// No data yet
      internal static let noData = L10n.tr("Localizable", "global.empty.noData", fallback: "No data yet")
    }
    internal enum Error {
      /// Something went wrong. Try again.
      internal static let generic = L10n.tr("Localizable", "global.error.generic", fallback: "Something went wrong. Try again.")
      /// Couldn't save. Try again.
      internal static let saveFailed = L10n.tr("Localizable", "global.error.saveFailed", fallback: "Couldn't save. Try again.")
    }
    internal enum Time {
      /// %d days ago
      internal static func daysAgo(_ p1: Int) -> String {
        return L10n.tr("Localizable", "global.time.daysAgo", p1, fallback: "%d days ago")
      }
      /// Just now
      internal static let justNow = L10n.tr("Localizable", "global.time.justNow", fallback: "Just now")
      /// %d months ago
      internal static func monthsAgo(_ p1: Int) -> String {
        return L10n.tr("Localizable", "global.time.monthsAgo", p1, fallback: "%d months ago")
      }
      /// Today
      internal static let today = L10n.tr("Localizable", "global.time.today", fallback: "Today")
      /// %d weeks ago
      internal static func weeksAgo(_ p1: Int) -> String {
        return L10n.tr("Localizable", "global.time.weeksAgo", p1, fallback: "%d weeks ago")
      }
      /// Yesterday
      internal static let yesterday = L10n.tr("Localizable", "global.time.yesterday", fallback: "Yesterday")
    }
    internal enum Unit {
      /// cm
      internal static let cm = L10n.tr("Localizable", "global.unit.cm", fallback: "cm")
      /// Imperial
      internal static let imperial = L10n.tr("Localizable", "global.unit.imperial", fallback: "Imperial")
      /// in
      internal static let inches = L10n.tr("Localizable", "global.unit.inches", fallback: "in")
      /// kg
      internal static let kg = L10n.tr("Localizable", "global.unit.kg", fallback: "kg")
      /// lbs
      internal static let lbs = L10n.tr("Localizable", "global.unit.lbs", fallback: "lbs")
      /// m
      internal static let meters = L10n.tr("Localizable", "global.unit.meters", fallback: "m")
      /// Metric
      internal static let metric = L10n.tr("Localizable", "global.unit.metric", fallback: "Metric")
    }
  }
  internal enum Goals {
    /// Goals
    internal static let title = L10n.tr("Localizable", "goals.title", fallback: "Goals")
    internal enum Add {
      /// New goal
      internal static let title = L10n.tr("Localizable", "goals.add.title", fallback: "New goal")
    }
    internal enum Card {
      internal enum Trend {
        /// Declining
        internal static let declining = L10n.tr("Localizable", "goals.card.trend.declining", fallback: "Declining")
        /// Improving
        internal static let improving = L10n.tr("Localizable", "goals.card.trend.improving", fallback: "Improving")
        /// Steady
        internal static let steady = L10n.tr("Localizable", "goals.card.trend.steady", fallback: "Steady")
      }
    }
    internal enum Direction {
      /// Decrease
      internal static let decrease = L10n.tr("Localizable", "goals.direction.decrease", fallback: "Decrease")
      /// Increase
      internal static let increase = L10n.tr("Localizable", "goals.direction.increase", fallback: "Increase")
    }
    internal enum Empty {
      /// Set a goal
      internal static let action = L10n.tr("Localizable", "goals.empty.action", fallback: "Set a goal")
      /// Set a goal to track your progress
      internal static let subtitle = L10n.tr("Localizable", "goals.empty.subtitle", fallback: "Set a goal to track your progress")
      /// No active goals
      internal static let title = L10n.tr("Localizable", "goals.empty.title", fallback: "No active goals")
    }
    internal enum Form {
      internal enum Direction {
        /// Direction
        internal static let label = L10n.tr("Localizable", "goals.form.direction.label", fallback: "Direction")
      }
      internal enum Frequency {
        /// Times per week
        internal static let label = L10n.tr("Localizable", "goals.form.frequency.label", fallback: "Times per week")
      }
      internal enum Name {
        /// Goal name
        internal static let label = L10n.tr("Localizable", "goals.form.name.label", fallback: "Goal name")
        /// e.g. Reduce waist size
        internal static let placeholder = L10n.tr("Localizable", "goals.form.name.placeholder", fallback: "e.g. Reduce waist size")
      }
      internal enum PhotoDays {
        /// Every (days)
        internal static let label = L10n.tr("Localizable", "goals.form.photoDays.label", fallback: "Every (days)")
      }
      internal enum Point {
        /// Measurement point
        internal static let label = L10n.tr("Localizable", "goals.form.point.label", fallback: "Measurement point")
      }
      internal enum Target {
        /// Target value
        internal static let label = L10n.tr("Localizable", "goals.form.target.label", fallback: "Target value")
      }
    }
    internal enum Progress {
      /// Achieved
      internal static let achieved = L10n.tr("Localizable", "goals.progress.achieved", fallback: "Achieved")
      /// Current: %@ %@
      internal static func current(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "goals.progress.current", String(describing: p1), String(describing: p2), fallback: "Current: %@ %@")
      }
      /// %@ %@ to go
      internal static func remaining(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "goals.progress.remaining", String(describing: p1), String(describing: p2), fallback: "%@ %@ to go")
      }
      /// Target: %@ %@
      internal static func target(_ p1: Any, _ p2: Any) -> String {
        return L10n.tr("Localizable", "goals.progress.target", String(describing: p1), String(describing: p2), fallback: "Target: %@ %@")
      }
    }
    internal enum `Type` {
      /// Consistency
      internal static let consistency = L10n.tr("Localizable", "goals.type.consistency", fallback: "Consistency")
      /// Measurement target
      internal static let measurement = L10n.tr("Localizable", "goals.type.measurement", fallback: "Measurement target")
      /// Photo frequency
      internal static let photoFrequency = L10n.tr("Localizable", "goals.type.photoFrequency", fallback: "Photo frequency")
      /// Weight target
      internal static let weight = L10n.tr("Localizable", "goals.type.weight", fallback: "Weight target")
    }
  }
  internal enum Measurements {
    /// Measurements
    internal static let title = L10n.tr("Localizable", "measurements.title", fallback: "Measurements")
    internal enum Diagram {
      /// Front
      internal static let front = L10n.tr("Localizable", "measurements.diagram.front", fallback: "Front")
      /// Side
      internal static let side = L10n.tr("Localizable", "measurements.diagram.side", fallback: "Side")
      internal enum AddPin {
        /// Cancel
        internal static let cancel = L10n.tr("Localizable", "measurements.diagram.addPin.cancel", fallback: "Cancel")
        /// Add pin
        internal static let confirm = L10n.tr("Localizable", "measurements.diagram.addPin.confirm", fallback: "Add pin")
        /// This will create a new measurement point at this location
        internal static let subtitle = L10n.tr("Localizable", "measurements.diagram.addPin.subtitle", fallback: "This will create a new measurement point at this location")
        /// Add pin here?
        internal static let title = L10n.tr("Localizable", "measurements.diagram.addPin.title", fallback: "Add pin here?")
      }
      internal enum Empty {
        /// Tap the diagram to place a new pin
        internal static let hint = L10n.tr("Localizable", "measurements.diagram.empty.hint", fallback: "Tap the diagram to place a new pin")
      }
    }
    internal enum List {
      /// Body measurements
      internal static let sectionBody = L10n.tr("Localizable", "measurements.list.sectionBody", fallback: "Body measurements")
      internal enum Empty {
        /// Add measurement point
        internal static let action = L10n.tr("Localizable", "measurements.list.empty.action", fallback: "Add measurement point")
        /// Add your first measurement point to get started
        internal static let subtitle = L10n.tr("Localizable", "measurements.list.empty.subtitle", fallback: "Add your first measurement point to get started")
        /// No measurement points yet
        internal static let title = L10n.tr("Localizable", "measurements.list.empty.title", fallback: "No measurement points yet")
      }
      internal enum Row {
        /// %@ · %@
        internal static func location(_ p1: Any, _ p2: Any) -> String {
          return L10n.tr("Localizable", "measurements.list.row.location", String(describing: p1), String(describing: p2), fallback: "%@ · %@")
        }
        /// No measurements yet
        internal static let noMeasurements = L10n.tr("Localizable", "measurements.list.row.noMeasurements", fallback: "No measurements yet")
      }
    }
    internal enum Pin {
      internal enum Menu {
        /// Add measurement
        internal static let addMeasurement = L10n.tr("Localizable", "measurements.pin.menu.addMeasurement", fallback: "Add measurement")
        /// Archive
        internal static let archive = L10n.tr("Localizable", "measurements.pin.menu.archive", fallback: "Archive")
        /// Edit
        internal static let edit = L10n.tr("Localizable", "measurements.pin.menu.edit", fallback: "Edit")
      }
      internal enum State {
        /// Active
        internal static let active = L10n.tr("Localizable", "measurements.pin.state.active", fallback: "Active")
        /// New
        internal static let new = L10n.tr("Localizable", "measurements.pin.state.new", fallback: "New")
        /// Recent
        internal static let recent = L10n.tr("Localizable", "measurements.pin.state.recent", fallback: "Recent")
        /// Stale
        internal static let stale = L10n.tr("Localizable", "measurements.pin.state.stale", fallback: "Stale")
      }
      internal enum Tooltip {
        /// Add measurement
        internal static let addButton = L10n.tr("Localizable", "measurements.pin.tooltip.addButton", fallback: "Add measurement")
        /// View history
        internal static let historyButton = L10n.tr("Localizable", "measurements.pin.tooltip.historyButton", fallback: "View history")
        /// Last measurement
        internal static let lastValue = L10n.tr("Localizable", "measurements.pin.tooltip.lastValue", fallback: "Last measurement")
        /// No measurements recorded yet
        internal static let noHistory = L10n.tr("Localizable", "measurements.pin.tooltip.noHistory", fallback: "No measurements recorded yet")
      }
    }
    internal enum Segment {
      /// Diagram
      internal static let diagram = L10n.tr("Localizable", "measurements.segment.diagram", fallback: "Diagram")
      /// List
      internal static let list = L10n.tr("Localizable", "measurements.segment.list", fallback: "List")
    }
  }
  internal enum Photos {
    /// Photos
    internal static let title = L10n.tr("Localizable", "photos.title", fallback: "Photos")
    internal enum Comparison {
      /// Compare
      internal static let action = L10n.tr("Localizable", "photos.comparison.action", fallback: "Compare")
      /// Before
      internal static let before = L10n.tr("Localizable", "photos.comparison.before", fallback: "Before")
      /// Now
      internal static let now = L10n.tr("Localizable", "photos.comparison.now", fallback: "Now")
      /// %d days · %d photos
      internal static func summary(_ p1: Int, _ p2: Int) -> String {
        return L10n.tr("Localizable", "photos.comparison.summary", p1, p2, fallback: "%d days · %d photos")
      }
      /// Before vs now
      internal static let title = L10n.tr("Localizable", "photos.comparison.title", fallback: "Before vs now")
    }
    internal enum Detail {
      /// %@
      internal static func date(_ p1: Any) -> String {
        return L10n.tr("Localizable", "photos.detail.date", String(describing: p1), fallback: "%@")
      }
      /// Linked measurements
      internal static let linkedMeasurements = L10n.tr("Localizable", "photos.detail.linkedMeasurements", fallback: "Linked measurements")
      internal enum Delete {
        /// Delete
        internal static let confirm = L10n.tr("Localizable", "photos.detail.delete.confirm", fallback: "Delete")
        /// This photo will be permanently deleted. This cannot be undone.
        internal static let message = L10n.tr("Localizable", "photos.detail.delete.message", fallback: "This photo will be permanently deleted. This cannot be undone.")
        /// Delete photo?
        internal static let title = L10n.tr("Localizable", "photos.detail.delete.title", fallback: "Delete photo?")
      }
      internal enum Notes {
        /// Add a note to this photo…
        internal static let placeholder = L10n.tr("Localizable", "photos.detail.notes.placeholder", fallback: "Add a note to this photo…")
      }
    }
    internal enum Gallery {
      /// All photos
      internal static let title = L10n.tr("Localizable", "photos.gallery.title", fallback: "All photos")
      internal enum Empty {
        /// Take photo
        internal static let action = L10n.tr("Localizable", "photos.gallery.empty.action", fallback: "Take photo")
        /// Take your first progress photo to start your visual timeline
        internal static let subtitle = L10n.tr("Localizable", "photos.gallery.empty.subtitle", fallback: "Take your first progress photo to start your visual timeline")
        /// No photos yet
        internal static let title = L10n.tr("Localizable", "photos.gallery.empty.title", fallback: "No photos yet")
      }
    }
    internal enum SideBy {
      /// Select first photo
      internal static let selectFirst = L10n.tr("Localizable", "photos.sideBy.selectFirst", fallback: "Select first photo")
      /// Select second photo
      internal static let selectSecond = L10n.tr("Localizable", "photos.sideBy.selectSecond", fallback: "Select second photo")
      /// Compare photos
      internal static let title = L10n.tr("Localizable", "photos.sideBy.title", fallback: "Compare photos")
    }
  }
  internal enum PointDetail {
    internal enum Chart {
      /// Add at least two measurements to see a chart
      internal static let empty = L10n.tr("Localizable", "pointDetail.chart.empty", fallback: "Add at least two measurements to see a chart")
      internal enum Range {
        /// All
        internal static let all = L10n.tr("Localizable", "pointDetail.chart.range.all", fallback: "All")
        /// 1M
        internal static let oneMonth = L10n.tr("Localizable", "pointDetail.chart.range.oneMonth", fallback: "1M")
        /// 1Y
        internal static let oneYear = L10n.tr("Localizable", "pointDetail.chart.range.oneYear", fallback: "1Y")
        /// 6M
        internal static let sixMonths = L10n.tr("Localizable", "pointDetail.chart.range.sixMonths", fallback: "6M")
        /// 3M
        internal static let threeMonths = L10n.tr("Localizable", "pointDetail.chart.range.threeMonths", fallback: "3M")
      }
    }
    internal enum Delete {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "pointDetail.delete.cancel", fallback: "Cancel")
      /// Delete
      internal static let confirm = L10n.tr("Localizable", "pointDetail.delete.confirm", fallback: "Delete")
      /// This will permanently delete "%@" and all %d measurements. This cannot be undone.
      internal static func message(_ p1: Any, _ p2: Int) -> String {
        return L10n.tr("Localizable", "pointDetail.delete.message", String(describing: p1), p2, fallback: "This will permanently delete \"%@\" and all %d measurements. This cannot be undone.")
      }
      /// Delete measurement point?
      internal static let title = L10n.tr("Localizable", "pointDetail.delete.title", fallback: "Delete measurement point?")
    }
    internal enum History {
      /// No measurements recorded yet
      internal static let empty = L10n.tr("Localizable", "pointDetail.history.empty", fallback: "No measurements recorded yet")
      /// First entry
      internal static let firstEntry = L10n.tr("Localizable", "pointDetail.history.firstEntry", fallback: "First entry")
      /// History
      internal static let title = L10n.tr("Localizable", "pointDetail.history.title", fallback: "History")
    }
    internal enum Menu {
      /// Archive point
      internal static let archive = L10n.tr("Localizable", "pointDetail.menu.archive", fallback: "Archive point")
      /// Delete point
      internal static let delete = L10n.tr("Localizable", "pointDetail.menu.delete", fallback: "Delete point")
      /// Edit point
      internal static let edit = L10n.tr("Localizable", "pointDetail.menu.edit", fallback: "Edit point")
      /// Export data
      internal static let export = L10n.tr("Localizable", "pointDetail.menu.export", fallback: "Export data")
    }
    internal enum Nav {
      /// Measurements
      internal static let back = L10n.tr("Localizable", "pointDetail.nav.back", fallback: "Measurements")
    }
    internal enum Stats {
      /// Average
      internal static let average = L10n.tr("Localizable", "pointDetail.stats.average", fallback: "Average")
      /// Best (%@)
      internal static func best(_ p1: Any) -> String {
        return L10n.tr("Localizable", "pointDetail.stats.best", String(describing: p1), fallback: "Best (%@)")
      }
      /// Entries
      internal static let entries = L10n.tr("Localizable", "pointDetail.stats.entries", fallback: "Entries")
      /// Latest (%@)
      internal static func latest(_ p1: Any) -> String {
        return L10n.tr("Localizable", "pointDetail.stats.latest", String(describing: p1), fallback: "Latest (%@)")
      }
      /// —
      internal static let noData = L10n.tr("Localizable", "pointDetail.stats.noData", fallback: "—")
      /// Total gain
      internal static let totalGain = L10n.tr("Localizable", "pointDetail.stats.totalGain", fallback: "Total gain")
      /// Total loss
      internal static let totalLoss = L10n.tr("Localizable", "pointDetail.stats.totalLoss", fallback: "Total loss")
    }
  }
  internal enum Settings {
    /// Made with purpose.
    internal static let tagline = L10n.tr("Localizable", "settings.tagline", fallback: "Made with purpose.")
    /// Settings
    internal static let title = L10n.tr("Localizable", "settings.title", fallback: "Settings")
    internal enum About {
      /// About Compare Yourself
      internal static let label = L10n.tr("Localizable", "settings.about.label", fallback: "About Compare Yourself")
    }
    internal enum Export {
      /// Export failed. Try again.
      internal static let error = L10n.tr("Localizable", "settings.export.error", fallback: "Export failed. Try again.")
      /// Export data
      internal static let label = L10n.tr("Localizable", "settings.export.label", fallback: "Export data")
      /// JSON · CSV
      internal static let subtitle = L10n.tr("Localizable", "settings.export.subtitle", fallback: "JSON · CSV")
      /// Data exported successfully
      internal static let success = L10n.tr("Localizable", "settings.export.success", fallback: "Data exported successfully")
      internal enum Format {
        /// Export as CSV
        internal static let csv = L10n.tr("Localizable", "settings.export.format.csv", fallback: "Export as CSV")
        /// Export as JSON
        internal static let json = L10n.tr("Localizable", "settings.export.format.json", fallback: "Export as JSON")
      }
      internal enum Sheet {
        /// Export your data
        internal static let title = L10n.tr("Localizable", "settings.export.sheet.title", fallback: "Export your data")
      }
    }
    internal enum Privacy {
      /// Privacy policy
      internal static let label = L10n.tr("Localizable", "settings.privacy.label", fallback: "Privacy policy")
    }
    internal enum Profile {
      /// Member since %@
      internal static func memberSince(_ p1: Any) -> String {
        return L10n.tr("Localizable", "settings.profile.memberSince", String(describing: p1), fallback: "Member since %@")
      }
    }
    internal enum Reset {
      /// Reset all data
      internal static let label = L10n.tr("Localizable", "settings.reset.label", fallback: "Reset all data")
      /// Permanently deletes all measurements and photos
      internal static let subtitle = L10n.tr("Localizable", "settings.reset.subtitle", fallback: "Permanently deletes all measurements and photos")
      internal enum Confirm {
        /// Reset everything
        internal static let action = L10n.tr("Localizable", "settings.reset.confirm.action", fallback: "Reset everything")
        /// Cancel
        internal static let cancel = L10n.tr("Localizable", "settings.reset.confirm.cancel", fallback: "Cancel")
        /// This will permanently delete all your measurements, photos, and goals. This cannot be undone.
        internal static let message = L10n.tr("Localizable", "settings.reset.confirm.message", fallback: "This will permanently delete all your measurements, photos, and goals. This cannot be undone.")
        /// Reset all data?
        internal static let title = L10n.tr("Localizable", "settings.reset.confirm.title", fallback: "Reset all data?")
      }
    }
    internal enum Section {
      /// About
      internal static let about = L10n.tr("Localizable", "settings.section.about", fallback: "About")
      /// Danger zone
      internal static let dangerZone = L10n.tr("Localizable", "settings.section.dangerZone", fallback: "Danger zone")
      /// Data & sync
      internal static let dataSync = L10n.tr("Localizable", "settings.section.dataSync", fallback: "Data & sync")
      /// Preferences
      internal static let preferences = L10n.tr("Localizable", "settings.section.preferences", fallback: "Preferences")
    }
    internal enum Sync {
      /// Sync error — tap to retry
      internal static let error = L10n.tr("Localizable", "settings.sync.error", fallback: "Sync error — tap to retry")
      /// iCloud sync
      internal static let label = L10n.tr("Localizable", "settings.sync.label", fallback: "iCloud sync")
      /// Last synced %@
      internal static func lastSynced(_ p1: Any) -> String {
        return L10n.tr("Localizable", "settings.sync.lastSynced", String(describing: p1), fallback: "Last synced %@")
      }
      /// Syncing…
      internal static let syncing = L10n.tr("Localizable", "settings.sync.syncing", fallback: "Syncing…")
      internal enum LastSynced {
        /// Never synced
        internal static let never = L10n.tr("Localizable", "settings.sync.lastSynced.never", fallback: "Never synced")
      }
    }
    internal enum Units {
      /// Measurement units
      internal static let label = L10n.tr("Localizable", "settings.units.label", fallback: "Measurement units")
    }
    internal enum Version {
      /// Version
      internal static let label = L10n.tr("Localizable", "settings.version.label", fallback: "Version")
    }
  }
  internal enum TabBar {
    /// Dashboard
    internal static let dashboard = L10n.tr("Localizable", "tabBar.dashboard", fallback: "Dashboard")
    /// Measurements
    internal static let measurements = L10n.tr("Localizable", "tabBar.measurements", fallback: "Measurements")
    /// Photos
    internal static let photos = L10n.tr("Localizable", "tabBar.photos", fallback: "Photos")
    /// Settings
    internal static let settings = L10n.tr("Localizable", "tabBar.settings", fallback: "Settings")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
