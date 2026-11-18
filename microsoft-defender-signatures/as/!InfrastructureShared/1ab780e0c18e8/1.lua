-- Threat: !InfrastructureShared
-- Name: 1ab780e0c18e8
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 or peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
