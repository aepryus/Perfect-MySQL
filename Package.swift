// swift-tools-version:5.4
//  Package.swift
//  Perfect-MySQL
//
//  Created by Kyle Jessup on 3/22/16.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
// ===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
// ===----------------------------------------------------------------------===//
//

import PackageDescription

let package = Package(
	name: "PerfectMySQL",
	products: [
		.library(name: "PerfectMySQL", targets: ["PerfectMySQL"])
	],
	dependencies: [
		.package(url: "https://github.com/RockfordWei/Perfect.git", from: "5.6.13")
		],
	targets: [
        .systemLibrary(name: "mysqlclient", pkgConfig: "mysqlclient", providers: [
            .apt(["libmysqlclient-dev"]),
            .brew(["mysqlclient"])
        ]),
		.target(name: "PerfectMySQL", dependencies: ["mysqlclient", .product(name: "PerfectCRUD", package: "Perfect")]),
		.testTarget(name: "PerfectMySQLTests", dependencies: ["PerfectMySQL"])
	]
)
