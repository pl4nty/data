-- Threat: !InfrastructureShared
-- Name: d6b3e20d87ee
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperAMSIProtect"
local l_0_1 = "T1562.002"
local l_0_2 = "amsi.dll"
local l_0_3 = {
  "AmsiOpenSession",
  "AmsiScanString"
}
local l_0_4, l_0_5, l_0_6 = helper_tamperapi_setup(nil, l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if found_api_tampering(l_0_4, l_0_5, l_0_6, l_0_2, {FunctionBase = true}, l_0_3, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
