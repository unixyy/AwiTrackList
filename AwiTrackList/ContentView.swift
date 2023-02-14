//
//  ContentView.swift
//  AwiTrackList
//
//  Created by Richard Martin on 07/02/2023.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var trackList : ListModelView = ListModelView(
        list:[
        TrackModelView(trackList: TrackModel(trackName: "Tik Tok",artistName: "Kesha",collectionName: "first Album",releaseDate: "never")),
        TrackModelView(trackList: TrackModel(trackName: "Nothin' on u",artistName: "B.o.B",collectionName: "second Album",releaseDate: "never")),
        TrackModelView(trackList: TrackModel(trackName: "CAN'T HOLD US",artistName: "Macklemore",collectionName: "third Album",releaseDate: "never")),
        TrackModelView(trackList: TrackModel(trackName: "Viva la Vida",artistName: "Coldplay",collectionName: "fourth Album",releaseDate: "never")),
        TrackModelView(trackList: TrackModel(trackName: "Birds",artistName: "Imagine Dragon",collectionName: "fifth Album",releaseDate: "never")),
        ])
    var body: some View {
        VStack(spacing: 0.0) {
            NavigationView{
                List {
                    ForEach(trackList.list, id: \.self){ item in
                        NavigationLink(destination: TrackUIView(atrack : item)){
                            Text(item.name).swipeActions{
                                Button("Hello"){ print("\(item)") }.tint(.indigo)
                            }
                        }
                    }
                    .onDelete{ indexSet in
                        trackList.list.remove(atOffsets: indexSet)
                    }
                    .onMove{ indexSet, index in
                        trackList.list.move(fromOffsets: indexSet, toOffset: index)
                    }
                }
                EditButton()
            }
            
            Button {
                trackList[0].name = "un vrai nom"
            } label: {
                Text("Edit")
            }
                .foregroundColor(.white)
                .padding(10)
                .background(.blue)
                .cornerRadius(10)
            

            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
