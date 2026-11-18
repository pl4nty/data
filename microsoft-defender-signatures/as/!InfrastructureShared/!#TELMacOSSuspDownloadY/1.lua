-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspDownload.Y
-- Type: 13
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & (BM_ZIP_FILE | BM_MACOS_CORE_FILE_TYPE | BM_DMG_FILE | BM_PDF_FILE)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if string.find(l_0_0, "/bin", 1, true) == 1 or string.find(l_0_0, "/system", 1, true) == 1 or string.find(l_0_0, "/sbin", 1, true) == 1 or string.find(l_0_0, "/library/apple/", 1, true) == 1 or string.find(l_0_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_0, "/usr/", 1, true) == 1 and not string.find(l_0_0, "/usr/local/", 1, true) == 1 or string.find(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
local l_0_3 = {
  "job",
  "offer",
  "stability",
  "bridges",
  "coinbase",
  "careers",
  "finderfontsupdater"
}
for l_0_4, l_0_5 in pairs(l_0_3) do
  if l_0_5 ~= nil and string.find(l_0_1, l_0_5, 1, true) then
    local l_0_6 = macos.GetDownloadUrl()
    if l_0_6 == "" or l_0_6 == nil then
      return mp.CLEAN
    end
    local l_0_7 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if string.find(l_0_6, "drive.google.com", 1, true) or string.find(l_0_6, "linkedin.com", 1, true) or string.find(l_0_6, ".googleusercontent.com", 1, true) or string.find(l_0_6, "https://lnkd.", 1, true) or string.find(l_0_6, "github.", 1, true) or string.find(l_0_6, "raw.githubusercontent", 1, true) or string.find(l_0_6, ".licdn.com", 1, true) then
      local l_0_8 = "MAC_BROWSERDOWNLOAD_PATH"
      if l_0_7 then
        TrackPidAndTechnique(l_0_7, "T1566.002", "InitialAccess_Phishing_SpearphishingLink")
        MpCommon.BmTriggerSig(l_0_7, "BM_SUSPFILE_SPEARPHISHING_LINK", l_0_2)
      end
      AppendToRollingQueue(l_0_8, "mac_browserdownload_path", l_0_2, 7200, 100, 0)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
