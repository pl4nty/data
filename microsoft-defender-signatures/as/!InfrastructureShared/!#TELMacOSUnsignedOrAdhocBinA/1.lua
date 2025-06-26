-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSUnsignedOrAdhocBinA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 5 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/private/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/users/[^/]+/downloads/", 1, false) ~= 1 and (string.find)(l_0_1, "/users/[^/]+/desktop/", 1, false) ~= 1 and (string.find)(l_0_1, "/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/library/privilegedhelpertools/", 1, true) ~= 1 and (string.find)(l_0_1, "/volumes/.*/[^/]+.app/contents/", 1, false) ~= 1 and (string.find)(l_0_1, "/volumes/.*/%.[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "/library/caches/[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "/usr/local/bin/", 1, true) ~= 1 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "->(macho-unibin-", 1, true) then
  l_0_1 = l_0_1:gsub("%->%(macho%-unibin%-.*", "")
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, ".dylib", -6, true) or (string.find)(l_0_1, ".so", -3, true) or (string.find)(l_0_1, "__python_generated_allocator_preload", 1, true) or (string.find)(l_0_1, "/private/tmp/deviceconnect-services-", 1, true) then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = (mp.GetCertificateInfo)()
do
  if #l_0_3 < 1 or l_0_3 == nil then
    local l_0_4 = "MAC_UNS_ADHOC_PATHS"
    if l_0_2 then
      (MpCommon.BmTriggerSig)(l_0_2, "BM_UnsignedOrAdhocMacBin", l_0_1)
    end
    if not IsKeyValuePairInRollingQueue(l_0_4, "unsigned_adhoc_items", l_0_1) then
      AppendToRollingQueue(l_0_4, "unsigned_adhoc_items", l_0_1, 7200, 100, 0)
      TrackPidAndTechnique(l_0_2, "T1204.002", "Execution_UserExecution_UnsignedAdhocFile")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

