//
//  Typealias.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

typealias MuseumObjectsModelResult = Result<MuseumObjectsModel, InternetError>
typealias MuseumObjectsModelResultBlock = (MuseumObjectsModelResult) -> Void

typealias MuseumObjectModelResult = Result<MuseumObjectModel, InternetError>
typealias MuseumObjectModelResultBlock = (MuseumObjectModelResult) -> Void
