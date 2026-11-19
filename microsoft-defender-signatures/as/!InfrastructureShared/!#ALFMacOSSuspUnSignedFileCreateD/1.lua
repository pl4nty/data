-- Threat: !InfrastructureShared
-- Name: !#ALF:MacOS/SuspUnSignedFileCreate.D
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = versioning.GetOrgID()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "c7754ffc-eb73-44fc-87e2-b3e197010d93" then
  return mp.CLEAN
end
local l_0_1 = versioning.GetMachineGuid()
if l_0_1 == nil or l_0_1 == "" or l_0_1:lower() ~= "591533fb-5d2d-5ac4-8277-810030be27fc" then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = l_0_2 .. "/"
if string.find(l_0_2, "/users/", 1, true) and (string.find(l_0_3, ".com.apple.helpers", 1, true) or string.find(l_0_3, "com.microsoft.helper", 1, true)) or string.find(l_0_2, "/private/tmp/", 1, true) and string.find(l_0_3, "mac password popup", 1, true) then
  local l_0_4 = mp.GetCertificateInfo()
  if #l_0_4 < 1 or l_0_4 == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
