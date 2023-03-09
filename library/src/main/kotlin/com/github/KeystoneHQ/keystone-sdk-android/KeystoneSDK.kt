package com.github.KeystoneHQ.keystone-sdk-android

import com.sparrowwallet.hummingbird.UR
import com.sparrowwallet.hummingbird.UREncoder

class KeystoneSDK {
    external fun parseSolSignature(cbor: String): String

    public fun encodeQR(type: String, cbor: String, maxFragmentLen: Int = 100, minFragmentLen: Int = 10): UREncoder {
        val ur = UR.fromBytes(type, cbor.toByteArray());
        return UREncoder(ur, maxFragmentLen, minFragmentLen, 0)
    }

    companion object {
        init {
            System.loadLibrary("ur_registry_ffi")
        }
    }
}
