-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/EDllName.A
-- Type: 24
-- MpAttributes: (pea_ismsil & !HSTR:EDllNameClean & !LUA:FileSizeGT40000.A)

if not mp.get_mpattribute("Lua:PeInternalName!e.dll") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("inetpub\\wwwroot", 1, true) or l_0_0:find("hetzner", 1, true) or l_0_0:find("mazeweb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
