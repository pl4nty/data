-- Threat: !InfrastructureShared
-- Name: 62789cb8a82e
-- Type: 21

if mp.getfilesize() > 300000 then
  return mp.CLEAN
end
return mp.INFECTED
