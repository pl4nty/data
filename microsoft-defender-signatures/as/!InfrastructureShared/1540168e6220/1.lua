-- Threat: !InfrastructureShared
-- Name: 1540168e6220
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
