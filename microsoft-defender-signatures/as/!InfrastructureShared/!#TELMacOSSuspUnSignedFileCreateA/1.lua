-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspUnSignedFileCreate.A
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
  return mp.CLEAN
end
local l_0_1 = versioning.GetMachineGuid()
if l_0_1 == nil or l_0_1 == "" or l_0_1:lower() ~= "1a37f9af-a7a4-5748-99d2-71f05455226b" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = l_0_2 .. "/"
if string.find(l_0_2, "/private/tmp/", 1, true) and (string.find(l_0_3, "foo", 1, true) or string.find(l_0_3, "keylogger", 1, true) or string.find(l_0_3, "tastatur", 1, true) or string.find(l_0_3, "reverseshell", 1, true) or string.find(l_0_3, "shellcoder", 1, true) or string.find(l_0_3, "peterkl", 1, true)) then
  local l_0_4 = mp.GetCertificateInfo()
  if #l_0_4 < 1 or l_0_4 == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
