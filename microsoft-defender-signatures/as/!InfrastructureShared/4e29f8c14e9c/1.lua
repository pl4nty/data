-- Threat: !InfrastructureShared
-- Name: 4e29f8c14e9c
-- Type: 21

if mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
