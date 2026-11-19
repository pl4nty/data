-- Threat: !InfrastructureShared
-- Name: fb78980e7ac8
-- Type: 21

if pehdr.NumberOfSections == 14 and peattributes.isexe == true and pehdr.AddressOfEntryPoint == 435072 and pesecs[4].Name == "/4" then
  return mp.INFECTED
end
return mp.CLEAN
