-- Threat: !InfrastructureShared
-- Name: e58fb1a9fe65
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
