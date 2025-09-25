-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanDownloaderM\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 300000 then
  return mp.CLEAN
end
local l_0_1 = (pe.get_versioninfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.FileDescription ~= "Telemetry-Feed-Update" then
  return mp.CLEAN
end
if l_0_1.OriginalFilename ~= "Telemetry-Feed-Update.exe" then
  return mp.CLEAN
end
return mp.INFECTED

