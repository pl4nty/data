-- Threat: !InfrastructureShared
-- Name: 10d78c8f80e7c
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
