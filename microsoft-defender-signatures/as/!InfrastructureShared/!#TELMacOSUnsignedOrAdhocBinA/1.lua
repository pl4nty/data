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
if (string.find)(l_0_1, "/private/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/users/[^/]+/downloads/", 1, false) ~= 1 and (string.find)(l_0_1, "/users/[^/]+/desktop/", 1, false) ~= 1 and (string.find)(l_0_1, "/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/library/privilegedhelpertools/", 1, true) ~= 1 and (string.find)(l_0_1, "/volumes/.*/[^/]+.app/contents/", 1, false) ~= 1 and (string.find)(l_0_1, "/volumes/.*/%.[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "/library/caches/[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "^/private/var/folders/.*temporaryitems/nsird_archiveservice_", 1, false) ~= 1 and (string.find)(l_0_1, "/usr/local/bin/", 1, true) ~= 1 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "->(macho-unibin-", 1, true) then
  l_0_1 = l_0_1:gsub("%->%(macho%-unibin%-.*", "")
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, ".dylib", -6, true) or (string.find)(l_0_1, ".so", -3, true) or (string.find)(l_0_1, "__python_generated_allocator_preload", 1, true) or (string.find)(l_0_1, "/private/tmp/strip%.[^/]+$", 1, false) or (string.find)(l_0_1, "/private/tmp/bitcode_strip%.[^/]+$", 1, false) or (string.find)(l_0_1, "ppriskmagnes.framework/ppriskmagnes$", 1, false) or (string.find)(l_0_1, "/private/tmp/_mei.*/python3$", 1, false) or (string.find)(l_0_1, "/private/tmp/_mei.*[^/]+/python$", 1, false) or (string.find)(l_0_1, "/private/tmp/br%w%w%w%w%w%w$", 1, false) or (string.find)(l_0_1, "/private/tmp/pkinstallsandbox.*/tmp/br%w%w%w%w%w%w$", 1, false) or (string.find)(l_0_1, "/private/tmp/mcs/runner", 1, true) or (string.find)(l_0_1, "/private/tmp/mcs/assets/", 1, true) or (string.find)(l_0_1, ".o", -2, true) or (string.find)(l_0_1, "/private/tmp/deviceconnect-services-", 1, true) then
  return mp.CLEAN
end
if IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = (mp.GetCertificateInfo)()
if #l_0_3 < 1 or l_0_3 == nil then
  local l_0_4 = "MAC_UNS_ADHOC_PATHS"
  if l_0_2 then
    (MpCommon.BmTriggerSig)(l_0_2, "BM_UnsignedOrAdhocMacBin", l_0_1)
  end
  local l_0_5 = 86400
  if not IsKeyValuePairInRollingQueue(l_0_4, "unsigned_adhoc_items", l_0_1) then
    AppendToRollingQueue(l_0_4, "unsigned_adhoc_items", l_0_1, l_0_5, 200, 0)
    TrackPidAndTechnique(l_0_2, "T1204.002", "Execution_UserExecution_UnsignedAdhocFile")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

