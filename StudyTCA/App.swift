//
//  StudyTCAApp.swift
//  StudyTCA
//
//  Created by Kang Minsang on 2023/08/28.
//

import SwiftUI
import ComposableArchitecture

@main
struct StudyTCAApp: App {
    /// 앱을 구동하는 store는 한번만 생성되어야 합니다. static 변수로 유지한 다음 장면에 제공할 수 있습니다.
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges() // 리듀서가 처리하는 모든 작업을 print 하고 작업을 처리한 후 상태가 어떻게 변경되었는지 print 합니다.
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store: StudyTCAApp.store)
        }
    }
}
