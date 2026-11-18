-- Threat: !InfrastructureShared
-- Name: 95617e9ca5be
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
