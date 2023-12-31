//
//  CounterView.swift
//  StudyTCA
//
//  Created by Kang Minsang on 2023/08/28.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    /// store는 기능의 런타임, 즉 상태를 업데이트하기 위해 작업을 처리할 수 있는 개체
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        /// WithViewStore를 통해 store의 상태를 읽고 작업을 보낼 수 있습니다.
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("\(viewStore.count)")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                HStack {
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                    .font(.largeTitle)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                }
                Button(viewStore.isTimerRunning ? "Stop timer" : "Start timer") {
                    viewStore.send(.toggleTimerButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                
                Button("Fact") {
                    viewStore.send(.factButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                
                if viewStore.isLoading {
                    ProgressView()
                } else if let fact = viewStore.fact {
                    Text(fact)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        }
    }
}

struct CounterFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            // reducer 후행클로저를 주석처리하면 논리나 동작에 대해 걱정하지 않고 UI를 확인할 수 있다.
            store: Store(initialState: CounterFeature.State(), reducer: {
                CounterFeature()
            })
        )
    }
}
