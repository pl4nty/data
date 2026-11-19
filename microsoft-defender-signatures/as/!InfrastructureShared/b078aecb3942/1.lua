-- Threat: !InfrastructureShared
-- Name: b078aecb3942
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 4 and pevars.epsec == 1 and pesecs[pevars.epsec].SizeOfRawData >= 40960 and pesecs[pevars.epsec].SizeOfRawData <= 57344 then
  return mp.SUSPICIOUS
end
return mp.LOWFI
