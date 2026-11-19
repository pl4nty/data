-- Threat: !InfrastructureShared
-- Name: e47850125c4a
-- Type: 21

if mp.getfilesize() < 1048576 then
  return mp.INFECTED
end
return mp.CLEAN
