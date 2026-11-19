-- Threat: !InfrastructureShared
-- Name: fc78155c871f
-- Type: 21

if pehdr.NumberOfSections > 6 then
  return mp.SUSPICIOUS
end
return mp.CLEAN
