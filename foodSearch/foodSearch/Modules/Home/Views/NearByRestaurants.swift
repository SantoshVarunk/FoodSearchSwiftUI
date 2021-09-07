//
//  NearByRestaurants.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct NearByRestaurants: View {
    private var manager: ContentManager = ContentManager()
    @State var business = [Business]()
    @State var nearByBusiness = [Business]()
    
    var body: some View {
        Text("Near By Restaurants")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.red)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(nearByBusiness, id: \.self) { business in
                    NavigationLink(destination: BusinessDetailsView( businessId: business.id)) {
                        Text("\(business.name)")
                            .foregroundColor(.white)
                            .frame(width: 100.0, height: 100.0)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                }
                NavigationLink(destination: RestaurantListView(business: business)) {
                    Text("SeeAll")
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 100.0)
                        .background(Color.red)
                        .cornerRadius(20)
                }
                
            }
            .frame(height: 100)
            Spacer()
        }.onAppear(perform: {
            manager.getNearByRestaurants(){ (result) in
                switch result {
                case .success(let searchData):
                    self.business = searchData.businesses
                    self.nearByBusiness = searchData.nearByRestaurants
                case .failure(_):
                    break
                }
            }
        })
    }
}

struct NearByRestaurants_Previews: PreviewProvider {
    static var previews: some View {
        NearByRestaurants()
    }
}
