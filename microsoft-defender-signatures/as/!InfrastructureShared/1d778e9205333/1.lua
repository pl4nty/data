-- Threat: !InfrastructureShared
-- Name: 1d778e9205333
-- Type: 21

if mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
