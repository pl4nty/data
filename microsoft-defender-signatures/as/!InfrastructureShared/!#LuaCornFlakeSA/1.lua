-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaCornFlakeSA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("SCRT:5351.CornFlake")
if #l_0_0 >= 3 then
  (mp.set_mpattribute)("Lua:CornFlake.BS1")
  return mp.INFECTED
else
  if #l_0_0 == 2 then
    (mp.set_mpattribute)("Lua:CornFlake.MS1")
    return mp.CLEAN
  end
end
return mp.CLEAN

