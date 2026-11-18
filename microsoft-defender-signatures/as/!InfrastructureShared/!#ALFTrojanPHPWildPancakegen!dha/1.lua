-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PHP/WildPancake.gen!dha
-- Type: 13
-- MpAttributes: LUA:FileSizeLE10000.A & SCRIPT:HasPHPHeaderTag.A & Lua:PHPExt

local l_0_0 = mp.getfilesize()
if 51200 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_1:find("\\wp-content", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.enum_mpattributesubstring("SCPT:WildPancake")
if 2 <= #l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
