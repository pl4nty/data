-- Threat: !InfrastructureShared
-- Name: b978478f7620
-- Type: 21

if mp.getfilesize() <= 100000 then
  return mp.INFECTED
end
return mp.CLEAN
