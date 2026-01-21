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
        NavigationStack{
            if !vm.isLoading{
                ForEach(vm.measurementPoints) { point in
                    NavigationLink {
                        MeasurementPointView(vm: container.makeMeasurementPointViewModel(), mp: point)
                    } label: {
                        MeasurementPointListRowView(point: point)
                    }
                    Divider()
                }
            } else {
                ProgressView()
            }
            Spacer()
            Button("Add Measurement Point") {
                vm.showingAddPoint.toggle()
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
            Text(point.name)
                .font(.title)
            Spacer()
            Text(point.isActive.description)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
    }
}
