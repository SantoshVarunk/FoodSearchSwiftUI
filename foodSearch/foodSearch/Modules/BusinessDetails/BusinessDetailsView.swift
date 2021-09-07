//
//  BusinessDetailsView.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct BusinessDetailsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    var manager: ContentManager = ContentManager()
    @State var business: BusinessDetailsResponse?
    
    var businessId: String?
    var body: some View {
        VStack{
            if let imageData = business?.imageData {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable().scaledToFit()
            }
            Section(header: Text("Details").italic().bold()) {
                VStack{
                    HStack{
                        Text("Business Name")
                        Spacer()
                        Text(business?.name ?? "---")
                    }
                    HStack{
                        Text("Active").foregroundColor(.green)
                        Spacer()
                    }
                }
                .padding(.horizontal, 20.0)
                
            }
            .padding(.top, 30.0)
            Section(header: Text("Location").italic().bold()) {
                VStack{
                    HStack{
                        Text("Address")
                        Spacer()
                        Text(business?.location?.address1 ?? "---")
                    }
                    
                    HStack{
                        Text("City")
                        Spacer()
                        Text(business?.location?.city ?? "---")
                    }
                    HStack{
                        Text("State")
                        Spacer()
                        Text(business?.location?.state ?? "---")
                    }
                    HStack{
                        Text("Country")
                        Spacer()
                        Text(business?.location?.country ?? "---")
                    }
                }
            }
            .padding([.top, .leading, .trailing], 20.0)
            Spacer()
        }.onAppear(perform: {
            guard business != nil else {
                manager.getBusinessDetails(id: businessId!) { result in
                    switch result {
                    case .success(let business):
                        self.business = business
                        let businessDB = BusinessDetails(context: viewContext)
                        businessDB.image_url = business.image_url
                        businessDB.is_closed = business.is_closed ?? false
                        businessDB.name = business.name
                        businessDB.rating = business.rating
                        businessDB.businessId = business.id
                        let locationDB = LocationDetails(context: viewContext)
                        locationDB.address1 = business.location?.address1
                        locationDB.city = business.location?.city
                        locationDB.country = business.location?.country
                        locationDB.state = business.location?.state
                        locationDB.zip_code = business.location?.zip_code
                        businessDB.location = locationDB
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(_):
                        break
                    }
                }
                return
            }
        }).navigationTitle("Business Details")
    }
}

struct BusinessDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessDetailsView(businessId: "UA2M9QFZghe-9th2KwLoWQ")
    }
}
