//
//  ListViewModel.swift
//  AwiTrackList
//
//  Created by Richard Martin on 07/02/2023.
//

import Foundation

class ListModelView : ObservableObject, TrackModelViewObserver{
    func trackModelViewUpdated() {
        self.objectWillChange.send()
    }
    
    
    func change(name: String,at_index:Int) {
        self.list[at_index].name=name
        self.objectWillChange.send()
    }
    
    
    
    @Published var list : [TrackModelView]
    
            
    init(list : [TrackModelView]){
            self.list = list
            for tvm in list{
                tvm.register(trackModelViewObserver: self)
            }
    }
    subscript(index : Int) -> TrackModelView{
            get{
                return list[index]
            }
            set(newValue){
                list[index] = newValue
            }
        }
    
    func changeTrackName(trackName : String, index : Int){
            list[index].name = trackName
        }
        
        func remove(indexSet : IndexSet){
            list.remove(atOffsets: indexSet)
            //previent la view
            self.objectWillChange.send()
        }
        func move(indexSet : IndexSet, index : Int){
            list.move(fromOffsets: indexSet, toOffset: index)
            self.objectWillChange.send()
        }
}
