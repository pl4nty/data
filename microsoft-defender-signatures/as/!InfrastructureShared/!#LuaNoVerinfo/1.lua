-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaNoVerinfo\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.INFECTED
end
local l_0_1 = l_0_0.CompanyName
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
  l_0_1 = l_0_1:gsub(" ", "__")
  ;
  (mp.set_mpattribute)("Lua:PeCompanyName!" .. l_0_1)
else
  ;
  (mp.set_mpattribute)("Lua:PeCompanyName!nil")
end
local l_0_2 = l_0_0.ProductName
if l_0_2 then
  l_0_2 = (string.lower)(l_0_2)
  l_0_2 = l_0_2:gsub(" ", "__")
  ;
  (mp.set_mpattribute)("Lua:PeProductName!" .. l_0_2)
else
  ;
  (mp.set_mpattribute)("Lua:PeProductName!nil")
end
return mp.CLEAN

