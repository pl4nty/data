-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32EDllNameA\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:PeInternalName!e.dll") then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("inetpub\\wwwroot", 1, true) or l_0_0:find("hetzner", 1, true) or l_0_0:find("mazeweb", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

