//
//  MuseumObjectModel.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumObjectModel

struct MuseumObjectModel: Decodable {
    let objectID: Int
    let isHighlight: Bool
    let accessionNumber: String
    let accessionYear: String
    let isPublicDomain: Bool
    let primaryImage: String
    let primaryImageSmall: String
    let additionalImages: [String]
//    let constituents: [String: Any]
    let department: String
    let objectName: String
    let title: String
    let culture: String
    let period: String
    let dynasty: String
    let reign: String
    let portfolio: String
    let artistRole: String
    let artistPrefix: String
    let artistDisplayName: String
    let artistDisplayBio: String
    let artistSuffix: String
    let artistAlphaSort: String
    let artistNationality: String
    let artistBeginDate: String
    let artistEndDate: String
    let artistGender: String
    let artistWikidata_URL: String
    let artistULAN_URL: String
    let objectDate: String
    let objectBeginDate: Int
    let objectEndDate: Int
    let medium: String
    let dimensions: String
//    let dimensionsParsed: Float
//    let measurements: [Measurements]
    let creditLine: String
    let geographyType: String
    let city: String
    let state: String
    let county: String
    let country: String
    let region: String
    let subregion: String
    let locale: String
    let locus: String
    let excavation: String
    let river: String
    let classification: String
    let rightsAndReproduction: String
    let linkResource: String
    let metadataDate: String
    let repository: String
    let objectURL: String
    let tags: [String]?
    let objectWikidata_URL: String
    let isTimelineWork: Bool
    let GalleryNumber: String
    
    // MARK: Measurements
    
    struct Measurements: Decodable {
        let elementName: String
        let elementDescription: String
        let elementMeasurements: ElementMeasurement
        
        // MARK: ElementMeasurement
        
        struct ElementMeasurement: Decodable {
            let height: Float
            let length: Float
            let width: Float
            
            enum CodingKeys: String, CodingKey {
                case height = "Height"
                case length = "Length"
                case width = "Width"
            }
        }
    }
}
