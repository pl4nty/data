-- Threat: !InfrastructureShared
-- Name: MpTrustAnchors_USSec
-- Type: 23

local l_0_0 = {
  [[
    {
        "version": 1,
        "environment": "USSec",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "bcbd26b7f291cda07a39b02d04cc43de089d2cefb47d29961a90a9583339b2d7"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "USSec",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "bcbd26b7f291cda07a39b02d04cc43de089d2cefb47d29961a90a9583339b2d7"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_USSec", l_0_0, 1)
local l_0_1 = {
  [[
    {
        "version": 1,
        "environment": "GW_USSec",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "bcbd26b7f291cda07a39b02d04cc43de089d2cefb47d29961a90a9583339b2d7"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "GW_USSec",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "bcbd26b7f291cda07a39b02d04cc43de089d2cefb47d29961a90a9583339b2d7"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_GW_USSec", l_0_1, 1)
