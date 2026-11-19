-- Threat: !InfrastructureShared
-- Name: 3f78a8c67a09
-- Type: 21

if pehdr.BaseOfData == 0 and pehdr.SizeOfInitializedData == 0 and pehdr.SizeOfUninitializedData == 0 and pehdr.SizeOfCode == 0 and hstrlog[1].VA - pehdr.ImageBase - pesecs[1].VirtualAddress == 4336 then
  return mp.INFECTED
end
return mp.CLEAN
