-- Threat: !InfrastructureShared
-- Name: 4ab3bdf4efbf
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = false
local l_0_2 = false
l_0_2, l_0_1 = pcall(MpCommon.QuerySessionInformation, l_0_0.ppid, MpCommon.WTSIsRemoteSession)
if l_0_2 and l_0_1 then
  reportSessionInformationInclusive()
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
