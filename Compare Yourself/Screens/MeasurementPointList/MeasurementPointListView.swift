//
//  MeasurementPointListView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 18/01/2026.
//

import SwiftUI

struct MeasurementPointListView: View {
    @EnvironmentObject var container: DependencyContainer
    @State private var vm: MeasurementPointListViewModel
    
    init(vm: MeasurementPointListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        Group {
            if vm.isLoading {
                ProgressView("Loading...")
            } else if vm.measurementPoints.isEmpty {
                emptyStateView
            } else {
                measurementPointsList
                Spacer()
                Button("Add Measurement Point") {
                    vm.showingAddPoint.toggle()
                }
            }
        }
        .sheet(isPresented:
                $vm.showingAddPoint,
               onDismiss: {
            Task {
                await vm.fetchMeasurementPoints()
            }
        },
               content: {
            AddMeasurementPointView(vm: container.makeAddMeasurementPointViewModel())
        })
        .onAppear(perform: {
            Task {
                await vm.fetchMeasurementPoints()
            }
        })
    }
    
    
    // MARK: Subviews
    
    var measurementPointsList: some View {
        List {
            ForEach(vm.measurementPoints) { point in
                NavigationLink(value: point) {
                    MeasurementPointListRowView(point: point)
                }
            }
            .onDelete { index in
                Task {
                    await vm.deleteMeasurementPoint(at: index)
                }
            }
        }
        .navigationDestination(for: MeasurementPoint.self) { point in
            MeasurementPointView(
                vm: container.makeMeasurementPointViewModel(),
                mp: point
            )
        }
    }
    
    var emptyStateView: some View {
        ContentUnavailableView {
            Label("No Measurement Points", systemImage: "pin.slash")
        } description: {
            Text("Add your first measurement point to start tracking")
        } actions: {
            Button("Add Measurement Point") {
                vm.showingAddPoint = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
}

#Preview {
    let container = DependencyContainer()
    MeasurementPointListView(vm: container.makeMeasurementPointListViewModel())
        .environmentObject(container)
}

struct MeasurementPointListRowView: View {
    let point: MeasurementPoint
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(point.name)
                    .font(.headline)
                
                Text(point.measurementUnit.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Show measurement count or status
            let count = point.measurements.count
            if count > 0 {
                Text("\(count)")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }
        }
        .padding(.vertical, 4)
    }
}
