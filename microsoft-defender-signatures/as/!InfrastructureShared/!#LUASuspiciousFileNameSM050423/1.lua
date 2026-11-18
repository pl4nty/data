-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousFileNameSM050423
-- Type: 13
-- MpAttributes: (BM_TEXT_FILE) & (Lua:UnknownExt)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "po#23-002732.htm", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
