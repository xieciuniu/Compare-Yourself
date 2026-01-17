//
//  AddWeightView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 13/12/2025.
//

import SwiftUI

struct AddWeightView: View {
    @State var vm: AddWeightViewModel
    private var measurementPoint: MeasurementPoint
    
    init(vm: AddWeightViewModel, measurementPoint: MeasurementPoint) {
        self.vm = vm
        self.measurementPoint = measurementPoint
    }
    
    var body: some View {
        VStack {
            Text(vm.weight.formatted())
                .font(.title)
            
            HStack {
                Button("Take kg") {
                    vm.weight -= 1
                }
                
                Button("Add kg") {
                    vm.weight += 1
                }
            }
        }
    }
}

//#Preview {
//    AddWeightView()
//}
