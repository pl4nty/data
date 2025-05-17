-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspQFlagExecA\1_luac 

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
if not (string.find)(l_0_1, "/Users/[^/]+/Downloads/", 1, false) and not (string.find)(l_0_1, "/Users/[^/]+/Documents/", 1, false) and not (string.find)(l_0_1, "/Users/[^/]+/Desktop/", 1, false) then
  return mp.CLEAN
end
do
  if (macos.GetQuarantineAttr)() and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", (string.lower)(l_0_1)) then
    local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_2 then
      TrackPidAndTechnique(l_0_2, "T1204.002", "Execution_UserExecution_UnsignedDownloadedFile")
      ;
      (MpCommon.BmTriggerSig)(l_0_2, "BM_UnsignedFileDownloadAttr", l_0_1)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

