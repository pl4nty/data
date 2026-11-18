-- Threat: !InfrastructureShared
-- Name: 6678f4699c53
-- Type: 21

if pehdr.NumberOfSections == 9 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
