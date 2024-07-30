//
//  Typealias.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

typealias EmptyBlock = () -> Void

typealias MuseumObjectsModelResult = Result<MuseumObjectsModel, InternetError>
typealias MuseumObjectsModelResultBlock = (MuseumObjectsModelResult) -> Void

typealias MuseumObjectModelResult = Result<MuseumObjectModel, InternetError>
typealias MuseumObjectModelResultBlock = (MuseumObjectModelResult) -> Void

typealias MuseumDepartmentsResult = Result<MuseumDepartmentModel, InternetError>
typealias MuseumDepartmentsResultBlock = (MuseumDepartmentsResult) -> Void
