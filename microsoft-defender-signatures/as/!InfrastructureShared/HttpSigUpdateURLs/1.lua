-- Threat: !InfrastructureShared
-- Name: HttpSigUpdateURLs
-- Type: 23

local l_0_0 = {
  "https://mdav.uss.endpoint.security.microsoft.scloud/packages/?arch=x64",
  ""
}
local l_0_1 = {
  "https://mdav.usn.endpoint.security.eaglex.ic.gov/packages/?arch=x64",
  ""
}
local l_0_2 = {
  "https://mdav.uss.endpoint.security.microsoft.scloud/packages/?package=platform&arch=x64",
  ""
}
local l_0_3 = {
  "https://mdav.usn.endpoint.security.eaglex.ic.gov/packages/?package=platform&arch=x64",
  ""
}
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "HttpSigUpdate_Config_ADL_GW_USSec", l_0_0, 1)
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "HttpSigUpdate_Config_MOCAMP_GW_USSec", l_0_2, 1)
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "HttpSigUpdate_Config_ADL_GW_USNat", l_0_1, 1)
database.LoadDBVar(database.DBVAR_ARRAY_WIDESTRING, "HttpSigUpdate_Config_MOCAMP_GW_USNat", l_0_3, 1)
