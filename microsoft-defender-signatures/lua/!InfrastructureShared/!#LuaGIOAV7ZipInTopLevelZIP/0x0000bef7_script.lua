-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaGIOAV7ZipInTopLevelZIP\0x0000bef7_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("//AGGREGATOR:GIOAVTopLevelZIP") and not (mp.get_mpattribute)("//GIOAV7ZipInTopLevelZIP") then
  (mp.set_mpattribute)("Lua:IOAVFirst7ZipInTopLevelZIP")
  ;
  (mp.set_mpattribute)("//GIOAV7ZipInTopLevelZIP")
end
if (mp.get_mpattribute)("//AGGREGATOR:GIOAVTopLevelUncompressedZip") and not (mp.get_mpattribute)("//GIOAV7ZipInTopLevelUncompressedZip") then
  (mp.set_mpattribute)("Lua:IOAVFirst7ZipInTopLevelUncompressedZip")
  ;
  (mp.set_mpattribute)("//GIOAV7ZipInTopLevelUncompressedZip")
end
return mp.CLEAN

