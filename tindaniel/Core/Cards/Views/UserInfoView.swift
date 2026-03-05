////
////  UserInfoView.swift
////  tindaniel
////
////  Created by Daniel Berg on 03/03/26.
////
//
//import SwiftUI
//
//struct UserInfoView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 6) {
//            HStack {
//                Text("Avatar")
//                    .font(.title)
//                    .fontWeight(.heavy)
//                
//                Text("190")
//                    .font(.title)
//                    .fontWeight(.semibold)
//                
//                Spacer()
//                
//                Button {
//                    print("DEBUG: Show Profile here...")
//                } label: {
//                    Image(systemName: "arrow.up.circle")
//                        .imageScale(.large)
//                }
//            }
//            
//            Text("Just being blue...")
//                .font(.subheadline)
//                .lineLimit(2)
//        }
//        .foregroundStyle(.white)
//        .padding()
//    }
//}
//
//#Preview {
//    UserInfoView()
//}

//
//  UserInfoView.swift
//  tindaniel
//
//  Created by Daniel Berg on 03/03/26.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Avatar")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("190")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("DEBUG: Show Profile here...")
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            Text("Just being blue...")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView()
}
