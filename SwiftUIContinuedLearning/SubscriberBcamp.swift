//
//  SubscriberBcamp.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/25.
//

import SwiftUI
import Combine
import Foundation

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldTextSubscriber()
        addButtonSubcriber()
    }
    func addTextFieldTextSubscriber() {
        $textFieldText
        //輸入完再執行 .debounce
            //.debounce(for: .second(1), scheduler: DispatchQueue.main)
            .map { $0.count > 3 }
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
//警告：Result of call to 'sink(receiveValue:)' is unused (need store somewhere to cancel)
// 1.import Combine, 2.AnyCancellable, 3. store(in: )
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubcriber() {
        $textIsValid
        //combine兩種 Publiehed
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberBcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Type something...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(vm.textIsValid ? 0.0 : 1.0)
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.headline)
                        .padding(.trailing)
                    
                    ,alignment: .trailing
                )
            
            Button(action: {}, label: {
                Text("submit".uppercased())
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.5)
            })
            //false disabled showButton
            .disabled(!vm.showButton)
        }
        .padding()
    }
}

#Preview {
    SubscriberBcamp()
}
