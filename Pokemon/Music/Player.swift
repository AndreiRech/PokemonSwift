//
//  AudioPlayer.swift
//  byteStrum
//
//  Created by Agatha Schneider and Adriel de Souza on 08/04/25.
//

// Creditos ChatGPT

import AVFoundation

class Player {
    private var audioPlayer: AVAudioPlayer?
    private var isPlaying = false
    private var currentSong: String?

    // Play a song
    func play(song filePath: String) {
        guard let fileURL = URL(string: filePath) else {
            //print("Invalid file path.")
            return
        }
        
        do {
            if let currentSong = self.currentSong, currentSong != filePath {
                stop()  // Stop the current song if different
            }
            
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            audioPlayer?.play()
            isPlaying = true
            self.currentSong = filePath
            //print("Playing song: \(filePath)")
        } catch {
            //print("Error loading the song: \(error.localizedDescription)")
        }
    }
    

    // Pause the current song
    func pause() {
        if isPlaying {
            audioPlayer?.pause()
            isPlaying = false
            //print("Song paused.")
        } else {
            //print("No song is currently playing.")
        }
    }

    // Resume the current song
    func resume() {
        if !isPlaying, let audioPlayer = audioPlayer {
            audioPlayer.play()
            isPlaying = true
            //print("Resuming song.")
        } else {
            //print("No song is currently paused.")
        }
    }

    // Stop the current song
    func stop() {
        audioPlayer?.stop()
        isPlaying = false
        //print("Song stopped.")
    }

    // Change the song (stop the current one and play a new one)
    func changeSong(to newSongPath: String) {
        //print("Changing song...")
        stop()  // Stop the current song
        play(song: newSongPath)  // Play the new song
    }

    // Check if the player is currently playing
    func isCurrentlyPlaying() -> Bool {
        return isPlaying
    }
}
