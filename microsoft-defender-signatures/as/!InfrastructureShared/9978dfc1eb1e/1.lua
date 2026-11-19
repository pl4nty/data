-- Threat: !InfrastructureShared
-- Name: 9978dfc1eb1e
-- Type: 21

if mp.getfilesize() <= 184320 and mp.getfilesize() >= 10240 then
  return mp.INFECTED
end
return mp.CLEAN
