-- Threat: !InfrastructureShared
-- Name: 14ab3576525f1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "TamperETWPatch"
local l_0_1 = "T1562.002"
local l_0_2 = "ntdll.dll"
local l_0_3 = {
  "EtwEventWrite",
  "NtTraceEvent",
  "EtwEventWriteEx",
  "EtwEventWriteTransfer",
  "EtwEventWriteFull"
}
local l_0_4 = 10
local l_0_5, l_0_6, l_0_7 = helper_tamperapi_setup(nil, l_0_0)
if isnull(l_0_5) or isnull(l_0_6) or isnull(l_0_7) then
  return mp.CLEAN
end
if found_api_tampering(l_0_5, l_0_6, l_0_7, l_0_2, nil, l_0_3, nil, l_0_4, l_0_0, l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
