-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9e97_402.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 25000 then
  return mp.CLEAN
end
local l_0_1 = (pe.get_versioninfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_1.CompanyName, "EPSON", 1, true) == nil then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "EpsonDeviceControl.dll" then
  return mp.CLEAN
end
return mp.INFECTED

