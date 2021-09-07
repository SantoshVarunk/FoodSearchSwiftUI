//
//  CategoryListView.swift
//  foodSearch
//
//  Created by Santosh Karnati on 06/09/21.
//

import SwiftUI

struct CategoryListView: View {
    var categories: [Categories]
    var body: some View {
        VStack{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                LazyVStack(spacing: 20){
                    ForEach(categories, id: \.self) { categorie in
                        
                        NavigationLink(destination: SearchView(category: categorie.title)) {
                            Text("\(categorie.title)")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, minHeight: 100.0)
                                .background(Color.red).cornerRadius(20).shadow(color: .black, radius: 10, x: 0.0, y: 7.0)
                        }
                    }
                }
                .padding(.horizontal, 30.0)
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categories: [Categories]())
    }
}
