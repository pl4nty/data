-- Threat: !InfrastructureShared
-- Name: e778745fa4f7
-- Type: 21

if mp.getfilesize() < 49152 then
  return mp.INFECTED
end
return mp.CLEAN
