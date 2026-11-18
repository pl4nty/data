-- Threat: !InfrastructureShared
-- Name: 89780e2709ad
-- Type: 21

if peattributes.isvbnative == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
