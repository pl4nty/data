-- Threat: !InfrastructureShared
-- Name: 4878f69c970d
-- Type: 21

if pehdr.NumberOfSections == 3 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
