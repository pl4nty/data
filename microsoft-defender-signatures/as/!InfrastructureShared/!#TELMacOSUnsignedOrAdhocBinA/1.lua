-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSUnsignedOrAdhocBinA\1.luac 

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
if (string.find)(l_0_1, "/private/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/Users/[^/]+/Downloads/", 1, false) ~= 1 and (string.find)(l_0_1, "/Users/[^/]+/Desktop/", 1, false) ~= 1 and (string.find)(l_0_1, "/tmp/", 1, true) ~= 1 and (string.find)(l_0_1, "/Library/PrivilegedHelperTools/", 1, true) ~= 1 and (string.find)(l_0_1, "/Volumes/.*/[^/]+.app/Contents/", 1, false) ~= 1 and (string.find)(l_0_1, "/Volumes/.*/%.[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "/Library/Caches/[^/]+$", 1, false) ~= 1 and (string.find)(l_0_1, "^/private/var/folders/.*TemporaryItems/NSIRD_ArchiveService_", 1, false) ~= 1 and (string.find)(l_0_1, "/usr/local/bin/", 1, true) ~= 1 then
  return mp.CLEAN
end
if (string.find)(l_0_1, "->(MachO-UniBin-", 1, true) then
  l_0_1 = l_0_1:gsub("%->%(MachO%-UniBin%-.*", "")
end
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, ".dylib", -6, true) or (string.find)(l_0_1, ".so", -3, true) or (string.find)(l_0_1, "__python_generated_allocator_preload", 1, true) or (string.find)(l_0_1, "/private/tmp/strip%.[^/]+$", 1, false) or (string.find)(l_0_1, "/private/tmp/bitcode_strip%.[^/]+$", 1, false) or (string.find)(l_0_1, "PPRiskMagnes.framework/PPRiskMagnes$", 1, false) or (string.find)(l_0_1, "/private/tmp/_MEI.*/Python3$", 1, false) or (string.find)(l_0_1, "/private/tmp/_MEI.*[^/]+/Python$", 1, false) or (string.find)(l_0_1, "/private/tmp/br%w%w%w%w%w%w$", 1, false) or (string.find)(l_0_1, "/private/tmp/PKInstallSandbox.*/tmp/br%w%w%w%w%w%w$", 1, false) or (string.find)(l_0_1, "/private/tmp/mcs/runner", 1, true) or (string.find)(l_0_1, "/private/tmp/mcs/assets/", 1, true) or (string.find)(l_0_1, ".o", -2, true) or (string.find)(l_0_1, "/private/tmp/PKInstallSandbox[^/]+/tmp/qlist$", 1, false) or (string.find)(l_0_1, "/private/tmp/oe-kandji/miniconda/.*/appkit_launcher_x86_64$", 1, false) or (string.find)(l_0_1, "/target/debug/build/.*/build-script-build$", 1, false) or (string.find)(l_0_1, "/private/tmp/deviceConnect-Services-", 1, true) then
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
    AppendToRollingQueue(l_0_4, "unsigned_adhoc_items", l_0_1, l_0_5, 1000, 0)
    TrackPidAndTechnique(l_0_2, "T1204.002", "Execution_UserExecution_UnsignedAdhocFile")
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

