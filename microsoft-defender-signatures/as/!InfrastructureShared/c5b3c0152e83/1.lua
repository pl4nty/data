-- Threat: !InfrastructureShared
-- Name: c5b3c0152e83
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperAMSIPatch"
local l_0_1 = "T1562.006"
local l_0_2 = "amsi.dll"
local l_0_3 = {
  "AmsiScanBuffer",
  "AmsiOpenSession",
  "AmsiScanString"
}
local l_0_4, l_0_5, l_0_6 = helper_tamperapi_setup(this_sigattrlog[2], l_0_0)
if isnull(l_0_4) or isnull(l_0_5) or isnull(l_0_6) then
  return mp.CLEAN
end
if found_api_tampering(l_0_4, l_0_5, l_0_6, l_0_2, nil, l_0_3, nil, nil, l_0_0, l_0_1) then
  bm.add_threat_process(l_0_5)
  return mp.INFECTED
end
return mp.CLEAN
