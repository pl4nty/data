-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!#PUABlockOfferCore\ObMpAttributes_g______________1__\0x00000013_luac 

-- params : ...
-- function num : 0
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
else
  l_0_1 = ""
end
if l_0_1 == "setup/uninstall" then
  return mp.CLEAN
end
return mp.INFECTED

