-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00009f42_luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0.ProductName, "AUTORUN", 1, true) == nil or (string.find)(l_0_0.FileDescription, "AUTORUN", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED

