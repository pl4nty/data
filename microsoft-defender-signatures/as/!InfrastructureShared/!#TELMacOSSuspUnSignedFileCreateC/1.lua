-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspUnSignedFileCreate.C
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "ac006843-1fb8-455e-9738-5726827ed4a0" then
  return mp.CLEAN
end
local l_0_1 = versioning.GetMachineGuid()
if l_0_1 == nil or l_0_1 == "" or l_0_1:lower() ~= "18088170-fab3-5391-9131-b07bf758566b" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = l_0_2 .. "/"
if string.find(l_0_2, "/library/caches/", 1, true) and (string.find(l_0_3, "com.apple.sys.receipt", 1, true) or string.find(l_0_3, "system settings", 1, true) or string.find(l_0_3, "calc", 1, true) or string.find(l_0_3, "chromeext", 1, true)) or string.find(l_0_2, "/library/systemsettings/", 1, true) and string.find(l_0_3, "com.apple.system.settings", 1, true) or string.find(l_0_2, "/private/tmp/", 1, true) and (string.find(l_0_3, "com.apple.icloud.sync", 1, true) or string.find(l_0_3, "aIdTUW", 1, true)) then
  local l_0_4 = mp.GetCertificateInfo()
  if #l_0_4 < 1 or l_0_4 == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
