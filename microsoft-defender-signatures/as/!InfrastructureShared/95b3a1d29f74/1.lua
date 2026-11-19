-- Threat: !InfrastructureShared
-- Name: 95b3a1d29f74
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperRPCRT4Patch"
local l_0_1 = "T1562.001"
local l_0_2 = "rpcrt4.dll"
local l_0_3 = {
  "NdrClientCall3"
}
local l_0_4, l_0_5, l_0_6 = helper_tamperapi_setup(nil, l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if found_api_tampering(l_0_4, l_0_5, l_0_6, l_0_2, nil, l_0_3, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
