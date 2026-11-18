-- Threat: !InfrastructureShared
-- Name: 1c778bea2a9a5
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 or peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
