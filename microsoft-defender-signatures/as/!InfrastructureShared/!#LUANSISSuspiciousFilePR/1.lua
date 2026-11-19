-- Threat: !InfrastructureShared
-- Name: !#LUA:NSIS/SuspiciousFilePR
-- Type: 13
-- MpAttributes: (BM_MZ_FILE & HSTR:NSIS_Installer)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() > 1024000 then
  return mp.CLEAN
end
if string.find(l_0_0, "ekstre.pdf.exe", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
