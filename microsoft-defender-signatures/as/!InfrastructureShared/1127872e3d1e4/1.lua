-- Threat: !InfrastructureShared
-- Name: 1127872e3d1e4
-- Type: 21

if pehdr.Magic == 523 then
  return mp.INFECTED
end
return mp.CLEAN
