-- Threat: !InfrastructureShared
-- Name: 4478446b22e0
-- Type: 21

if mp.getfilesize() < 4500000 then
  return mp.INFECTED
end
return mp.CLEAN
