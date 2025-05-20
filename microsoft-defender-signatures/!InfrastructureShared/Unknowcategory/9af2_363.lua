-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9af2_363.luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if (l_0_0.CompanyName ~= nil and (string.find)(l_0_0.CompanyName, "Microsoft CoreXT", 1, true) ~= nil) or l_0_0.FileDescription ~= nil and (string.find)(l_0_0.FileDescription, "NMAgent", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED

