-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFHackToolMSILFrostyS\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 180000 then
  return mp.CLEAN
end
local l_0_1 = (pe.get_versioninfo)()
local l_0_2 = {}
l_0_2.SMEditor = 1
l_0_2.SMNet = 1
l_0_2.StockMarketView = 1
local l_0_3 = {}
l_0_3["SMEditor.exe"] = 1
l_0_3["SMNet.exe"] = 1
l_0_3["StockMarketView.exe"] = 1
if l_0_1 ~= nil and l_0_1.ProductName ~= nil and l_0_2[l_0_1.ProductName] == 1 and l_0_1.FileDescription ~= nil and l_0_2[l_0_1.FileDescription] == 1 and l_0_1.OriginalFilename ~= nil and l_0_3[l_0_1.OriginalFilename] == 1 then
  return mp.INFECTED
end
return mp.CLEAN

