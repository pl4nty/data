-- Threat: !InfrastructureShared
-- Name: 1054053a19319
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
