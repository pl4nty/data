-- Threat: !InfrastructureShared
-- Name: 50298fe8d0bb
-- Type: 21

if mp.getfilesize() <= 54272 and mp.getfilesize() >= 46080 then
  return mp.INFECTED
end
return mp.CLEAN
