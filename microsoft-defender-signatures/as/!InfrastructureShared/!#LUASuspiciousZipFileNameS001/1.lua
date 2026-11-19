-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousZipFileNameS001
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:ZIPExt

local l_0_0 = mp.getfilesize()
if l_0_0 < 4096 and 15728640 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_1 == nil or string.len(l_0_1) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_1, "attachmentfiles_20220208_%d%d%d%d+%.zip") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
