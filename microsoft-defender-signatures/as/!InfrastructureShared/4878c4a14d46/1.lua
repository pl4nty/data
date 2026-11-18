-- Threat: !InfrastructureShared
-- Name: 4878c4a14d46
-- Type: 21

if 4198400 == pehdr.ImageBase + pehdr.AddressOfEntryPoint and peattributes.isexe and pehdr.NumberOfSections > 3 then
  return mp.INFECTED
end
return mp.CLEAN
