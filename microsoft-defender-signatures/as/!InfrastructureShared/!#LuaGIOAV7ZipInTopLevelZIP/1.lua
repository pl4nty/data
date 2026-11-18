-- Threat: !InfrastructureShared
-- Name: !#Lua:GIOAV7ZipInTopLevelZIP
-- Type: 13
-- MpAttributes: !RPF:TopLevelFile & BM_7Z_FILE

if mp.get_mpattribute("//AGGREGATOR:GIOAVTopLevelZIP") and not mp.get_mpattribute("//GIOAV7ZipInTopLevelZIP") then
  mp.set_mpattribute("Lua:IOAVFirst7ZipInTopLevelZIP")
  mp.set_mpattribute("//GIOAV7ZipInTopLevelZIP")
end
if mp.get_mpattribute("//AGGREGATOR:GIOAVTopLevelUncompressedZip") and not mp.get_mpattribute("//GIOAV7ZipInTopLevelUncompressedZip") then
  mp.set_mpattribute("Lua:IOAVFirst7ZipInTopLevelUncompressedZip")
  mp.set_mpattribute("//GIOAV7ZipInTopLevelUncompressedZip")
end
return mp.CLEAN
