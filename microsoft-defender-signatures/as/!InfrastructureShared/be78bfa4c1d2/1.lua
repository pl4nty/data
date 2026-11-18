-- Threat: !InfrastructureShared
-- Name: be78bfa4c1d2
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
