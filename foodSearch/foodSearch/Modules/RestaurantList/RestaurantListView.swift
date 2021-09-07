//
//  RestaurantListView.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct RestaurantListView: View {
    var business: [Business]
    var body: some View {
        VStack{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                LazyVStack(spacing: 20){
                    ForEach(business, id: \.self) { businessDetails in
                        NavigationLink(destination: BusinessDetailsView( businessId: businessDetails.id)) {
                            Text("\(businessDetails.name)")
                                .foregroundColor(.white)
                                .padding(.leading, 20.0)
                                .frame(maxWidth: .infinity, minHeight: 100.0)
                                .background(Color.red).cornerRadius(20).shadow(color: .black, radius: 10, x: 0.0, y: 7.0)
                        }
                    }
                }
                .padding(.horizontal, 30.0)
            }
        }.navigationTitle("Restaurant List")
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(business: [Business]())
    }
}
