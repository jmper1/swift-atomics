// swift-tools-version:5.5
//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2020-2022 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
  name: "swift-atomics",
  products: [
    .library(
      name: "Atomics",
      targets: ["Atomics"]),
    .library(
      name: "_AtomicsShims",
      type: .static,
      targets: ["_AtomicsShims"]),
  ],
  targets: [
    .target(
      name: "_AtomicsShims",
      exclude: [
        "CMakeLists.txt"
      ]
    ),
    .target(
      name: "Atomics",
      dependencies: ["_AtomicsShims"],
      exclude: [
        "CMakeLists.txt",
        "HighLevelTypes.swift.gyb",
        "PointerConformances.swift.gyb",
        "IntegerConformances.swift.gyb",
        "AtomicBool.swift.gyb",
        "AtomicLazyReference.swift.gyb",
      ]
    ),
    .testTarget(
      name: "AtomicsTests",
      dependencies: ["Atomics"],
      exclude: [
        "main.swift",
        "Basics.swift.gyb"
      ]
    ),
  ]
)
