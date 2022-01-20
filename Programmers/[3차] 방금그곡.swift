//
//  [3차] 방금그곡.swift
//  
//
//  Created by chihoooon on 2022/01/20.
//

import Foundation

let noteDict: [String: String] = [
    "C": "0", "C#" : "1", "D": "2", "D#": "3",
    "E": "4", "E#": "5", "F": "6", "F#": "7",
    "G": "8", "G#": "9", "A": "A", "A#": "B",
    "B": "C"
]

func translate(_ str: String) -> String {
    var translated = ""
    
    for i in 0..<str.count {
        let index = str.index(str.startIndex, offsetBy: i)
        if str[index] == "#" {
            let prevIndex = str.index(str.startIndex, offsetBy: i - 1)
            let replacedString = String(str[prevIndex...index])
            translated.removeLast()
            translated += noteDict[replacedString]!
        }
        else {
            let replacedString = String(str[index])
            translated += noteDict[replacedString]!
        }
    }
    return translated
}

func calcPlayTime(_ start: String, end: String) -> Int {
    let startHHMM = start.components(separatedBy: ":")
    let endHHMM = end.components(separatedBy: ":")
    
    let startTime = Int(startHHMM[0])! * 60 + Int(startHHMM[1])!
    let endTime = Int(endHHMM[0])! * 60 + Int(endHHMM[1])!
    
    return endTime - startTime
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer = "(None)"
    var longestPlayTime = 0
    
    musicinfos.forEach {
        let musicinfo = $0.components(separatedBy: ",")
        let playTime = calcPlayTime(musicinfo[0], end: musicinfo[1])
        let musicName = musicinfo[2]
        let note = translate(musicinfo[3])
        let melody = translate(m)
        var perfectNote = ""
        
        if note.count > playTime {
            let index = note.index(note.startIndex, offsetBy: playTime)
            perfectNote = String(note[note.startIndex..<index])
        }
        else {
            let count = playTime / note.count
            let remainder = playTime % note.count
            perfectNote = String(repeating: note, count: count)
            
            if remainder != 0 {
                let index = note.index(note.startIndex, offsetBy: remainder)
                perfectNote += String(note[note.startIndex..<index])
            }
        }
        
        if perfectNote.contains(melody) && longestPlayTime < playTime {
            answer = musicName
            longestPlayTime = playTime
        }
    }
    
    return answer
}
