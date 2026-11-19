-- Threat: !InfrastructureShared
-- Name: MpTrustAnchors_USNat
-- Type: 23

local l_0_0 = {
  [[
    {
        "version": 1,
        "environment": "USNat",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "7a17244276196107b9e16dfe9555959d7a69f3d962a665f47c9f1fd318846653"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "USNat",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "7a17244276196107b9e16dfe9555959d7a69f3d962a665f47c9f1fd318846653"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_USNat", l_0_0, 1)
local l_0_1 = {
  [[
    {
        "version": 1,
        "environment": "GW_USNat",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "7a17244276196107b9e16dfe9555959d7a69f3d962a665f47c9f1fd318846653"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "GW_USNat",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [],
        "rootThumbs": [
            "7a17244276196107b9e16dfe9555959d7a69f3d962a665f47c9f1fd318846653"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_GW_USNat", l_0_1, 1)
