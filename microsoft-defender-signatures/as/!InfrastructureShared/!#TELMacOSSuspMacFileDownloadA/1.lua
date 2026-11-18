-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspMacFileDownload.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if string.find(l_0_1, "/bin", 1, true) == 1 or string.find(l_0_1, "/system", 1, true) == 1 or string.find(l_0_1, "/library/apple/", 1, true) == 1 or string.find(l_0_1, "/library/installersandboxes/", 1, true) == 1 or string.find(l_0_1, "/library/systemextensions/", 1, true) == 1 or string.find(l_0_1, "/.git/modules/", 1, true) or string.find(l_0_1, "/.git/hooks/", 1, true) or string.find(l_0_1, "/sbin", 1, true) == 1 or string.find(l_0_1, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_1, "/private/var/folders/", 1, true) == 1 or string.find(l_0_1, "/usr/", 1, true) == 1 and not string.find(l_0_1, "/usr/local/", 1, true) == 1 or string.find(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
if mp.IsTrustedFile(false) == true then
  return mp.CLEAN
end
local l_0_3 = macos.GetDownloadUrl()
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if string.find(l_0_3, "torrent", 1, true) or string.find(l_0_3, "piratebay", 1, true) or string.find(l_0_3, "github.", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
