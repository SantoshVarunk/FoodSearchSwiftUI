//
//  Home.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct Home: View {
    private var manager: ContentManager = ContentManager()
    @State var category = [Categories]()
    @State var foodCategory = [Categories]()
    var body: some View {
        VStack{
            Text("Search By")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(foodCategory, id: \.self) { food in
                        NavigationLink(destination: SearchView(category: food.title)) {
                            Text("\(food.title)")
                                .foregroundColor(.white)
                                .frame(width: 100.0, height: 100.0)
                                .background(Color.red)
                                .cornerRadius(20)
                        }
                    }
                    NavigationLink(destination: CategoryListView(categories: category)) {
                        Text("SeeAll")
                            .foregroundColor(.white)
                            .frame(width: 100.0, height: 100.0)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                }
            }
            .frame(height: 100)
            NearByRestaurants()
            RecentlyViewed()
            Spacer()
        }.onAppear(perform: {
            manager.getAllCategory(){ (result) in
                switch result {
                case .success(let cate):
                    self.category = cate.categories
                    self.foodCategory = cate.foodCategory
                case .failure(_):
                    break
                }
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
