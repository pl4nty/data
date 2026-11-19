-- Threat: !InfrastructureShared
-- Name: 6b78a27be92f
-- Type: 21

if pehdr.NumberOfSections == 5 and pevars.epsec == 1 and pesecs[pevars.epsec].Name == ".text" and pesecs[pevars.epsec].SizeOfRawData >= 237568 and pesecs[pevars.epsec].SizeOfRawData <= 393216 and pesecs[pehdr.NumberOfSections].Name == ".reloc" and pesecs[pehdr.NumberOfSections].SizeOfRawData >= 9216 and pesecs[pehdr.NumberOfSections].SizeOfRawData <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
