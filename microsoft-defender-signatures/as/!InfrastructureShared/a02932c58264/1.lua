-- Threat: !InfrastructureShared
-- Name: a02932c58264
-- Type: 21

if mp.getfilesize() <= 2048 then
  return mp.INFECTED
end
return mp.CLEAN
