-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6220_219.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 and l_0_0.FileDescription and l_0_0.FileDescription == "client" then
  return mp.INFECTED
end
return mp.CLEAN

