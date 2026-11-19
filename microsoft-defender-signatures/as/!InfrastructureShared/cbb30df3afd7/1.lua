-- Threat: !InfrastructureShared
-- Name: cbb30df3afd7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperRPCRT4Protect"
local l_0_1 = "T1562.001"
local l_0_2 = "rpcrt4.dll"
local l_0_3 = {FunctionBase = true}
local l_0_4 = {
  "NdrClientCall3"
}
local l_0_5, l_0_6, l_0_7 = helper_tamperapi_setup(nil, l_0_0)
bm.add_related_string(string.format("%s_Debug", l_0_0), string.format("P1: %s P2: %s", this_sigattrlog[3].utf8p1, this_sigattrlog[3].utf8p2), bm.RelatedStringBMReport)
if isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
if found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, l_0_3, l_0_4, nil, nil, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
