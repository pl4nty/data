-- Threat: !InfrastructureShared
-- Name: 33785af6465e
-- Type: 21

if mp.getfilesize() < 2000000 then
  return mp.INFECTED
end
return mp.CLEAN
