-- Threat: !InfrastructureShared
-- Name: fe414bf1b362
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
