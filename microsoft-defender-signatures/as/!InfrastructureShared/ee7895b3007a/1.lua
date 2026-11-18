-- Threat: !InfrastructureShared
-- Name: ee7895b3007a
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
