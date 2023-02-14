//
//  TrackModel.swift
//  AwiTrackList
//
//  Created by Richard Martin on 07/02/2023.
//

import Foundation

protocol TrackModelObserver{
    func changeTrackName(trackName: String)
}


class TrackModel {
    var trackName : String{
        didSet{
            for o in observers { o.changeTrackName(trackName: self.trackName) }
        }
    }
    var artistName : String
    var collectionName : String
    var releaseDate : String
    
    private var observers : [TrackModelObserver] = []
    
    init(trackName: String = "Name", artistName: String = "Artist", collectionName: String = "Collection", releaseDate: String = "release") {
        self.trackName = trackName
        self.artistName = artistName
        self.collectionName = collectionName
        self.releaseDate = releaseDate
    }
    
    func register(trackModelObserver o: TrackModelObserver){
        observers.append(o)
    }

    
}
