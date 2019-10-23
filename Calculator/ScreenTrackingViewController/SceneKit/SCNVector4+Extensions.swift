//
//  SCNVector4+Extensions.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import SceneKit

extension SCNVector4 {

    init(_ simdFloat3: simd_float3, w: Float) {
        self.init(simdFloat3.x, simdFloat3.y, simdFloat3.z, w)
    }

    var vector3: SCNVector3 {
        return SCNVector3(self.x, self.y, self.z)
    }

    var simdVector4: simd_float4 {
        return simd_make_float4(self.x, self.y, self.z, self.w)
    }

}
