-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/SuspUnSignedFileCreate.D
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & ((BM_MACOS_CORE_FILE_TYPE | (BM_JAVA_CLASS_FILE & !SCPT:JAVAFileGen)))

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = l_0_1 .. "/"
if string.find(l_0_1, "/users/[^/]+/library/google/", 1, false) and string.find(l_0_2, "com.google.chromes.updaters", 1, true) then
  local l_0_3 = mp.GetCertificateInfo()
  if #l_0_3 < 1 or l_0_3 == nil then
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
