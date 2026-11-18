-- Threat: !InfrastructureShared
-- Name: be41f03e2170
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
