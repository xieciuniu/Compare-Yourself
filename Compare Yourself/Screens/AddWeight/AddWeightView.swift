//
//  AddWeightView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 13/12/2025.
//

import SwiftUI

struct AddWeightView: View {
    @State var vm: AddWeightViewModel
    
    init(vm: AddWeightViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            Text(vm.weight.formatted())
                .font(.title)
            
            HStack {
                Button("Add kg") {
                    vm.weight += 1
                }
                
                Button("Take kg") {
                    vm.weight -= 1
                }
            }
        }
    }
}

//#Preview {
//    AddWeightView()
//}
