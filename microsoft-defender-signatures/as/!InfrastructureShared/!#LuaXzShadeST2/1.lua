-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaXzShadeST2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRT:TS5559.Lodenv.")
if #l_0_0 >= 4 and #l_0_0 <= 9 then
  return mp.INFECTED
end
return mp.CLEAN

