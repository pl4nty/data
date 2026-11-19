-- Threat: !InfrastructureShared
-- Name: 75402971bc0f
-- Type: 21

if mp.getfilesize() > 20480 then
  return mp.CLEAN
end
return mp.INFECTED
