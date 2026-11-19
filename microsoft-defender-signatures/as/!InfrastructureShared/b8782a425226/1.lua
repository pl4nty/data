-- Threat: !InfrastructureShared
-- Name: b8782a425226
-- Type: 21

if pehdr.NumberOfSections == 2 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
