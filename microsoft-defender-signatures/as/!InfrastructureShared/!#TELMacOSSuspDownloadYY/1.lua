-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspDownload.YY
-- Type: 12
-- Includes: LuaFuncHelper, TechniqueTracker
-- MpAttributes: RPF:TopLevelFile & (BM_SH_FILE | BM_ZIP_FILE | (Nscript:Type_py | BM_PY_FILE | Possible_PythonCode | SCPT:Python.ImportImport | Lua:PYExt))

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = l_0_0 .. "/"
if string.find(l_0_0, "/bin/", 1, true) == 1 or string.find(l_0_0, "/system/", 1, true) == 1 or string.find(l_0_0, "/sbin/", 1, true) == 1 or string.find(l_0_0, "/library/apple/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 or string.find(l_0_0, "/library/containers/", 1, true) or string.find(l_0_0, "/library/application support/microsoft edge/default/sessions/", 1, true) or string.find(l_0_0, "/library/application support/firefox/profiles/", 1, true) or string.find(l_0_0, "/library/caches/firefox/profiles/", 1, true) or string.find(l_0_0, "/library/preferences/com.apple", 1, true) or string.find(l_0_1, ".crdownload", 1, true) or string.find(l_0_1, ".part", -5, true) or string.find(l_0_1, "/.com.google.", 1, true) or string.find(l_0_1, "/.com.microsoft.edgemac", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetCurrentTimeT()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = sysio.GetFileLastWriteTime(l_0_2)
if l_0_4 == nil then
  return mp.CLEAN
end
if sysio.GetLastResult().Success and l_0_4 and l_0_4 ~= 0 then
  l_0_4 = l_0_4 / 10000000 - 11644473600
end
local l_0_5 = l_0_3 - l_0_4
if l_0_5 < 0 then
  return mp.CLEAN
end
local l_0_6 = l_0_5 / 60
if 5 < l_0_6 then
  return mp.CLEAN
end
local l_0_7 = {
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
local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
l_0_8 = string.lower(l_0_8)
for l_0_9, l_0_10 in pairs(l_0_7) do
  if l_0_10 ~= nil and string.find(l_0_8, l_0_10, 1, true) == 1 then
    local l_0_11 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    local l_0_12 = "MAC_BROWSERDOWNLOAD_PATH"
    local l_0_13 = l_0_2:match("(/.*)/")
    if string.find(l_0_13, ".download", -9, true) then
      l_0_2 = l_0_13:gsub(".download", "")
    end
    if l_0_11 then
      MpCommon.BmTriggerSig(l_0_11, "BM_BROWSERDOWNLOAD_PATH", l_0_2)
      TrackPidAndTechnique(l_0_11, "T1566.002", "InitialAccess_Phishing_SpearphishingLinkNonBin")
    end
    AppendToRollingQueue(l_0_12, "mac_browserdownload_path", l_0_2, 7200, 100, 0)
    return mp.INFECTED
  end
end
return mp.CLEAN
