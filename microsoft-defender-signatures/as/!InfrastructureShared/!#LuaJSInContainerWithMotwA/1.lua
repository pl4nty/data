-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaJSInContainerWithMotwA\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.UfsGetMetadataBool)("Lua:ContainerHasMotw.A", true)
if l_0_0 == 0 and l_0_1 then
  if (mp.get_mpattribute)("//LuaZipWithSingleJS") then
    (mp.set_mpattribute)("Lua:SingleJSInContainerWithMotw.B")
  end
  return mp.INFECTED
end
return mp.CLEAN

