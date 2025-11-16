# Compare Yourself

An iOS body progress tracking app with visual measurement point management and consistent progress photo capture.

![iOS](https://img.shields.io/badge/iOS-17.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-✓-green.svg)
![SwiftData](https://img.shields.io/badge/SwiftData-✓-purple.svg)

## Overview

**Compare Yourself** helps users track body transformation through measurements and photos with an emphasis on **consistency**. Users place visual pins on interactive body diagrams to mark exact measurement locations, ensuring they measure the same spots every time. Progress photos use overlay and LiDAR positioning for consistent angles and distances.

### Key Features

- **📍 Visual Measurement Pins**: Tap body diagrams to place and name measurement points
- **📊 Progress Tracking**: Chart measurement history for each pin with trends and statistics
- **📸 Consistent Photos**: Photo overlay ("shadow effect") and LiDAR guidance for repeatable positioning
- **☁️ Optional Cloud Sync**: CloudKit integration for backup and cross-device sync
- **🎯 Fully Customizable**: Define your own measurement points (e.g., "Right Bicep - Flexed")

## Technical Stack

- **Language**: Swift 6
- **UI**: SwiftUI
- **Architecture**: MVVM with Repository Pattern
- **Persistence**: SwiftData (local-first)
- **Cloud Sync**: CloudKit Private Database
- **Camera**: AVFoundation
- **3D Positioning**: ARKit (LiDAR on supported devices)
- **Charts**: Swift Charts
- **Code Quality**: SwiftLint (strict enforcement)

**Minimum Requirements**: iOS 17.0+

## Project Status

🚧 **Current Phase**: Initial Development  
🎯 **Target Release**: Q1 2025 (New Year)  
📝 **Development Model**: Bi-weekly sprints with iterative MVP-first approach

### Current Sprint Goals
- [ ] Project structure and SwiftData models
- [ ] Body diagram view with pin placement
- [ ] Basic measurement CRUD operations
- [ ] SwiftLint integration ✅

## Architecture

This project follows **MVVM** architecture with emphasis on SOLID principles and design patterns:
```
┌─────────────┐
│    Views    │  SwiftUI Views
└──────┬──────┘
       │
┌──────▼──────┐
│ ViewModels  │  @Observable, business logic
└──────┬──────┘
       │
┌──────▼──────┐
│ Repositories│  Data access abstraction
└──────┬──────┘
       │
┌──────▼──────┐
│   Models    │  SwiftData @Model classes
└─────────────┘
```

### Design Patterns in Use
- **Repository Pattern**: Data access abstraction layer
- **Factory Pattern**: Object creation (e.g., measurement points, photos)
- **Observer Pattern**: SwiftUI bindings + Combine for reactive updates
- **Dependency Injection**: Constructor injection for testability

## Project Structure
```
Compare Yourself/
├── Models/              # SwiftData models
├── Views/               # SwiftUI views organized by feature
├── ViewModels/          # MVVM view models (@Observable)
├── Repositories/        # Data access layer
├── Services/            # Business logic (photo storage, LiDAR, sync)
├── Factories/           # Object creation factories
├── Utilities/           # Helpers and extensions
└── Assets/              # Body diagrams, colors, images

Documents/
└── Photos/
    ├── original/        # Full resolution HEIC
    └── thumbnails/      # Compressed thumbnails
```

## Getting Started

### Prerequisites

- **Xcode 15.0+**
- **iOS 17.0+ Simulator or Device**
- **Homebrew** (for SwiftLint)

### Installation

1. **Clone the repository**
```bash
   git clone <repository-url>
   cd "Compare Yourself"
```

2. **Install SwiftLint** (if not already installed)
```bash
   brew install swiftlint
```

3. **Open in Xcode**
```bash
   open "Compare Yourself.xcodeproj"
```

4. **Build and Run**
   - Select a simulator or connected device
   - ⌘ + R to build and run
   - SwiftLint violations will prevent compilation (by design)

### SwiftLint Configuration

The project uses strict SwiftLint enforcement. Build will fail if linting errors are present.

- Configuration: `.swiftlint.yml`
- Custom rules for spaced project name compatibility
- Run manually: `swiftlint lint`

## Development Guidelines

### Code Quality Standards
- ✅ All code must pass SwiftLint before committing
- ✅ Follow SOLID principles
- ✅ Use dependency injection for testability
- ✅ Write unit tests for business logic
- ✅ Document complex algorithms with comments

### Commit Messages
Follow conventional commits:
```
feat: add pin placement on body diagram
fix: correct measurement value calculation
docs: update README with architecture details
test: add unit tests for MeasurementRepository
```

## Data Models

### Core Entities
- **BodyDiagram**: Front/side/back view containers
- **MeasurementPoint**: Pin location + metadata (x%, y%, name, color)
- **Measurement**: Individual measurement entry (value, date, notes)
- **ProgressPhoto**: Photo metadata + LiDAR positioning data

See [Project Overview](docs/project-overview.md) for detailed data model schemas.

## Roadmap

### MVP (Phase 1)
- [x] SwiftLint setup
- [ ] SwiftData models implementation
- [ ] Body diagram view with pin placement
- [ ] Measurement entry and history
- [ ] Basic chart visualization

### Phase 2
- [ ] Progress photo capture
- [ ] Photo overlay functionality
- [ ] LiDAR positioning guidance
- [ ] Timeline view

### Phase 3
- [ ] CloudKit sync implementation
- [ ] Data export (JSON)
- [ ] Settings and preferences
- [ ] Comprehensive test coverage

### Future Enhancements
- [ ] Apple Watch companion app
- [ ] AR 3D body visualization
- [ ] Smart device integration (scales, measuring tapes)
- [ ] Advanced analytics and insights

## Testing Strategy

- **Unit Tests**: Business logic, repositories, view models
- **UI Tests**: Critical user flows (pin placement, measurement entry)
- **TDD Approach**: Write tests before implementation when feasible
- **Coverage Goal**: >80% for business logic

## Privacy & Security

- 🔒 **Local-first**: All data stored on device by default
- ☁️ **Opt-in Sync**: CloudKit sync is optional and user-controlled
- 🚫 **No Tracking**: Zero third-party analytics or data collection
- 📤 **Data Export**: Users can export all data in JSON format
- 🗑️ **Right to Delete**: Complete data deletion including photos

## Contributing

This is a personal learning project, but feedback and suggestions are welcome! If you'd like to contribute:

1. Open an issue to discuss proposed changes
2. Fork the repository
3. Create a feature branch
4. Ensure SwiftLint passes
5. Submit a pull request

## Learning Objectives

This project is being developed to master:
- ✅ MVVM architecture in SwiftUI
- ✅ Repository pattern for data access
- ✅ SOLID principles in practice
- ✅ Dependency injection for testability
- ✅ SwiftData and CloudKit integration
- ✅ Test-driven development
- ✅ Clean code practices with SwiftLint

## License

MIT

## Acknowledgments

- Body diagram assets: [Source TBD]
- Inspired by the need for consistent body measurement tracking

---

**Developer**: Hubert Wojtowicz
**Status**: 🚧 Active Development
