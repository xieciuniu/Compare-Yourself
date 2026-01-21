//
//  MeasurementPointView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 17/01/2026.
//

import SwiftUI

struct MeasurementPointView: View {
    @EnvironmentObject private var container: DependencyContainer
    
    @State private var vm: MeasurementPointViewModel
    private let mp: MeasurementPoint
    
    init(vm: MeasurementPointViewModel, mp: MeasurementPoint) {
        self.vm = vm
        self.mp = mp
    }
    var body: some View {
        VStack {
            Text(mp.name)
                .font(.largeTitle)
            ForEach(vm.measurements) {
                MeasurementRow(measurement: $0)
            }
            Spacer()
            
            Button("Add Measurement") {
                vm.showingAddPoint.toggle()
            }
        }
        .sheet(isPresented: $vm.showingAddPoint, onDismiss: {vm.fetchMeasurements(mpId: mp.pointId)}) {
            AddMeasurement(
                vm: container.makeAddMeasurementViewModel(),
                measurementPoint: mp
            )
        }
    }
}

#Preview {
    let container = DependencyContainer()
    let mp = MeasurementPoint(name: "Belly", measurementUnit: .length)
    
    
    MeasurementPointView(vm: container.makeMeasurementPointViewModel(), mp: mp)
        .environmentObject(container)
}

struct MeasurementRow: View {
    let measurement: Measurement
    
    var body: some View {
        HStack {
            Text(measurement.value.description + " cm")
            Spacer()
            Text(measurement.date.description)
        }
        .padding(8)
    }
}
