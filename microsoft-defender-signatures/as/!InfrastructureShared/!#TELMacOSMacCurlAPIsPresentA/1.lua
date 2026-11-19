-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/MacCurlAPIsPresent.A
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_AttrMacCurlAPIsPresent

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if not SuspMacPathsToMonitor(l_0_1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 then
  MpCommon.BmTriggerSig(l_0_2, "BM_MacCurlAPIsPresent", l_0_1)
end
return mp.INFECTED
