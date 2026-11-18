-- Threat: !InfrastructureShared
-- Name: 4e782d0a8994
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
