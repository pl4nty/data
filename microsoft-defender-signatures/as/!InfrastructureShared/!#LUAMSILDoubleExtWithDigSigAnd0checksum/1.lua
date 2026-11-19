-- Threat: !InfrastructureShared
-- Name: !#LUA:MSILDoubleExtWithDigSigAnd0checksum
-- Type: 13
-- MpAttributes: pea_ismsil & pea_headerchecksum0

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if mp.getfilesize() < 1024000 then
  return mp.CLEAN
end
if string.find(l_0_0, "\194\183pdf.scr", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
