-- Threat: !InfrastructureShared
-- Name: 1878b37abbdf
-- Type: 21

if pehdr.NumberOfSections ~= 4 or peattributes.epinfirstsect == false or pesecs[2].SizeOfRawData ~= 40960 or pesecs[2].Name ~= ".data1" or hstrlog[1].VA ~= pehdr.ImageBase + pehdr.AddressOfEntryPoint then
  return mp.CLEAN
end
return mp.INFECTED
