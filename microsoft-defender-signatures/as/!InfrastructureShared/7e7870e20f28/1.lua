-- Threat: !InfrastructureShared
-- Name: 7e7870e20f28
-- Type: 21

if pehdr.NumberOfSections == 6 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
