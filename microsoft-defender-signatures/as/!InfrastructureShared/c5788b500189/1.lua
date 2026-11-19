-- Threat: !InfrastructureShared
-- Name: c5788b500189
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
