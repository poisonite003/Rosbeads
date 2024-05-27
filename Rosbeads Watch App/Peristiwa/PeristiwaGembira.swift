//
//  PeristiwaGembira.swift
//  Rosbeads Watch App
//
//  Created by Jonathan Andrew Yoel on 21/05/24.
//

import SwiftUI
import Foundation
import AVFoundation
import WatchKit

struct PeristiwaGembira: View {
    @State private var progress: Double = 0.0 // Progress from 0.0 to 1.0
    @State private var imageName: String = "SalibTengahNorm" // Initial image is a cross
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentBeadIndex: Int = 0 // Track the current bead index
    @State private var progressStarted: Bool = false // Track if the progress has started
    @State private var progressComplete: Bool = false // Track if the progress is complete

    // Array of audio file names for each bead
    let audioFiles = [
        "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3",
        "Peristiwa1.m4a", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3","Audio1.mp3", "Audio1.mp3",
        "Peristiwa2.m4a", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3","Audio1.mp3", "Audio1.mp3",
        "Pertistiwa3.m4a", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3","Audio1.mp3", "Audio1.mp3",
        "Peristiwa4.m4a", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3","Audio1.mp3", "Audio1.mp3",
        "Peristiwa5.m4a", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3", "Audio1.mp3","Audio1.mp3", "Audio1.mp3","Salam ya Ratu.m4a",
        // Add more audio file names here corresponding to each bead
    ]

    var body: some View {
        ZStack {
            // Background circle with beads
            BeadCircle(progress: progress, beadCount: 59, spacing: 0.7, beadSize: 5, largeBeadSize: 10, specialIndices: [0, 4, 15, 26, 37, 48], color: .gray.opacity(0.7))
                .frame(width: 175, height: 175)
            
            BeadCircle(progress: progress, beadCount: 59, spacing: 0.7, beadSize: 5, largeBeadSize: 10, specialIndices: [0, 4, 15, 26, 37, 48], color: .red)
                .frame(width: 175, height: 175)
            
            if progressComplete {
//                Text("DONE")
//                    .font(.largeTitle)
//                    .bold()
//                    .foregroundColor(.green)
                Image("BurungDONE")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 100)
            } else {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .onTapGesture {
                        if !progressStarted {
                            // Toggle between cross images
                            if imageName == "SalibTengahNorm" {
                                imageName = "SalibTengahGembira"
                            }
                            progressStarted = true // Start the progress
                            WKInterfaceDevice.current().play(WKHapticType.start)
                        } else {
                            // Play audio for the current bead
                            playAudio(for: currentBeadIndex)
                            
                            // Increment progress by one bead
                            if currentBeadIndex < 59 {
                                let increment = 1.0 / 59.0
                                self.progress += increment
                            }
                            
                            // Move to the next bead
                            if currentBeadIndex < audioFiles.count - 1 {
                                currentBeadIndex += 1
                            } else {
                                currentBeadIndex = 0 // Reset to the first bead if at the end
                            }
                        }
                    }
                    .disabled(progress >= 1.0) // Disable tap gesture if progress is complete
                    .accessibility(label: Text("Central Image"))
                    .accessibility(addTraits: .isButton)
                    .accessibilityAction {
                        //
                    }
            }
        }
        .padding(20)
        .onChange(of: progress) { newValue in
            if newValue >= 1.0 {
                // Play success haptic feedback
                WKInterfaceDevice.current().play(WKHapticType.success)
                progressComplete = true
            }
        }
    }
    
    // Function to play audio for a specific bead index
    func playAudio(for index: Int) {
        WKInterfaceDevice.current().play(WKHapticType.start)
        guard index >= 0 && index < audioFiles.count else {
            print("Invalid audio index")
            return
        }
        
        let audioFileName = audioFiles[index]
        guard let path = Bundle.main.path(forResource: audioFileName, ofType: nil) else {
            print("Audio file not found: \(audioFileName)")
            return
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

#Preview {
    PeristiwaGembira()
}
