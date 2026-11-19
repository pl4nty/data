-- Threat: !InfrastructureShared
-- Name: 4961e841b00d
-- Type: 21

if mp.HSTR_WEIGHT == 2 and pesecs[2].PointerToRawData == 2701144064 and pesecs[2].PointerToRawData > pehdr.SizeOfImage then
  return mp.INFECTED
end
return mp.CLEAN
