//
//  TrackModelView.swift
//  AwiTrackList
//
//  Created by Richard Martin on 07/02/2023.
//

import Foundation
import SwiftUI


protocol TrackModelViewObserver{
    func trackModelViewUpdated()
}

class TrackModelView : Equatable,Hashable, ObservableObject, TrackModelObserver {
    func change(name: String) {
        if name != self.name{
            self.name = name
        }
    }
    private var observers : [TrackModelViewObserver] = []
    
    func register(trackModelViewObserver : TrackModelViewObserver){
            observers.append(trackModelViewObserver)
        }
        private func notifyAll(){
            for o in observers{
                o.trackModelViewUpdated()
            }
        }
    
    
    static func == (lhs: TrackModelView, rhs: TrackModelView) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
    hasher.combine(self.id)
    }
    
    func changeTrackName(trackName : String){
//        debugPrint("change name trackVM")
            if self.name != trackName{
                self.name = trackName
                notifyAll()
            }
        }
    
    func changeArtistName(artist : String){
            if self.artist != artist{
                self.artist = artist
                notifyAll()
            }
        }
    func changeAlbumName(album : String){
            if self.album != album{
                self.album = album
                notifyAll()
            }
        }
    
    public private(set) var id : UUID
    var model : TrackModel
    
    init(trackList: TrackModel = TrackModel()) {
        self.id = UUID()
        self.model = trackList
        self.name = trackList.trackName
        self.artist = trackList.artistName
        self.album = trackList.collectionName
        trackList.register(trackModelObserver :self)
    }
    
    @Published var name : String{
        didSet{
            if name != self.model.trackName {
                self.model.trackName = name
                notifyAll()
            }
        }
    }
    
    @Published var artist : String{
        didSet{
            if artist != self.model.artistName {
                self.model.artistName = artist
                notifyAll()
            }
        }
    }
    
    @Published var album : String{
        didSet{
            if album != self.model.collectionName {
                self.model.collectionName = album
                notifyAll()
            }
        }
    }
    
}
