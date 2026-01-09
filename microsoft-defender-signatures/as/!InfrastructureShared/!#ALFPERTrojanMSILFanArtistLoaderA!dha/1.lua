-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERTrojanMSILFanArtistLoaderA!dha\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:PeProductName!dete") then
  return mp.CLEAN
end
if (pe.get_exports_count)() ~= 20 then
  return mp.CLEAN
end
return mp.INFECTED

