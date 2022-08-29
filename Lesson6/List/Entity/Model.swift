//
//  Model.swift
//  Lesson6
//
//  Created by Maksim Ponomarev on 06.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

class Model {

    struct Artist {

      let identifier: Int
      let name: String
      let albums: [Album]

      struct Album {

        let name: String
        let songs: [Song]
        let date: Date
      }

      struct Song {

        let name: String
        let duration: TimeInterval
      }
    }

    func getArtistList() -> [Artist] {
      return [Artist(
        identifier: 1111,
        name: "John Lennon",
        albums: [
          Artist.Album(
            name: "Imagine",
            songs: [
              Artist.Song(name: "Imagine", duration: 180),
              Artist.Song(name: "Crippled Inside", duration: 227),
              Artist.Song(name: "Jealous Guy", duration: 254),
              Artist.Song(name: "It's So Hard", duration: 205),
              Artist.Song(name: "I Don't Want to Be a Soldier", duration: 365),
              Artist.Song(name: "Gimme Some Truth", duration: 196),
              Artist.Song(name: "Oh My Love", duration: 170),
              Artist.Song(name: "How Do You Sleep?", duration: 336),
              Artist.Song(name: "How?", duration: 223),
              Artist.Song(name: "Oh Yoko!", duration: 260)
            ],
            date: Date(timeIntervalSince1970: 53222400)
          )
        ]
      )]
    }
}



