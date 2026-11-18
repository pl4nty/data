-- Threat: !InfrastructureShared
-- Name: 7b7862694a06
-- Type: 21

if peattributes.no_security and pehdr.NumberOfSections == 5 and pesecs[2].Name == ".rdata" and pesecs[2].SizeOfRawData > 20480 and pesecs[2].SizeOfRawData < 28672 then
  return mp.INFECTED
end
return mp.CLEAN
