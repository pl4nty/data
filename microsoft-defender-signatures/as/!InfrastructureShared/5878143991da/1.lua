-- Threat: !InfrastructureShared
-- Name: 5878143991da
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 or peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
