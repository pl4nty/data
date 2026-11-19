-- Threat: !InfrastructureShared
-- Name: 5378a85c63d4
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
