//
//  DownloadWithEscaping.swift
//  SwiftUIContinuedLearning
//
//  Created by  謝皓昀 on 2024/8/19.
//

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
}

struct DownloadWithEscaping: View {
//@StateObject 包裝了 Download...ViewModel 類別的實例，讓 SwiftUI 可以管理其生命週期和狀態變化
    @StateObject var vm = DownloadWithEscapingViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    DownloadWithEscaping()
}
