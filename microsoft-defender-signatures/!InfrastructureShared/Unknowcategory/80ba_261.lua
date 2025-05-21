-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80ba_261.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 ~= nil and l_0_0.CompanyName == "Alpha programming team" and l_0_0.ProductName == "Dragon" then
  return mp.INFECTED
end
return mp.CLEAN

