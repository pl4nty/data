-- Threat: !InfrastructureShared
-- Name: 6b787595b881
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
