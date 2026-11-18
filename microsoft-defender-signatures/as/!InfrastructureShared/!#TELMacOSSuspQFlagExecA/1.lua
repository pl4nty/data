-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspQFlagExec.A
-- Type: 13
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if macos.GetQuarantineAttr() and IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_1) then
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_2 then
    TrackPidAndTechnique(l_0_2, "T1204.002", "Execution_UserExecution_UnsignedDownloadedFile")
    MpCommon.BmTriggerSig(l_0_2, "BM_UnsignedFileDownloadAttr", l_0_1)
  end
  return mp.INFECTED
end
return mp.CLEAN
