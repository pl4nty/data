-- Threat: !InfrastructureShared
-- Name: !#ALF:JS/SuspiciousFileNamePR
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & LUA:FileSizeLE50KB.B & (Lua:FileInZip | Lua:ZipWithSingleJS)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "trx%d%d%d%d%d+%.js") ~= nil or string.find(l_0_0, "pdf%d%d%d%d%d+%.js") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
