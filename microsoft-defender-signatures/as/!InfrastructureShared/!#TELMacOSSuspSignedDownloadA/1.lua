-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspSignedDownload.A
-- Type: 12
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper
-- MpAttributes: (BM_MACOS_CORE_FILE_TYPE)

local l_0_0 = mp.GetCertificateInfo()
if 0 < #l_0_0 and l_0_0 ~= nil then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  if not SuspMacPathsToMonitor(l_0_1, true) then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  l_0_2 = l_0_2 .. "/"
  if string.find(l_0_2, "/library/application support/microsoft edge/default/sessions/", 1, true) or string.find(l_0_2, "/library/application support/firefox/profiles/", 1, true) or string.find(l_0_2, "/library/caches/firefox/profiles/", 1, true) or string.find(l_0_2, "/library/preferences/com.apple", 1, true) or string.find(l_0_3, ".crdownload", 1, true) or string.find(l_0_3, ".part", -5, true) or string.find(l_0_3, ".com.google.", 1, true) or string.find(l_0_3, ".com.microsoft.edgemac", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_1, "->(MachO-UniBin-", 1, true) then
    l_0_1 = l_0_1:gsub("%->%(MachO%-UniBin%-.*", "")
  end
  local l_0_4 = MpCommon.GetCurrentTimeT()
  if l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = sysio.GetFileLastWriteTime(l_0_1)
  if l_0_5 == nil then
    return mp.CLEAN
  end
  if sysio.GetLastResult().Success and l_0_5 and l_0_5 ~= 0 then
    l_0_5 = l_0_5 / 10000000 - 11644473600
  end
  local l_0_6 = l_0_4 - l_0_5
  if l_0_6 <= 0 then
    return mp.CLEAN
  end
  local l_0_7 = l_0_6 / 60
  if 4 < l_0_7 then
    return mp.CLEAN
  end
  local l_0_8 = {
    "safari",
    "microsoft edge",
    "google chrome",
    "firefox",
    "com.apple.webkit.networking",
    "microsoft outlook",
    "thunderbird",
    "gmail",
    "com.apple.safari.sandboxbroker"
  }
  local l_0_9 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  l_0_9 = string.lower(l_0_9)
  for l_0_10, l_0_11 in pairs(l_0_8) do
    if l_0_11 ~= nil and string.find(l_0_9, l_0_11, 1, true) == 1 then
      local l_0_12 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      local l_0_13 = "MAC_SIGNED_BROWSERDOWNLOAD_PATH"
      local l_0_14 = l_0_1:match("(/.*)/")
      if string.find(l_0_14, ".download", -9, true) then
        l_0_1 = l_0_14:gsub(".download", "")
      end
      if l_0_12 then
        MpCommon.BmTriggerSig(l_0_12, "BM_SIGNED_MACFILE_DOWNLOADFROM_BROWSERMAIL", l_0_1)
        TrackPidAndTechnique(l_0_12, "T1566.002", "InitialAccess_Phishing_SpearphishingLinkSigned")
      end
      if not IsKeyValuePairInRollingQueue(l_0_13, "mac_signed_browserdownload_path", string.lower(l_0_1)) then
        AppendToRollingQueue(l_0_13, "mac_signed_browserdownload_path", string.lower(l_0_1), 7200, 100, 0)
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
