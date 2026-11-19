-- Threat: !InfrastructureShared
-- Name: 527895c44054
-- Type: 21

if pehdr.NumberOfSections == 4 and pesecs[4].SizeOfRawData == 75776 and pesecs[4].PointerToRawData == 91648 then
  return mp.INFECTED
end
return mp.CLEAN
