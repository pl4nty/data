-- Threat: !InfrastructureShared
-- Name: 11978e4104d9d
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 or peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
