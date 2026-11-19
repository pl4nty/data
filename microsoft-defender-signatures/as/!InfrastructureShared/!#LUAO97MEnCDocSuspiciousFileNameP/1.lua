-- Threat: !InfrastructureShared
-- Name: !#LUA:O97M/EnCDocSuspiciousFileNameP
-- Type: 13
-- MpAttributes: LUA:FileSizeLE40000.A & BM_TEXT_FILE & (Lua:FileInZip | LuaZipWithSingleJS)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "2021apt%-28_%d%d%d%d453.zip") ~= nil or string.find(l_0_0, "2021apt%-28_%d%d%d%d%d453.zip") ~= nil or string.find(l_0_0, "2021apt%-28_%d%d%d%d453.js") ~= nil or string.find(l_0_0, "2021apt%-28_%d%d%d%d%d453.js") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
