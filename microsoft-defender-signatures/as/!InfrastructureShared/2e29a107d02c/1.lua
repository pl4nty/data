-- Threat: !InfrastructureShared
-- Name: 2e29a107d02c
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
