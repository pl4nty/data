-- Threat: !InfrastructureShared
-- Name: a1782849eb20
-- Type: 21

if pehdr.Subsystem == 3 then
  return mp.INFECTED
end
return mp.CLEAN
