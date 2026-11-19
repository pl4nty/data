-- Threat: !InfrastructureShared
-- Name: MpTrustAnchors_XplatTesting
-- Type: 23

local l_0_0 = {
  [[
    {
        "version": 1,
        "environment": "XplatTesting",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [
            "83688F2AEF71386E0936C4B3013B07E8E0C796D8427716DD48B2A63D79509129"
        ],
        "rootThumbs": [
            "847DF6A78497943F27FC72EB93F9A637320A02B561D0A91B09E87A7807ED7C61",
            "9BD0F7CF6ED967519391BCD49A958867B955A60F22DE5B8978474A2FCBAD81A6"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "XplatTesting",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [
            "83688F2AEF71386E0936C4B3013B07E8E0C796D8427716DD48B2A63D79509129"
        ],
        "rootThumbs": [
            "847DF6A78497943F27FC72EB93F9A637320A02B561D0A91B09E87A7807ED7C61",
            "9BD0F7CF6ED967519391BCD49A958867B955A60F22DE5B8978474A2FCBAD81A6"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_XplatTesting", l_0_0, 1)
local l_0_1 = {
  "/etc/ssl/certs",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "Linux_CertStore_List", l_0_1, 1)
