-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:MSIL/FrostyStash.D!dha
-- Type: 8
-- MpAttributes: pea_ismsil

local l_0_0 = mp.getfilesize()
if 180000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
local l_0_2 = {
  SMEditor = 1,
  SMNet = 1,
  StockMarketView = 1
}
local l_0_3 = {
  ["SMEditor.exe"] = 1,
  ["SMNet.exe"] = 1,
  ["StockMarketView.exe"] = 1
}
if l_0_1 ~= nil and l_0_1.ProductName ~= nil and l_0_2[l_0_1.ProductName] == 1 and l_0_1.FileDescription ~= nil and l_0_2[l_0_1.FileDescription] == 1 and l_0_1.OriginalFilename ~= nil and l_0_3[l_0_1.OriginalFilename] == 1 then
  return mp.INFECTED
end
return mp.CLEAN
