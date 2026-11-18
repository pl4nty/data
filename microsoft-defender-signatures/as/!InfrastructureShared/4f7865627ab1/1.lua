-- Threat: !InfrastructureShared
-- Name: 4f7865627ab1
-- Type: 21

if mp.getfilesize() < 229376 then
  return mp.INFECTED
end
return mp.CLEAN
