-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspDownload.X
-- Type: 12
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: (BM_MACOS_CORE_FILE_TYPE)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = l_0_1 .. "/"
if string.find(l_0_1, "/bin/", 1, true) == 1 or string.find(l_0_1, "/system/", 1, true) == 1 or string.find(l_0_1, "/sbin/", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 or string.find(l_0_1, "/library/containers/", 1, true) or string.find(l_0_1, "/library/application support/microsoft edge/default/sessions/", 1, true) or string.find(l_0_1, "/library/application support/firefox/profiles/", 1, true) or string.find(l_0_1, "/library/caches/firefox/profiles/", 1, true) or string.find(l_0_1, "/library/preferences/com.apple", 1, true) or string.find(l_0_2, ".crdownload", 1, true) or string.find(l_0_2, ".part", -5, true) or string.find(l_0_2, ".com.google.", 1, true) or string.find(l_0_2, ".com.microsoft.edgemac", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if string.find(l_0_3, "->(MachO-UniBin-", 1, true) then
  l_0_3 = l_0_3:gsub("%->%(MachO%-UniBin%-.*", "")
end
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_4 = {
    "safari",
    "microsoft edge",
    "google chrome",
    "firefox",
    "com.apple.webkit.networking",
    "microsoft outlook",
    "thunderbird",
    "gmail"
  }
  local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  l_0_5 = string.lower(l_0_5)
  for l_0_6, l_0_7 in pairs(l_0_4) do
    if l_0_7 ~= nil and string.find(l_0_5, l_0_7, 1, true) == 1 then
      mp.set_mpattribute("BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL")
      local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      local l_0_9 = "MAC_BROWSERDOWNLOAD_PATH"
      local l_0_10 = mp.GetCertificateInfo()
      if #l_0_10 < 1 or l_0_10 == nil then
        local l_0_11 = l_0_3:match("(/.*)/")
        if string.find(l_0_11, ".download", -9, true) then
          l_0_3 = l_0_11:gsub(".download", "")
        end
        if l_0_3 == "" or l_0_3 == nil then
          return mp.CLEAN
        end
        if l_0_8 then
          MpCommon.BmTriggerSig(l_0_8, "BM_MACFILE_DOWNLOADFROM_BROWSEREMAIL", l_0_3)
          TrackPidAndTechnique(l_0_8, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
        end
        AppendToRollingQueue(l_0_9, "mac_browserdownload_path", l_0_3, 7200, 100, 0)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
