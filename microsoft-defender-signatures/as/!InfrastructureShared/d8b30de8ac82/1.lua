-- Threat: !InfrastructureShared
-- Name: d8b30de8ac82
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "advapi32.dll"
local l_0_3 = {"EventWrite"}
local l_0_4 = {
  BadInstruction = true,
  KnownBad = true,
  FunctionBase = true
}
local l_0_5 = 10
local l_0_6, l_0_7, l_0_8 = helper_tamperapi_setup(this_sigattrlog[2], l_0_0)
if isnull(l_0_6) or isnull(l_0_7) or isnull(l_0_8) then
  return mp.CLEAN
end
if found_api_tampering(l_0_6, l_0_7, l_0_8, l_0_2, l_0_4, l_0_3, nil, l_0_5, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
