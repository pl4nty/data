-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaXzShadeST3\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRT:TS5559.Lodpl.")
if #l_0_0 >= 3 and #l_0_0 <= 5 then
  return mp.INFECTED
end
return mp.CLEAN

