//
//  FYChars.swift
//  WhatsNewSwiftUI
//
//  Created by FanYu on 2022/6/11.
//

import SwiftUI
import Charts

struct Shoe: Identifiable {
    let name: String
    let sales: Int
    
    var id: String { name }
}
let sales: [Shoe] = [
    Shoe(name: "Nike", sales: 100),
    Shoe(name: "Adidas", sales: 300),
    Shoe(name: "Anta", sales: 900)
]

struct Series: Identifiable {
    let city: String
    let shoes: [Shoe]
    
    var id: String { city }
}
let seriesData: [Series] = [
    .init(city: "TY", shoes: sales),
    .init(city: "BJ", shoes: sales)
]

enum City {
    case ty
    case bj
}


struct FYChars: View {

    @State private var city = City.bj
    
    var body: some View {
        VStack {
            Chart {
                BarMark(
                    x: .value("Name", "Nike"),
                    y: .value("Sales", 900)
                )
                BarMark(
                    x: .value("Name", "Nike"),
                    y: .value("Sales", 900)
                )
                ForEach(sales) { element in
                    BarMark(x: .value("Name", element.name), y: .value("Sales", element.sales))
                }
            }
            // 竖立柱状图
            Chart(sales) { element in
                BarMark(x: .value("Name", element.name), y: .value("Sales", element.sales))
            }
            // 横向柱状图
            Chart(sales) { element in
                BarMark(x: .value("Sales", element.sales), y: .value("Name", element.name))
            }
            // 动画切换
            VStack {
                Picker("Board", selection: $city.animation(.easeInOut)) {
                    Text("TY").tag(City.ty)
                    Text("BJ").tag(City.bj)
                }
                .pickerStyle(.segmented)
                Chart(sales) { element in
                    BarMark(x: .value("Sales", element.sales), y: .value("Name", element.name))
                }
            }
            
        }
    }
}

struct FYChatS: View {
    var body: some View {
        // 一个柱子显示多个数据对比
        Chart(seriesData) { series in
            ForEach(series.shoes) { element in
                BarMark(x: .value("Sales", element.sales), y: .value("Name", element.name))
                    .foregroundStyle(by: .value("City", series.city))
            }
        }
        // 点状图 PointMark
        // 折线图 LineMark
        
        // 点状图、折线图、 放入同一套数据，就会形成折线图，关节位置为点
    }
}

struct FYChatS2: View {
    var body: some View {
        // 点状图、折线图、 放入同一套数据，就会形成折线图，关节位置为点
        Chart(seriesData) { series in
            ForEach(series.shoes) { element in
                LineMark(x: .value("Sales", element.sales), y: .value("Name", element.name))
                    .foregroundStyle(by: .value("City", series.city))
                    .symbol(by: .value("city", series.city)) // 改变点点形状

//                PointMark(x: .value("Sales", element.sales), y: .value("Name", element.name))
//                    .foregroundStyle(by: .value("City", series.city))
            }
        }
    }
}


struct FYChars_Previews: PreviewProvider {
    static var previews: some View {
        FYChars()
    }
}
