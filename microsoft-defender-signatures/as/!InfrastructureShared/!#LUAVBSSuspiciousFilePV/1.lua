-- Threat: !InfrastructureShared
-- Name: !#LUA:VBS/SuspiciousFilePV
-- Type: 13
-- MpAttributes: SCRIPT:CData & LUA:FileSizeLE1M.B & SCRIPT:LanguageVBscript & SCRIPT:WsfTag

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "pdf%.wsf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
