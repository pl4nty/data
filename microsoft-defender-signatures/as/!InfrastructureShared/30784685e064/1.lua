-- Threat: !InfrastructureShared
-- Name: 30784685e064
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
