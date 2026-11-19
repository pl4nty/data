-- Threat: !InfrastructureShared
-- Name: 6c784392d503
-- Type: 21

if pehdr.Magic == 523 then
  return mp.INFECTED
end
return mp.CLEAN
