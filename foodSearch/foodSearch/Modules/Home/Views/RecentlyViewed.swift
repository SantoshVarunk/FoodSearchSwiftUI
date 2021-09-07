//
//  RecentlyViewed.swift
//  foodSearch
//
//  Created by Santosh Karnati on 07/09/21.
//

import SwiftUI

struct RecentlyViewed: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: BusinessDetails.entity(), sortDescriptors: [])
    
    var businessDetails: FetchedResults<BusinessDetails>
    var body: some View {
        Text("Recently  Visited Business")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color.red)
            .multilineTextAlignment(.leading)
            .lineLimit(1)
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(businessDetails) { business in
                    NavigationLink(destination: BusinessDetailsView(business: BusinessDetailsResponse(model: business), businessId: nil)){
                    Text(business.name ?? "--")
                        .foregroundColor(.white)
                        .frame(width: 100.0, height: 100.0)
                        .background(Color.red)
                        .cornerRadius(20)
                        
                    }
                }
            }
            .frame(height: 100)
            Spacer()
        }
    }
}

struct RecentlyViewed_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyViewed()
    }
}
