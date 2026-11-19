-- Threat: !InfrastructureShared
-- Name: 64786684f5fd
-- Type: 21

if pehdr.NumberOfSections == 9 and pesecs[pehdr.NumberOfSections].Name == ".CN" and pesecs[pevars.epsec].SizeOfRawData >= 475136 and pevars.epsecwr == 1 then
  return mp.INFECTED
end
return mp.CLEAN
