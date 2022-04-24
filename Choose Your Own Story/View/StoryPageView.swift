//
//  StoryPageView.swift
//  Choose Your Own Story
//
//  Created by Olivier Van hamme on 24/04/2022.
//

import SwiftUI

// MARK: - LIBRARIES
import SwiftUI



struct StoryPageView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let story: Story
    let pageIndex: Int
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            ScrollView {
                Text(story[pageIndex].text)
            }
            
            ForEach(story[pageIndex].choices,
                    id: \Choice.text) { choice in
                NavigationLink(destination: StoryPageView(story: story,
                                                          pageIndex: choice.destination)) {
                    Text(choice.text)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.25))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle("Page \(pageIndex + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS


}






// PREVIEWS //////////////////////////////////////
struct NonlinearStory_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        StoryPageView(story: story, pageIndex: 0)
    }
}
