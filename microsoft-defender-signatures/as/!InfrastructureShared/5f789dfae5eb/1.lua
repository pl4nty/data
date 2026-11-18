-- Threat: !InfrastructureShared
-- Name: 5f789dfae5eb
-- Type: 21

if pehdr.NumberOfSymbols > 80 and pehdr.NumberOfSections > 10 then
  return mp.INFECTED
end
return mp.CLEAN
