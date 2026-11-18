-- Threat: !InfrastructureShared
-- Name: f4781d879b6c
-- Type: 21

if mp.getfilesize() < 60000 then
  return mp.INFECTED
end
return mp.CLEAN
