-- Threat: !InfrastructureShared
-- Name: MpTrustAnchors_MpTesting
-- Type: 23

local l_0_0 = {
  [[
    {
        "version": 1,
        "environment": "MpTesting",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "0f2de5cb4e3e240a2635510c6085763a8a3eb882fb0495428f82e20044c24e44"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "MpTesting",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [
            "50a0a57796ce1d8bee7c74c5541b66639e5ecf688901d8f16db388210b60718c"
        ],
        "rootThumbs": [
            "6108d51df89fb6095bbd51edd95465ce8f6b70c1c85c2f0aa9e4629d6d06ed6e",
            "0f2de5cb4e3e240a2635510c6085763a8a3eb882fb0495428f82e20044c24e44"
        ]
    }
   ]],
  ""
}
local l_0_1 = {
  [[
    {
        "version": 1,
        "environment": "MpTestingNoTLS",
        "usage": 1,
        "hashType": 0,
        "rootThumbs": [
            "163ebddbb334b8eda905f475bb8404787595e40057e62586153f32e7c619259d",
            "8dbcfae3f50d1d634edd019430b1ca3cacdab24e23177f48cee358a7c30e3d35"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_MpTesting", l_0_0, 1)
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_MpTestingNoTLS", l_0_1, 1)
