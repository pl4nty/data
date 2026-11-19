-- Threat: !InfrastructureShared
-- Name: 9b61e8bbe53c
-- Type: 21

if mp.get_mpattribute("NID:Win32/Sednit") and peattributes.no_security == true and pehdr.NumberOfSections == 9 then
  return mp.INFECTED
end
return mp.CLEAN
