-- Threat: !InfrastructureShared
-- Name: 45401e39afcd
-- Type: 21

if pehdr.Subsystem ~= 1 then
  return mp.INFECTED
end
return mp.CLEAN
