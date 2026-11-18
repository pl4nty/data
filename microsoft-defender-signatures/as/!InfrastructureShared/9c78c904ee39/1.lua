-- Threat: !InfrastructureShared
-- Name: 9c78c904ee39
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
