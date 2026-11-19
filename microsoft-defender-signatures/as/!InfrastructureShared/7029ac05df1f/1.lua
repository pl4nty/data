-- Threat: !InfrastructureShared
-- Name: 7029ac05df1f
-- Type: 21

if mp.getfilesize() < 400 then
  return mp.INFECTED
end
return mp.CLEAN
