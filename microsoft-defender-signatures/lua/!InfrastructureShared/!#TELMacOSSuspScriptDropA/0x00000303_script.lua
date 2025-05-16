-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspScriptDropA\0x00000303_luac 

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
if not SuspMacPathsToMonitor(l_0_1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 then
  if (mp.get_mpattribute)("BM_SH_FILE") then
    (MpCommon.BmTriggerSig)(l_0_2, "BM_SUSPPATH_SH_FILE", l_0_1)
  else
    if (mp.get_mpattribute)("BM_PY_FILE") then
      (MpCommon.BmTriggerSig)(l_0_2, "BM_SUSPPATH_PY_FILE", l_0_1)
    end
  end
end
return mp.INFECTED

