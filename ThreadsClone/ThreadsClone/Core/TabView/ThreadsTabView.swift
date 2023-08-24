//
//  TabView.swift
//  ThreadsClone
//
//  Created by Fenuku kekeli on 8/17/23.
//

import SwiftUI

struct ThreadsTabView: View {
    
           @State private var selectedTab = 0
           @State private var showCreateThreadView = false
           var body: some View {
               TabView(selection: $selectedTab) {
//
                   FeedView()
                       .tabItem {
                     
                           Image (systemName: selectedTab == 1 ? "house.fill" : "house")
                               .environment (\.symbolVariants, selectedTab == 1 ? .fill : .none)
                       
                       
                   }
                       .onAppear{ selectedTab = 0}
                       .tag(0)
                   
                  Explore()
                       .tabItem {
                           
                
                           Image(systemName: "magnifyingglass")
                        
                   
                       
                   }.tag(1)
                       .onAppear{ selectedTab = 1}
                   
                  Text("")
                       .tabItem {
                           
                           Image(systemName: "plus")
                       
                   }.tag(2)
                     

                  ActivityView()
                       .tabItem {
                           
                                  Image (systemName: selectedTab == 3 ? "heart.fill" : "heart")
                                      .environment (\.symbolVariants, selectedTab == 3 ? .fill : .none)
                       
                       }  .onAppear{ selectedTab = 3}
                       .tag(3)
                   
                   
                   CurrentUserProfileView()
                       .tabItem {
                    
                           Image (systemName: selectedTab == 4 ? "person.fill" : "person")
                               .environment (\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    
                       
                   }
                       .onAppear{ selectedTab = 4}
                       .tag(4)
                   
               
                  
                   
               }
               .onChange(of: selectedTab, perform: { newValue in
                   showCreateThreadView = selectedTab == 2
               })
               .sheet(isPresented: $showCreateThreadView, onDismiss: { selectedTab = 0}, content: {
                   CreateThreadview()
               })
               .accentColor(.black)
           }
       }
 

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsTabView()
    }
}
