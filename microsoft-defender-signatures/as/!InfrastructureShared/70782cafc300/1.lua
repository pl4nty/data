-- Threat: !InfrastructureShared
-- Name: 70782cafc300
-- Type: 21

if mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
