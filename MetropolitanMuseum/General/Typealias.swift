//
//  Typealias.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import UIKit

typealias EmptyBlock = () -> Void

typealias ResultUIImage = Result<UIImage, Error>
typealias ResultUIImageBlock = (ResultUIImage) -> Void

typealias MuseumObjectsModelResult = Result<MuseumObjectsModel, InternetError>
typealias MuseumObjectsModelResultBlock = (MuseumObjectsModelResult) -> Void

typealias MuseumObjectModelResult = Result<MuseumObjectModel, InternetError>
typealias MuseumObjectModelResultBlock = (MuseumObjectModelResult) -> Void

typealias MuseumDepartmentsResult = Result<MuseumDepartmentModel, InternetError>
typealias MuseumDepartmentsResultBlock = (MuseumDepartmentsResult) -> Void
