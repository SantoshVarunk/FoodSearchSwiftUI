//
//  SearchView.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct SearchView: View {
    var manager: ContentManager = ContentManager()
    @State var business: [Business] = [Business]()
    @State var searchText = ""
    let category: String
    
    var body: some View {
        VStack{
            List{
                TextField("Type your search",text: $searchText).onChange(of: searchText) {
                    manager.getBusinessBySearchText(text: $0, category: category) { result in
                        switch result {
                        case .success(let cate):
                            self.business = cate.businesses
                        case .failure(_):
                            break
                        }
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ForEach(business, id:\.self){searchText in
                    LazyHStack{
                        VStack{
                            Image(systemName: "heart.fill").data(url: URL(string: searchText.image_url ?? "")!).scaledToFill()
                        }
                        .frame(width: 50, height: 50)
                        Text(searchText.name)
                            .padding(.leading)
                    }
                }
            }
        }.navigationBarTitle(Text("Search"))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView( category: "Food")
    }
}
