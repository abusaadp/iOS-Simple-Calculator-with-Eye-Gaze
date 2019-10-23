//
//  SCNVector3+Extensions.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import SceneKit

func SCNVector3FromSIMDFloat4(_ float4: simd_float4) -> SCNVector3 {
    return SCNVector3(x: float4.x, y: float4.y, z: float4.z)
}

extension SCNVector3 {

    var simdVector3: simd_float3 {
        return simd_make_float3(self.x, self.y, self.z)
    }

}
