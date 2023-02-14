//
//  TrackUIView.swift
//  AwiTrackList
//
//  Created by Richard Martin on 07/02/2023.
//

import SwiftUI

struct TrackUIView: View {
    @ObservedObject var atrack : TrackModelView
    @State var name : String
    @State var artist : String
    @State var album : String
    init(atrack: TrackModelView) {
        self.atrack = atrack
        _name = State(initialValue: atrack.name)
        _artist = State(initialValue: atrack.artist)
        _album = State(initialValue: atrack.album)
    }
    let cols : [GridItem] = [GridItem(.flexible(),alignment: .trailing),GridItem(.flexible(),alignment: .leading)]
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                LazyVGrid(columns: cols, alignment: .center) {
                    Text("Track : "); TextField("track : ",text:$name).onSubmit {
                        print("changing name")
                        atrack.changeTrackName(trackName: name)
                        
                    }
                    Text("Artist : ");TextField("artist : ",text:$artist).onSubmit {
                        atrack.changeArtistName(artist: artist)
                    }
                    Text("Album : ");TextField("album : ",text:$album).onSubmit {
                        atrack.changeAlbumName(album: album)
                    }
                }
                Spacer()
            }
            Spacer()
        }
        
    }
    
}

struct TrackUIView_Previews: PreviewProvider {
    static var previews: some View {
        TrackUIView(atrack: TrackModelView(trackList: TrackModel(trackName: "test",artistName: "richard",collectionName: "test album",releaseDate: "never")))
    }
}
