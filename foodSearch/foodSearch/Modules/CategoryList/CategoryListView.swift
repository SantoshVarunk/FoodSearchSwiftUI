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
                                .padding(.leading, 20.0)
                                .frame(maxWidth: .infinity, minHeight: 100.0)
                                .background(Color.red)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(categories: [Categories]())
    }
}
