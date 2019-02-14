//
//  PlayerParameters.swift
//  YouTubePlayer
//
//  Created by Islam Qalandarov on 5/1/18.
//

import Foundation

struct PlayerVars: Encodable {
    var playsInline: Bool {
        get { return playsinline.boolValue }
        set { playsinline = newValue.stringValue }
    }

    var showInfo: Bool {
        get { return showinfo.boolValue }
        set { showinfo = newValue.stringValue }
    }

    var showControls: Bool {
        get { return controls.boolValue }
        set { controls = newValue.stringValue }
    }

    var showRelatedVideosWhenFinished: Bool {
        get { return rel.boolValue }
        set { rel = newValue.stringValue }
    }

    var startAt: Int {
        get { return start.intValue }
        set { start = String(newValue) }
    }

    var list: String? = nil {
        didSet { listType = "playlist" }
    }

    // The variables that will be encoded
    private var playsinline = false.stringValue
    private var showinfo = false.stringValue
    private var controls = false.stringValue
    private var rel = false.stringValue
    private var start = String(0)

    private var listType: String? = nil
}

private extension String {
    var boolValue: Bool {
        return self == "1"
    }
    var intValue: Int {
        return Int(self) ?? 0
    }
}

private extension Bool {
    var stringValue: String {
        return self ? "1" : "0"
    }
}

private extension Int {
    var stringValue: String {
        return String(self)
    }
}

public class PlayerParameters: Encodable {

    var videoId: String? = nil

    private var playerVars = PlayerVars()

    // Hard-coded values
    private let height = "100%"
    private let width  = "100%"
    private let events = [
        "onReady": "onReady",
        "onStateChange": "onStateChange",
        "onPlaybackQualityChange": "onPlaybackQualityChange",
        "onError": "onPlayerError"
    ]

}

// Properties of the playerVars
extension PlayerParameters {

    var list: String? {
        get { return playerVars.list }
        set { playerVars.list = newValue }
    }

    public var playsInline: Bool {
        get { return playerVars.playsInline }
        set { playerVars.playsInline = newValue }
    }

    public var showInfo: Bool {
        get { return playerVars.showInfo }
        set { playerVars.showInfo = newValue }
    }

    public var showControls: Bool {
        get { return playerVars.showControls }
        set { playerVars.showControls = newValue }
    }

    public var showRelatedVideoWhenFinished: Bool {
        get { return playerVars.showRelatedVideosWhenFinished }
        set { playerVars.showRelatedVideosWhenFinished = newValue }
    }

    public var startAt: Int {
        get { return playerVars.startAt }
        set { playerVars.startAt = newValue }
    }

}
