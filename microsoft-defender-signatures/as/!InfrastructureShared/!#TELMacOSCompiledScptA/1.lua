-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/CompiledScpt.A
-- Type: 12
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & BM_COMP_SCPT_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if string.find(string.lower(l_0_1), "/contents/resources/scripts/", 1, true) then
  mp.set_mpattribute("BM_ScptCompiledApp")
  MpCommon.BmTriggerSig(l_0_2, "BM_ScptCompiledApp", l_0_1)
  mp.ReportLowfi(l_0_1, 1294845348)
  return mp.INFECTED
end
return mp.CLEAN
