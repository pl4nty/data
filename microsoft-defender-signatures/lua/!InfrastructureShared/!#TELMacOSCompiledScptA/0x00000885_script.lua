-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSCompiledScptA\0x00000885_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if (string.find)((string.lower)(l_0_1), "/contents/resources/scripts/", 1, true) then
  (mp.set_mpattribute)("BM_ScptCompiledApp")
  ;
  (MpCommon.BmTriggerSig)(l_0_2, "BM_ScptCompiledApp", l_0_1)
  ;
  (mp.ReportLowfi)(l_0_1, 1294845348)
  return mp.INFECTED
end
return mp.CLEAN

