-- Threat: !InfrastructureShared
-- Name: c37853e96c7c
-- Type: 21

if peattributes.isdll and peattributes.hasexports and peattributes.epinfirstsect and pehdr.NumberOfSections == 5 and peattributes.no_tls and pehdr.SizeOfImage >= 700416 and pehdr.SizeOfImage <= 851968 and pesecs[pevars.epsec].SizeOfRawData >= 196608 and pesecs[pevars.epsec].SizeOfRawData <= 294912 and pesecs[2].SizeOfRawData >= 12288 and pesecs[2].SizeOfRawData <= 16384 and 12288 <= pesecs[5].VirtualSize and pesecs[5].VirtualSize <= 24576 and pesecs[3].SizeOfRawData == 2560 and pesecs[3].VirtualSize >= 425984 and pesecs[3].VirtualSize <= 491520 and pesecs[pehdr.NumberOfSections].Name == ".reloc" and pesecs[pevars.epsec].Name == ".text" then
  return mp.INFECTED
end
return mp.CLEAN
