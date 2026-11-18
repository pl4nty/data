-- Threat: !InfrastructureShared
-- Name: MpTrustAnchors_Ussec_Staging
-- Type: 23

local l_0_0 = {
  [[
    {
        "version": 1,
        "environment": "SenseTesting_Staging",
        "usage": 2,
        "hashType": 0,
        "intThumbs": [
            "847df6a78497943f27fc72eb93f9a637320a02b561d0a91b09e87a7807ed7c61"
        ],
        "rootThumbs": [
            "df545bf919a2439c36983b54cdfc903dfa4f37d3996d8d84b4c31eec6f3c163e",
            "89fa90e8ac4cbcf4e2b1dd6e01de981471e9b11b14ec9a511365cadfe279541a",
            "9bd0f7cf6ed967519391bcd49a958867b955a60f22de5b8978474a2fcbad81a6"
        ]
    }
   ]],
  [[
    {
        "version": 1,
        "environment": "SenseTesting_Staging",
        "usage": 1,
        "hashType": 0,
        "intThumbs": [
            "847df6a78497943f27fc72eb93f9a637320a02b561d0a91b09e87a7807ed7c61"
        ],
        "rootThumbs": [
            "df545bf919a2439c36983b54cdfc903dfa4f37d3996d8d84b4c31eec6f3c163e",
            "89fa90e8ac4cbcf4e2b1dd6e01de981471e9b11b14ec9a511365cadfe279541a",
            "9bd0f7cf6ed967519391bcd49a958867b955a60f22de5b8978474a2fcbad81a6"
        ]
    }
   ]],
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "TrustAnchor_SenseTesting_Staging", l_0_0, 1)
